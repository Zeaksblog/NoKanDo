--[[--------------------------------------------------------------------
	PhanxChat
	Reduces chat frame clutter and enhances chat frame functionality.
	Copyright (c) 2006-2013 Phanx <addons@phanx.net>. All rights reserved.
	See the accompanying README and LICENSE files for more information.
	http://www.wowinterface.com/downloads/info6323-PhanxChat.html
	http://www.curse.com/addons/wow/phanxchat
----------------------------------------------------------------------]]

local _, PhanxChat = ...
local L = PhanxChat.L

function PhanxChat:SetShowClassColors(enable)
	if self.debug then print("PhanxChat: SetShowClassColors", enable) end
	if type(enable) == "boolean" then
		self.db.ShowClassColors = enable
	else
		enable = self.db.ShowClassColors
	end

	for i = 1, #CHAT_CONFIG_CHAT_LEFT do
		local checkbox = _G["ChatConfigChatSettingsLeftCheckBox"..i.."ColorClasses"]
		if checkbox then
			checkbox:SetChecked(enable)
			checkbox:Disable()
			checkbox:SetMotionScriptsWhileDisabled(true)
			checkbox.tooltip = format(L.OptionLocked, L.ShowClassColors)
		end
		ToggleChatColorNamesByClassGroup(enable, CHAT_CONFIG_CHAT_LEFT[i].type)
	end

	for i = 1, 50 do
		local checkbox = _G["ChatConfigChannelSettingsLeftCheckBox"..i.."ColorClasses"]
		if checkbox then
			checkbox:SetChecked(enable)
			checkbox:Disable()
			checkbox:SetMotionScriptsWhileDisabled(true)
			checkbox.tooltip = format(L.OptionLocked, L.ShowClassColors)
		end
		ToggleChatColorNamesByClassGroup(enable, "CHANNEL"..i)
	end
end

tinsert(PhanxChat.RunOnLoad, PhanxChat.SetShowClassColors)

hooksecurefunc("ChatConfig_UpdateCheckboxes", function(frame)
	if frame == ChatConfigChatSettingsLeft or frame == ChatConfigChannelSettingsLeft then
		PhanxChat:SetShowClassColors()
	end
end)