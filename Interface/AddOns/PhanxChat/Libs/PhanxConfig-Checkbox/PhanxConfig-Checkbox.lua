--[[--------------------------------------------------------------------
	PhanxConfig-Checkbox
	Simple checkbox widget generator.
	Based on tekKonfig-Checkbox by Tekkub.
	Requires LibStub.

	This library is not intended for use by other authors. Absolutely no
	support of any kind will be provided for other authors using it, and
	its internals may change at any time without notice.
----------------------------------------------------------------------]]

local MINOR_VERSION = tonumber(strmatch("$Revision: 106 $", "%d+"))

local lib, oldminor = LibStub:NewLibrary("PhanxConfig-Checkbox", MINOR_VERSION)
if not lib then return end

local prototype = {}

function prototype:OnClick()
	local checked = self:GetChecked() == 1
	PlaySound(checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
	self:OnLeave()
	local handler = self.OnValueChanged or self.OnClick -- OnClick is deprecated
	if handler then
		handler(self, checked)
	end
end

function prototype:OnDisable()
	if self.disabled then return end
	local r, g, b = self.label:GetTextColor()
	self.label:SetTextColor(r / 2, g / 2, b / 2)
	self.disabled = true
end

function prototype:OnEnable()
	if not self.disabled then return end
	local r, g, b = self.label:GetTextColor()
	self.label:SetTextColor(r * 2, g * 2, b * 2)
	self.disabled = nil
end

function prototype:OnEnter()
	if self.desc then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(self.desc, nil, nil, nil, nil, true)
	end
end

function prototype:OnLeave()
	GameTooltip:Hide()
end

function prototype:GetValue()
	return self:GetChecked() == 1
end

function prototype:SetValue(value, auto)
	self:SetChecked(value)
end

function lib.CreateCheckbox(parent, text, desc)
	assert(type(parent) == "table" and type(rawget(parent, 0) == "userdata"), "PhanxConfig-Checkbox: parent must be a frame")
	if type(name) ~= "string" then name = nil end
	if type(desc) ~= "string" then desc = nil end

	local check = CreateFrame("CheckButton", nil, parent)
	check:SetSize(26, 26)
	check:SetMotionScriptsWhileDisabled(true)

	check:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
	check:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
	check:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
	check:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	check:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")

	local label = check:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	label:SetPoint("LEFT", check, "RIGHT", 2, 1)
	label:SetText(text)
	check.label = label

	check:SetHitRectInsets(0, -1 * min(186, max(label:GetStringWidth(), 100)), 0, 0)

	check.desc = desc

	for name, func in pairs(prototype) do
		check[name] = func
	end

	check:SetScript("OnClick",   check.OnClick)
	check:SetScript("OnDisable", check.OnDisable)
	check:SetScript("OnEnable",  check.OnEnable)
	check:SetScript("OnEnter",   check.OnEnter)
	check:SetScript("OnLeave",   check.OnLeave)

	return check
end