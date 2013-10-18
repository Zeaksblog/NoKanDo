--[[ 		 SLDataText Module: CombatMonitor 			]]
--[[ Author: Taffu  RevDate: 01/14/2012  Version: 1.0.1 ]]

local SLDT, MODNAME, SLT = SLDataText, "CombatMonitor", LibStub("LibSLTip-1.0")
if ( SLDT ) then SLDT.CombatMonitor = CreateFrame("Frame") end
local db, frame, text, tool, tip

local DPS, HPS, damage, heals, combatTime, inCombat = 0, 0, 0, 0, 0, false
local highEncDPS, highEncHPS, oHeals, oHPS = 0, 0, 0, 0
local GetTime = GetTime
local dmgEvents = {
	SWING_DAMAGE = true,
	RANGE_DAMAGE = true,
	SPELL_DAMAGE = true,
	SPELL_PERIODIC_DAMAGE = true,
	DAMAGE_SHIELD = true,
	DAMAGE_SPLIT = true,
}
local hpsEvents = {
	SPELL_HEAL = true,
	SPELL_PERIODIC_HEAL = true,
}

local function SetupToolTip()
	tool:SetScript("OnEnter", function(this)
		tip = SLT:GetTooltip("SLDT_DPS", true)
		local subHdr = nil
		if ( db.display == "DPS" and highEncDPS > 0 ) then
			subHdr = string.format("High DPS (Last): %.1f", highEncDPS)
		elseif ( db.display == "HPS" and highEncHPS > 0 ) then
			subHdr = string.format("High HPS (Last): %.1f", highEncHPS)
		end
		SLT:AddHeader("SLDT_DPS", db.display, subHdr)
		
		if ( db.display == "DPS" ) then
			if ( db.highDPS > 0 ) then
				local line = string.format("%.1f", db.highDPS)
				SLT:AddDoubleLine("SLDT_DPS", "High DPS:", line, nil, nil, true, function() db.highDPS = 0; SLT:ClearTooltip("SLDT_DPS"); SLDT.CombatMonitor:Refresh() end)
			end
			if ( db.highHit > 0 ) then
				local line = string.format("%i", db.highHit)
				SLT:AddDoubleLine("SLDT_DPS", "High Hit:", line, nil, nil, true, function() db.highHit = 0; db.highHitSpell = nil; SLT:ClearTooltip("SLDT_DPS"); SLDT.CombatMonitor:Refresh() end)
				SLT:AddDoubleLine("SLDT_DPS", "High Hit Spell:", db.highHitSpell)
			end
		elseif ( db.display == "HPS" ) then
			if ( oHPS > 0 ) then
				local line = string.format("%.0f%%", oHPS)
				SLT:AddDoubleLine("SLDT_DPS", "Overhealing:", line, nil, nil, true, function() oHPS = 0; SLT:ClearTooltip("SLDT_DPS"); SLDT.CombatMonitor:Refresh() end)
			end
			if ( db.highHPS > 0 ) then
				local line = string.format("%.1f", db.highHPS)
				SLT:AddDoubleLine("SLDT_DPS", "High HPS:", line, nil, nil, true, function() db.highHPS = 0; SLT:ClearTooltip("SLDT_DPS"); SLDT.CombatMonitor:Refresh() end)
			end
			if ( db.highHeal > 0 ) then
				local line = string.format("%i", db.highHeal)
				SLT:AddDoubleLine("SLDT_DPS", "High Heal:", line, nil, nil, true, function() db.highHeal = 0; db.highHealSpell = nil; SLT:ClearTooltip("SLDT_DPS"); SLDT.CombatMonitor:Refresh() end)
				SLT:AddDoubleLine("SLDT_DPS", "High Heal Spell:", db.highHealSpell)
			end
		end
		SLT:AddFooter("SLDT_DPS", "Click to clear saved values")
		SLT:AddFooter("SLDT_DPS", "Alt+Click module to show DPS")
		SLT:AddFooter("SLDT_DPS", "Shift+Click module to show HPS")
		if ( not InCombatLockdown() ) then SLT:ShowTooltip("SLDT_DPS", frame) end
	end)
	tool:SetScript("OnLeave", function(this) SLT:ClearTooltip("SLDT_DPS") end)
	tool:SetScript("OnMouseDown", function(this, button)
		if ( IsShiftKeyDown() ) then
			db.display = "HPS"
			SLT:ClearTooltip("SLDT_DPS")
			SLDT.CombatMonitor:Refresh()
		elseif ( IsAltKeyDown() ) then
			db.display = "DPS"
			SLT:ClearTooltip("SLDT_DPS")
			SLDT.CombatMonitor:Refresh()
		end
	end)
end

function SLDT.CombatMonitor:COMBAT_LOG_EVENT_UNFILTERED(...)
	local eventType, id = select(2, ...), select(4, ...)
	if ( dmgEvents[eventType] ) then
		if ( id == UnitGUID("player") or id == UnitGUID("pet") ) then
			local amount = select(eventType == "SWING_DAMAGE" and 12 or 15, ...)
			local spellName = eventType == "SWING_DAMAGE" and MELEE_ATTACK or select(13, ...)
			if ( amount > db.highHit ) then
				db.highHit = amount; db.highHitSpell = spellName
			end
			damage = damage + amount
		end
	elseif ( hpsEvents[eventType] ) then
		if ( id == UnitGUID("player") or id == UnitGUID("pet") ) then
			local amount, over = select(15, ...), select(16, ...)
			local spellName = select(13, ...)
			if ( amount > db.highHeal ) then
				db.highHeal = amount; db.highHealSpell = spellName
			end
			heals = heals + amount
			oHeals = oHeals + over
		end
	end
	self:Refresh()
end

function SLDT.CombatMonitor:PLAYER_REGEN_DISABLED()
	inCombat = true
	combatTime = GetTime()
	damage, DPS, heals, HPS = 0, 0, 0, 0
	highEncDPS, highEncHPS = 0, 0
end

function SLDT.CombatMonitor:PLAYER_REGEN_ENABLED()
	inCombat = false
	SLDT.CombatMonitor:Refresh()
end

function SLDT.CombatMonitor:Enable()
	if ( db.enabled ) then
		self:RegisterEvent("PLAYER_REGEN_DISABLED")
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:SetScript("OnEvent", function(self, event, ...)
			self[event](self, ...)
		end)
	end
	self:Refresh()
end

function SLDT.CombatMonitor:Disable()
	if ( not db.enabled ) then
		self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end
	self:Refresh()
end

function SLDT.CombatMonitor:Refresh()
	if ( db.enabled or SLDataText.db.profile.configMode ) then
		if ( not self.firstRun ) then self.firstRun = true; SLDT:UpdateBaseText(SLDT.CombatMonitor, db) end
		
		DPS = damage / (GetTime() - combatTime)
		HPS = heals / (GetTime() - combatTime)
		oHPS = (100 / heals) * oHeals
		if ( DPS > db.highDPS and ((GetTime() - combatTime) > 1) ) then db.highDPS = DPS end
		if ( HPS > db.highHPS and ((GetTime() - combatTime) > 1) ) then db.highHPS = HPS end
		if ( DPS > highEncDPS and ((GetTime() - combatTime) > 1) ) then highEncDPS = DPS end
		if ( HPS > highEncHPS and ((GetTime() - combatTime) > 1) ) then highEncHPS = HPS end
		
		if ( inCombat ) then
			text:SetFormattedText("|cff%s%s:|r %.1f", SLDT.db.profile.cCol and SLDT.classColor or "ffffff", db.display, db.display == "DPS" and DPS or db.display == "HPS" and HPS)
		else
			local idle = db.display == "DPS" and (highEncDPS > 0 and string.format("%.1f", highEncDPS) or "Idle") or db.display == "HPS" and (highEncHPS > 0 and string.format("%.1f", highEncHPS) or "Idle")
			text:SetFormattedText("|cff%s%s:|r %s", SLDT.db.profile.cCol and SLDT.classColor or "ffffff", db.display, idle)
		end
		
		SLDT:UpdateBaseFrame(self, db)
	else
		if ( frame:IsShown() and not SLDataText.db.profile.configMode ) then frame:Hide() end
	end
end

SLDT.CombatMonitor.optsTbl = {
	[1] = { [1] = "toggle", [2] = "Enabled", [3] = "enabled" },
	[2] = { [1] = "toggle", [2] = "Global Font", [3] = "gfont" },
	[3] = { [1] = "toggle", [2] = "Outline", [3] = "outline" },
	[4] = { [1] = "toggle", [2] = "Force Shown", [3] = "forceShow" },
	[5] = { [1] = "toggle", [2] = "Tooltip On", [3] = "tooltipOn" },
	[6] = { [1] = "range", [2] = "Font Size", [3] = "fontSize", [4] = 6, [5] = 40, [6] = 1 },
	[7] = { [1] = "select", [2] = "Font", [3] = "font", [4] = SLDT.fontTbl },
	[8] = { [1] = "select", [2] = "Justify", [3] = "aP", [4] = SLDT.justTbl },
	[9] = { [1] = "text", [2] = "Parent", [3] = "anch" },
	[10] = { [1] = "select", [2] = "Anchor", [3] = "aF", [4] = SLDT.anchTbl },
	[11] = { [1] = "text", [2] = "X Offset", [3] = "xOff" },
	[12] = { [1] = "text", [2] = "Y Offset", [3] = "yOff" },
	[13] = { [1] = "select", [2] = "Frame Strata", [3] = "strata", [4] = SLDT.stratTbl },
}

local function OnInit()
	SLDT.CombatMonitor.db = SLDT.db:RegisterNamespace(MODNAME)
    SLDT.CombatMonitor.db:RegisterDefaults({
        profile = {
			name = "CombatMonitor",
			enabled = true,
			display = "DPS",
			highDPS = 0,
			highHPS = 0,
			highHit = 0,
			highHitSpell = nil,
			highHeal = 0,
			highHealSpell = nil,
			forceShow = true,
			aP = "CENTER",
			anch = "UIParent",
			aF = "CENTER",
			xOff = 0,
			yOff = -96,
			strata = "LOW",
			gfont = false,
			fontSize = 12,
			font = "Arial Narrow",
			outline = false,
			tooltipOn = true,
        },
    })
	db = SLDT.CombatMonitor.db.profile
	
	SLDT:AddModule(MODNAME, db)
	frame, text, tool = SLDT:SetupBaseFrame(SLDT.CombatMonitor)
	SetupToolTip()
	
	SLDT.CombatMonitor:UnregisterEvent("PLAYER_ENTERING_WORLD")
	SLDT.CombatMonitor:Enable()	
end

if ( IsAddOnLoaded("SLDataText") ) then
	SLDT.CombatMonitor:RegisterEvent("PLAYER_ENTERING_WORLD")
	SLDT.CombatMonitor:SetScript("OnEvent", OnInit)
end