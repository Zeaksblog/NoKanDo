--[[--------------------------------------------------------------------
	PhanxChat
	Reduces chat frame clutter and enhances chat frame functionality.
	Copyright (c) 2006-2013 Phanx <addons@phanx.net>. All rights reserved.
	See the accompanying README and LICENSE files for more information.
	http://www.wowinterface.com/downloads/info6323-PhanxChat.html
	http://www.curse.com/addons/wow/phanxchat
----------------------------------------------------------------------]]

local _, PhanxChat = ...

local anchorPoints = {
	"TopLeft",
	"TopRight",
	"BottomLeft",
	"BottomRight",
	"Top",
	"Bottom",
	"Left",
	"Right",
}

------------------------------------------------------------------------

local function StartResizing(self)
	local frame = self:GetParent()
	if frame.isLocked or (frame.isDocked and frame ~= DEFAULT_CHAT_FRAME) then return end
	frame.resizing = 1
	frame:StartSizing(self.anchorPoint)
end

local function StopResizing(self)
	local frame = self:GetParent()
	frame:StopMovingOrSizing()
	frame.resizing = nil
	FCF_SavePositionAndDimensions(frame)
end

------------------------------------------------------------------------

function PhanxChat:EnableResizeEdges(frame)
	local name = frame:GetName()
	local _, _, r, g, b, a, _, locked = FCF_GetChatWindowInfo(frame:GetID())

	if not frame.resizeTopLeft then
		local bg = _G[name .. "Background"]

		for _, point in ipairs(anchorPoints) do
			local edge = CreateFrame("Button", name .. "Resize" .. point, frame)
			frame["resize" .. point] = edge

			edge.anchorPoint = point:upper()
			edge:SetWidth(20)
			edge:SetHeight(20)
			edge:SetScript("OnMouseDown", StartResizing)
			edge:SetScript("OnMouseUp", StopResizing)
			LowerFrameLevel(edge)

			edge.tex = edge:CreateTexture(nil, "BACKGROUND")
			edge.tex:SetTexture([[Interface\ChatFrame\ChatFrameBorder]])
			edge.tex:SetWidth(20)
			edge.tex:SetHeight(20)
			edge.tex:SetAllPoints(edge)
			edge.tex:SetVertexColor(r, g, b, math.min(a + 0.25, 1))

			if locked then edge:Hide() end
		end

		frame.resizeTopLeft:SetPoint("TOPLEFT", bg, -2, 2)
		frame.resizeTopLeft.tex:SetTexCoord(0, 0.25, 0, 0.125)

		frame.resizeTopRight:SetPoint("TOPRIGHT", bg, 2, 2)
		frame.resizeTopRight.tex:SetTexCoord(0.75, 1, 0, 0.125)

		frame.resizeBottomLeft:SetPoint("BOTTOMLEFT", bg, -2, -3)
		frame.resizeBottomLeft.tex:SetTexCoord(0, 0.25, 0.7265625, 0.8515625)

		frame.resizeBottomRight:SetPoint("BOTTOMRIGHT", bg, 2, -3)
		frame.resizeBottomRight.tex:SetTexCoord(0.75, 1, 0.7265625, 0.8515625)

		frame.resizeTop:SetPoint("LEFT", frame.resizeTopLeft, "RIGHT", 0, 0)
		frame.resizeTop:SetPoint("RIGHT", frame.resizeTopRight, "LEFT", 0, 0)
		frame.resizeTop.tex:SetTexCoord(0.25, 0.75, 0, 0.125)

		frame.resizeBottom:SetPoint("LEFT", frame.resizeBottomLeft, "RIGHT", 0, 0)
		frame.resizeBottom:SetPoint("RIGHT", frame.resizeBottomRight, "LEFT", 0, 0)
		frame.resizeBottom.tex:SetTexCoord(0.25, 0.75, 0.7265625, 0.8515625)

		frame.resizeLeft:SetPoint("TOP", frame.resizeTopLeft, "BOTTOM", 0, 0)
		frame.resizeLeft:SetPoint("BOTTOM", frame.resizeBottomLeft, "TOP", 0, 0)
		frame.resizeLeft.tex:SetTexCoord(0, 0.25, 0.125, 0.7265625)

		frame.resizeRight:SetPoint("TOP", frame.resizeTopRight, "BOTTOM", 0, 0)
		frame.resizeRight:SetPoint("BOTTOM", frame.resizeBottomRight, "TOP", 0, 0)
		frame.resizeRight.tex:SetTexCoord(0.75, 1, 0.125, 0.7265625)
	end

	local resizeButton = _G[name .. "ResizeButton"]

	if self.db.EnableResizeEdges then
		for _, point in ipairs(anchorPoints) do
			frame["resize" .. point]:Show()
		end

		resizeButton:SetScript("OnShow", resizeButton.Hide)
		resizeButton:Hide()
	else
		for _, point in ipairs(anchorPoints) do
			frame["resize" .. point]:Hide()
		end

		resizeButton:SetScript("OnShow", nil)
		resizeButton:Show()
	end
end

------------------------------------------------------------------------

function PhanxChat.FCF_SetWindowAlpha(frame, a, doNotSave)
	PhanxChat.hooks.FCF_SetWindowAlpha(frame, a, doNotSave)

	if not frame.resizeTopLeft then
		PhanxChat:EnableResizeEdges(frame)
	end

	local _, _, r, g, b = FCF_GetChatWindowInfo(frame:GetID())
	for _, point in ipairs(anchorPoints) do
		frame["resize" .. point].tex:SetVertexColor(r, g, b, math.min(a + 0.25, 1))
	end
end

function PhanxChat.FCF_SetWindowColor(frame, r, g, b, doNotSave)
	PhanxChat.hooks.FCF_SetWindowColor(frame, r, g, b, doNotSave)

	if not frame.resizeTopLeft then
		PhanxChat:EnableResizeEdges(frame)
	end

	local _, _, _, _, _, a = FCF_GetChatWindowInfo(frame:GetID())
	for _, point in ipairs(anchorPoints) do
		frame["resize" .. point].tex:SetVertexColor(r, g, b, math.min(a + 0.25, 1))
	end
end

function PhanxChat.SetChatWindowLocked(i, locked, ...)
	local frame = _G["ChatFrame" .. i]

	if not frame.resizeTopLeft then
		PhanxChat:EnableResizeEdges(frame)
	end

	if locked then
		for _, point in ipairs(anchorPoints) do
			frame["resize" .. point]:Hide()
		end
	else
		for _, point in ipairs(anchorPoints) do
			frame["resize" .. point]:Show()
		end
	end

	return PhanxChat.hooks.SetChatWindowLocked(i, locked, ...)
end

------------------------------------------------------------------------

function PhanxChat:SetEnableResizeEdges(v)
	if self.debug then print("PhanxChat: SetEnableResizeEdges", v) end
	if type(v) == "boolean" then
		self.db.EnableResizeEdges = v
	end

	for frame in pairs(self.frames) do
		self:EnableResizeEdges(frame)
	end

	if self.db.EnableResizeEdges then
		if not self.hooks.SetChatWindowLocked then
			self.hooks.SetChatWindowLocked = SetChatWindowLocked
			SetChatWindowLocked = self.SetChatWindowLocked
		end
		if not self.hooks.FCF_SetWindowAlpha then
			self.hooks.FCF_SetWindowAlpha = FCF_SetWindowAlpha
			FCF_SetWindowAlpha = self.FCF_SetWindowAlpha
		end
		if not self.hooks.FCF_SetWindowColor then
			self.hooks.FCF_SetWindowColor = FCF_SetWindowColor
			FCF_SetWindowColor = self.FCF_SetWindowColor
		end
	else
		if self.hooks.SetChatWindowLocked then
			SetChatWindowLocked = self.hooks.SetChatWindowLocked
			self.hooks.SetChatWindowLocked = nil
		end
		if self.hooks.FCF_SetWindowAlpha then
			FCF_SetWindowAlpha = self.hooks.FCF_SetWindowAlpha
			self.hooks.FCF_SetWindowAlpha = nil
		end
		if self.hooks.FCF_SetWindowColor then
			FCF_SetWindowColor = self.hooks.FCF_SetWindowColor
			self.hooks.FCF_SetWindowColor = nil
		end
	end
end

table.insert(PhanxChat.RunOnLoad, PhanxChat.SetEnableResizeEdges)
table.insert(PhanxChat.RunOnProcessFrame, PhanxChat.EnableResizeEdges)