--[[--------------------------------------------------------------------
	PhanxChat
	Reduces chat frame clutter and enhances chat frame functionality.
	Copyright (c) 2006-2013 Phanx <addons@phanx.net>. All rights reserved.
	See the accompanying README and LICENSE files for more information.
	http://www.wowinterface.com/downloads/info6323-PhanxChat.html
	http://www.curse.com/addons/wow/phanxchat
----------------------------------------------------------------------]]

local STRING_STYLE  = "%s|| "
	-- %s = chat string (eg. "Guild", "2. Trade") (required)
	-- Pipe characters must be escaped by doubling them: | -> ||

local CHANNEL_STYLE = "%d"
	-- %d = channel number (optional)
	-- %s = channel name (optional)
	-- Will be used with STRING_STYLE for numbered channels.

local PLAYER_STYLE  = "%s"
	-- %s = player name (required)

local NUM_LINES_TO_SCROLL = 3
	-- Lines scrolled per turn of mouse wheel

local CUSTOM_CHANNELS = {
	-- Not case-sensitive. Must be in the format:
	-- ["mychannel"] = "MC",
}

------------------------------------------------------------------------

DEFAULT_CHATFRAME_ALPHA = 0.25
	-- Opacity of chat frames when the mouse is over them.
	-- Default is 0.25.

CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
	-- Opacity of the currently selected chat tab.
	-- Defaults are 1 and 0.4.

CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0
	-- Opacity of currently alerting chat tabs.
	-- Defaults are 1 and 1.

CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0
	-- Opacity of non-selected, non-alerting chat tabs.
	-- Defaults are 0.6 and 0.2.

CHAT_FRAME_FADE_OUT_TIME = 0
	-- Seconds before fading out chat frames the mouse moves out of.
	-- Default is 2.

CHAT_TAB_HIDE_DELAY = 0
	-- Seconds before fading out chat tabs the mouse moves out of.
	-- Default is 1.

------------------------------------------------------------------------
--	Beyond here lies nothin'.
------------------------------------------------------------------------

local PHANXCHAT, PhanxChat = ...
local L, C, S = PhanxChat.L, PhanxChat.ChannelNames, PhanxChat.ShortStrings

PhanxChat.name = PHANXCHAT
PhanxChat.debug = false

PhanxChat.RunOnLoad = {}
PhanxChat.RunOnProcessFrame = {}

PhanxChat.STRING_STYLE = STRING_STYLE

local frames = {}
PhanxChat.frames = frames

local hooks = {}
PhanxChat.hooks = hooks

local noop = function() return end

local db

local format, gsub, strlower, strmatch, strsub, tonumber, type = format, gsub, strlower, strmatch, strsub, tonumber, type

------------------------------------------------------------------------

local CHANNEL_LINK   = "|h" .. format(STRING_STYLE, CHANNEL_STYLE) .. "|h"

local PLAYER_LINK    = "|Hplayer:%s|h" .. PLAYER_STYLE .. "|h"
local PLAYER_BN_LINK = "|HBNplayer:%s|h" .. PLAYER_STYLE .. "%s|h"

local ChannelNames = {
	[C.Conversation]	= S.Conversation,
	[C.General]			= S.General,
	[C.LocalDefense]	= S.LocalDefense,
	[C.LookingForGroup]	= S.LookingForGroup,
	[C.Trade]			= S.Trade,
	[C.WorldDefense]	= S.WorldDefense,
}

for name, abbr in pairs(CUSTOM_CHANNELS) do
	ChannelNames[strlower(name)] = abbr
end

-- |Hchannel:channel:2|h[2. Trade]|h |Hplayer:Konquered:1281:CHANNEL:2|h|cffbf8cffKonquered|r|h: lf 2s partner
local CHANNEL_PATTERN      = "|h%[(%d+)%.%s?([^:%-%]]+)%s?[:%-]?%s?[^|%]]*%]|h%s?"
local CHANNEL_PATTERN_PLUS = CHANNEL_PATTERN .. ".+"

local PLAYER_PATTERN = "|Hplayer:(.-)|h%[(.-)%]|h"
local BNPLAYER_PATTERN = "|HBNplayer:(.-)|h%[(|Kf(%d+).-)%](.*)|h"

local CHANNEL_PLAIN = format(STRING_STYLE, CHANNEL_STYLE)
local CHANNEL_PATTERN_PLAIN = "%[(%d+)%. ?([^:%-%]]+)[^%]]*%](.*)" -- see also CHAT_CHANNEL_SEND
hooksecurefunc("ChatEdit_UpdateHeader", function(editBox)
	if db.ShortenChannelNames and editBox:GetAttribute("chatType") == "CHANNEL" then
		local header = _G[editBox:GetName() .. "Header"]
		local text = header:GetText()
		local channelID, channelName, headerSuffix = strmatch(text, CHANNEL_PATTERN_PLAIN)
		if channelID then
			header:SetWidth(0)

			local shortName = ChannelNames[channelName] or ChannelNames[strlower(channelName)] or strsub(channelName, 1, 2)
			--print(text, "=>", channelID, channelName, "=>", shortName)
			channelName = CHANNEL_PLAIN:gsub("%%d", channelID):gsub("%%s", shortName)
			header:SetFormattedText("%s%s", channelName, headerSuffix or "")

			local headerSuffix = _G[editBox:GetName() .. "HeaderSuffix"]
			local headerWidth = (header:GetRight() or 0) - (header:GetLeft() or 0)
			local editBoxWidth = editBox:GetRight() - editBox:GetLeft()
			if headerWidth * 2 > editBoxWidth then
				header:SetWidth(editBoxWidth / 2)
				headerSuffix:Show()
				editBox:SetTextInsets(15 + header:GetWidth() + headerSuffix:GetWidth(), 13, 0, 0)
			else
				headerSuffix:Hide()
				editBox:SetTextInsets(15 + header:GetWidth(), 13, 0, 0)
			end
		end
	end
end)

local AddMessage = function(frame, message, ...)
	if type(message) == "string" then
		local channelID, channelName = strmatch(message, CHANNEL_PATTERN_PLUS)
		if channelID and db.ShortenChannelNames then
			local shortName = ChannelNames[channelName] or ChannelNames[strlower(channelName)] or strsub(channelName, 1, 2)
			message = gsub(message, CHANNEL_PATTERN, (CHANNEL_LINK:gsub("%%d", channelID):gsub("%%s", shortName)))
		end

		local playerData, playerName = strmatch(message, PLAYER_PATTERN)
		if playerData then
			if db.RemoveServerNames then
				if strmatch(playerName, "|cff") then
					playerName = gsub(playerName, "%-[^|]+", "")
				else
					playerName = strmatch(playerName, "[^%-]+")
				end
			end
			message = gsub(message, PLAYER_PATTERN, format(PLAYER_LINK, playerData, playerName))
		elseif channelID then
			-- WorldDefense messages don't have a sender; remove the extra colon and space.
			message = gsub(message, "(|Hchannel:.-|h): ", "%1", 1)
		end

		local bnData, bnName, bnID, bnExtra = strmatch(message, BNPLAYER_PATTERN)
		if bnData then
			if db.ReplaceRealNames or db.ShortenRealNames ~= "FULLNAME" then
				bnName = PhanxChat.bnetNames[tonumber(bnID) or ""] or bnName

				local toastIcon = strmatch(message, [[|TInterface\FriendsFrame\UI%-Toast%-ToastIcons]])
				-- [BN] John Doe ([WoW] Charguy) has come online. -> [WoW] Charguy has come online.
				if toastIcon then
					local gameIcon = strmatch(message, [[|TInterface\ChatFrame\UI%-ChatIcon.-|t]])
					if gameIcon then
						message = gsub(message, toastIcon, gameIcon, 1)
					end
					message = gsub(message, " %(.-%)", "", 1)
				end
			end
			local link = format(PLAYER_BN_LINK, bnData, bnName, bnExtra or "")
			message = gsub(message, BNPLAYER_PATTERN, link)
		end
	end
	hooks[frame].AddMessage(frame, message, ...)
end

------------------------------------------------------------------------

local IsControlKeyDown, IsShiftKeyDown = IsControlKeyDown, IsShiftKeyDown

local bottomButton = setmetatable({}, { __index = function(t, self)
	local button = _G[self:GetName() .. "ButtonFrameBottomButton"]
	t[self] = button
	return button
end })

function FloatingChatFrame_OnMouseScroll(self, delta)
	if delta > 0 then
		if IsShiftKeyDown() then
			self:ScrollToTop()
		elseif IsControlKeyDown() then
			self:PageUp()
		else
			for i = 1, NUM_LINES_TO_SCROLL do
				self:ScrollUp()
			end
		end
	elseif delta < 0 then
		if IsShiftKeyDown() then
			self:ScrollToBottom()
		elseif IsControlKeyDown() then
			self:PageDown()
		else
			for i = 1, NUM_LINES_TO_SCROLL do
				self:ScrollDown()
			end
		end
	end

	if db.HideButtons then
		if self:AtBottom() then
			bottomButton[self]:Hide()
		else
			bottomButton[self]:Show()
		end
	end
end

------------------------------------------------------------------------

local playerRealm = GetRealmName()

hooksecurefunc("ChatEdit_OnSpacePressed", function(editBox)
	if editBox.autoCompleteParams then
		return -- print("autoCompleteParams")
	end
	local command, message = strmatch(editBox:GetText(), "^/[tw]t (.*)")
	if command and UnitIsPlayer("target") and UnitCanCooperate("player", "target") then
		editBox:SetAttribute("chatType", "WHISPER")
		editBox:SetAttribute("tellTarget", GetUnitName("target", true):gsub("%s", ""))
		editBox:SetText(message or "")
		ChatEdit_UpdateHeader(editBox)
	end
end)

SLASH_TELLTARGET1 = "/tt"
SLASH_TELLTARGET2 = "/wt"

SlashCmdList.TELLTARGET = function(message)
	if UnitIsPlayer("target") and UnitCanCooperate("player", "target") then
		SendChatMessage(message, "WHISPER", nil, GetUnitName("target", true):gsub("%s", ""))
	elseif UnitExists("target") then
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffff00%s:|r %s", PHANXCHAT, L.Whisper_BadTarget))
	else
		DEFAULT_CHAT_FRAME:AddMessage(format("|cffffff00%s:|r %s", PHANXCHAT, L.Whisper_NoTarget))
	end
end

------------------------------------------------------------------------

function PhanxChat:ProcessFrame(frame)
	if frames[frame] then return end

	local history = {}
	for i = 1, frame:GetNumMessages() do
		local text, accessID, lineID, extraData = frame:GetMessageInfo(i)
		history[i] = text
	end
	frame:SetMaxLines(512)
	for i = 1, #history do
		frame:AddMessage(history[i])
	end

	frame:SetClampRectInsets(0, 0, 0, 0)
	frame:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
	frame:SetMinResize(200, 40)

	if self.debug then print("PhanxChat: ProcessFrame", frame:GetName()) end

	if frame ~= COMBATLOG then
		if not hooks[frame] then
			hooks[frame] = {}
		end
		if not hooks[frame].AddMessage then
			hooks[frame].AddMessage = frame.AddMessage
			frame.AddMessage = AddMessage
		end
	end

	-- #TODO: Move this to a separate module?
	if db.FontSize then
		FCF_SetChatWindowFontSize(nil, frame, db.FontSize)
	end

	if not self.isLoading then
		for _, func in ipairs(self.RunOnProcessFrame) do
			func(self, frame)
		end
	end

	frames[frame] = true
end

for i = 1, NUM_CHAT_WINDOWS do
	_G["ChatFrame" .. i]:SetClampRectInsets(0, 0, 0, 0)
end

FCF_ValidateChatFramePosition = noop

------------------------------------------------------------------------

function PhanxChat:ADDON_LOADED(addon)
	if addon ~= PHANXCHAT then return end
	if self.debug then print("PhanxChat: ADDON_LOADED") end

	self.defaults = {
		EnableArrows        = true,
		EnableResizeEdges   = true,
		EnableSticky        = "ALL", -- ALL, BLIZZARD, NONE
		FadeTime			= 1, -- minutes; 0 disables fading
		HideButtons         = true,
		HideFlash           = false,
		HideNotices         = false,
		HideRepeats         = true,
		HideTextures        = true,
		LinkURLs            = true,
		LockTabs            = true,
		MoveEditBox         = true,
		RemoveRealmNames    = true,
		ReplaceRealNames    = true,
		ShortenChannelNames = true,
		ShortenRealNames    = "FIRSTNAME", -- BATTLETAG, FIRSTNAME, FULLNAME
	}

	if not PhanxChatDB then
		PhanxChatDB = {}
	end
	self.db = PhanxChatDB
	db = PhanxChatDB -- faster access for AddMessage

	for k, v in pairs(self.defaults) do
		if type(db[k]) ~= type(v) then
			db[k] = v
		end
	end

	self.isLoading = true

	for i = 1, NUM_CHAT_WINDOWS do
		self:ProcessFrame(_G["ChatFrame" .. i])
	end

	hooks.FCF_OpenTemporaryWindow = FCF_OpenTemporaryWindow
	FCF_OpenTemporaryWindow = function(...)
		local frame = hooks.FCF_OpenTemporaryWindow(...)
		self:ProcessFrame(frame)
		return frame
	end

	for i = 1, #self.RunOnLoad do
		self.RunOnLoad[i](self)
	end

	self.isLoading = nil

	self:UnregisterEvent("ADDON_LOADED")
	self.ADDON_LOADED = nil
end

------------------------------------------------------------------------

PhanxChat.frame = CreateFrame("Frame")
PhanxChat.frame:RegisterEvent("ADDON_LOADED")
PhanxChat.frame:SetScript("OnEvent", function(self, event, ...)
	-- print("PhanxChat: " .. event)
	return PhanxChat[event] and PhanxChat[event](PhanxChat, ...)
end)

function PhanxChat:RegisterEvent(event) return self.frame:RegisterEvent(event) end
function PhanxChat:UnregisterEvent(event) return self.frame:UnregisterEvent(event) end

------------------------------------------------------------------------

_G.PhanxChat = PhanxChat

SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI