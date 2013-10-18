--[[ 		     SLDataText Module: StatLine    		]]
--[[ Author: Taffu  RevDate: 09/01/2012  Version: 1.0.2 ]]

-- Revised expertise to reflect a logical decimal number

local _, ns = ...
local SLDT, MODNAME, SML, L = SLDataText, "StatLine", LibStub("LibSharedMedia-3.0"), ns.L
if ( SLDT ) then SLDT.StatLine = CreateFrame("Frame") end
local db, frame, text, tool, tip

local statTbl, handler, orientTbl = {}, {}, { [1] = L["Horizontal"], [2] = L["Vertical"] }
local rCol, gCol = RED_FONT_COLOR_CODE, GREEN_FONT_COLOR_CODE
local statSelTbl = {
	[1] = L["Mastery"],
    [2] = L["Item Level"],
    [3] = L["Strength"],
    [4] = L["Agility"],
    [5] = L["Stamina"],
    [6] = L["Intellect"],
    [7] = L["Spirit"],
    [8] = L["Melee Damage"],
    [9] = L["Melee DPS"],
    [10] = L["Melee Attack Power"],
    [11] = L["Melee Attack Speed"],
    [12] = L["Haste"],
    [13] = L["Hit Chance"],
    [14] = L["Critical Chance"],
    [15] = L["Expertise"],
    [16] = L["Power Regen"],
    [17] = L["Ranged Damage"],
    [18] = L["Ranged DPS"],
    [19] = L["Ranged Attack Power"],
    [20] = L["Ranged Attack Speed"],
    [21] = L["Ranged Critical Chance"],
    [22] = L["Ranged Hit Chance"],
    [23] = L["Ranged Haste"],
    [24] = L["Spell Damage"],
    [25] = L["Spell Healing"],
    [26] = L["Spell Haste"],
    [27] = L["Spell Hit Chance"],
    [28] = L["Spell Penetration"],
    [29] = L["Mana Regen (Base)"],
    [30] = L["Mana Regen (Cast)"],
    [31] = L["Spell Critical Chance"],
	[32] = L["Armor"],
	[33] = L["Armor Reduction"],
	[34] = L["Dodge"],
	[35] = L["Parry"],
	[36] = L["Block"],
	[37] = L["Resilience Reduction"],
	[38] = L["PvP Resilience"],
	[39] = L["PvP Power"],
    [40] = L["Arcane (Resist)"],
    [41] = L["Fire (Resist)"],
    [42] = L["Frost (Resist)"],
    [43] = L["Nature (Resist)"],
    [44] = L["Shadow (Resist)"],
}

local function formatStat(base, posBuff, negBuff)
    local effective, textString = max(0, base + posBuff + negBuff), ""
    if ( ( posBuff == 0 ) and ( negBuff == 0 ) ) then
        textString = effective
    else
        if ( negBuff < 0 ) then
            textString = string.format("%s%s|r", rCol, effective)
        else
            textString = string.format("%s%s|r", gCol, effective)
        end
    end
	return textString
end

local statInfo = {
    [L["Mastery"]] = {
		prefix = "Mastery", updateFunc = function()			 
			local mastery = GetMastery()
			return string.format("%.2f", mastery)
		end,
	},
    [L["Item Level"]] = {
		prefix = "iLevel", updateFunc = function()
			local avgItemLevel = GetAverageItemLevel()
			return string.format("%i", floor(avgItemLevel))
		end,
	},
    [L["Strength"]] = {
		prefix = L["Str"], updateFunc = function()
			local stat, effectiveStat, posBuff, negBuff = UnitStat("player", 1)
			local color = "|cffffffff"
			if ( negBuff < 0 ) then
				color = rCol
			elseif ( posBuff > 0 and negBuff == 0 ) then
				color = gCol
			end
			return string.format("%s%i|r", color, effectiveStat)
		end,
	},
    [L["Agility"]] = {
		prefix = L["Agi"], updateFunc = function()
			local stat, effectiveStat, posBuff, negBuff = UnitStat("player", 2)
			local color = "|cffffffff"
			if ( negBuff < 0 ) then
				color = rCol
			elseif ( posBuff > 0 and negBuff == 0 ) then
				color = gCol
			end
			return string.format("%s%i|r", color, effectiveStat)
		end,
	},
    [L["Stamina"]] = {
		prefix = L["Sta"], updateFunc = function()
			local stat, effectiveStat, posBuff, negBuff = UnitStat("player", 3)
			local color = "|cffffffff"
			if ( negBuff < 0 ) then
				color = rCol
			elseif ( posBuff > 0 and negBuff == 0 ) then
				color = gCol
			end
			return string.format("%s%i|r", color, effectiveStat)
		end,
	},
    [L["Intellect"]] = {
		prefix = L["Int"], updateFunc = function()
			local stat, effectiveStat, posBuff, negBuff = UnitStat("player", 4)
			local color = "|cffffffff"
			if ( negBuff < 0 ) then
				color = rCol
			elseif ( posBuff > 0 and negBuff == 0 ) then
				color = gCol
			end
			return string.format("%s%i|r", color, effectiveStat)
		end,
	},
    [L["Spirit"]] = {
		prefix = L["Spi"], updateFunc = function()
			local stat, effectiveStat, posBuff, negBuff = UnitStat("player", 5)
			local color = "|cffffffff"
			if ( negBuff < 0 ) then
				color = rCol
			elseif ( posBuff > 0 and negBuff == 0 ) then
				color = gCol
			end
			return string.format("%s%i|r", color, effectiveStat)
		end,
	},
    [L["Melee Damage"]] = {
		prefix = L["Melee Dmg"], updateFunc = function()
			local speed, offhandSpeed = UnitAttackSpeed("player")
			local minDamage, maxDamage, minOffHandDamage, maxOffHandDamage, physicalBonusPos, physicalBonusNeg, percent = UnitDamage("player")
		 
			minDamage = (minDamage / percent) - physicalBonusPos - physicalBonusNeg
			maxDamage = (maxDamage / percent) - physicalBonusPos - physicalBonusNeg
		 
			local baseDamage = (minDamage + maxDamage) * 0.5
			local fullDamage = (baseDamage + physicalBonusPos + physicalBonusNeg) * percent
			local totalBonus = (fullDamage - baseDamage)
			local damagePerSecond = max(fullDamage, 1) / speed
			
			if ( totalBonus < 0.1 and totalBonus > -0.1 ) then totalBonus = 0.0 end
			
			if ( totalBonus > 0 ) then
				return string.format("%s%s-%s|r", gCol, max(floor(minDamage), 1), max(ceil(maxDamage), 1))
			elseif ( totalBonus < 0 ) then
				return string.format("%s%s-%s|r", rCol, max(floor(minDamage), 1), max(ceil(maxDamage), 1))
			else
				return string.format("%s-%s", max(floor(minDamage), 1), max(ceil(maxDamage), 1))
			end
		end,
	},
    [L["Melee DPS"]] = {
		prefix = L["Melee DPS"], updateFunc = function()
			local speed, _ = UnitAttackSpeed("player")
			local minDamage, maxDamage, _, _, physicalBonusPos, physicalBonusNeg, percent = UnitDamage("player")
		 
			minDamage = (minDamage / percent) - physicalBonusPos - physicalBonusNeg
			maxDamage = (maxDamage / percent) - physicalBonusPos - physicalBonusNeg
		 
			local baseDamage = (minDamage + maxDamage) * 0.5
			local fullDamage = (baseDamage + physicalBonusPos + physicalBonusNeg) * percent
			local totalBonus = (fullDamage - baseDamage)
			local damagePerSecond = max(fullDamage, 1) / speed
			
			if ( totalBonus < 0.1 and totalBonus > -0.1 ) then totalBonus = 0.0 end
			
			if ( totalBonus > 0 ) then
				return string.format("%s%.1f|r", gCol, damagePerSecond)
			elseif ( totalBonus < 0 ) then
				return string.format("%s%.1f|r", rCol, damagePerSecond)
			else
				return string.format("%.1f", damagePerSecond)
			end
		end,
	},
    [L["Melee Attack Power"]] = {
		prefix = L["Melee AP"], updateFunc = function()
			local base, posBuff, negBuff = UnitAttackPower("player")
			return formatStat(base, posBuff, negBuff)
		end,
	},
    [L["Melee Attack Speed"]] = {
		prefix = L["Melee Speed"], updateFunc = function()
			local speed, offhandSpeed = UnitAttackSpeed("player")
			speed = format("%.2f", speed)
			if ( offhandSpeed ) then offhandSpeed = format("%.2f", offhandSpeed) end
			if ( offhandSpeed ) then
				return speed.." / "..offhandSpeed
			else
				return speed
			end
		end,
	},
    [L["Haste"]] = {
        prefix = L["Haste"], updateFunc = function()			 
			local haste = GetMeleeHaste()
			if ( haste < 0 ) then
				return string.format("%s%.2f%%|r", rCol, haste)
			else
				return string.format("+%.2f%%", haste)
			end
		end,
    },
    [L["Hit Chance"]] = {
        prefix = L["%Hit"], updateFunc = function()
			local hitChance = GetCombatRatingBonus(6) + GetHitModifier()
			if ( hitChance >= 0 ) then
				return string.format("+%.2f%%", hitChance)
			else
				return string.format("%s%.2f%%|r", rCol, hitChance)
			end
		end,
    }, 
    [L["Critical Chance"]] = {
        prefix = L["%Crit"], updateFunc = function()
			local critChance = GetCritChance()
			return string.format("%.2f%%", critChance)
		end
    },
    [L["Expertise"]] = {
        prefix = L["Expertise"], updateFunc = function()
			local expertise, offhandExpertise = GetExpertise()
			local speed, offhandSpeed = UnitAttackSpeed("player")
			
			if( offhandSpeed ) then
				return string.format("%.1f%%/%.1f%%", expertise, offhandExpertise)
			else
				return string.format("%.1f%%", expertise)
			end
		end,
    },
	[L["Power Regen"]] = {
		prefix = L["Regen"], updateFunc = function()
			-- powerType: 0 = Mana, 1 = Rage, 2 = Focus, 3 = Energy, 6 = Runic Power
			local powerType, powerToken = UnitPowerType("player")
			if ( powerType == 2 ) then
				local regenRate = GetPowerRegen()
				return string.format("%.2f", regenRate)
			elseif ( powerType == 3 ) then
				local regenRate = GetPowerRegen()
				return format("%.2f", regenRate)
			elseif ( powerType == 6 ) then
				local _, regenRate = GetRuneCooldown(1)
				return format(STAT_RUNE_REGEN_FORMAT, regenRate)
			else
				return L["N/A"]
			end
		end,
	},
    [L["Ranged Damage"]] = {
        prefix = L["Rng Dmg"], updateFunc = function()
			local hasRelic, rngTex = UnitHasRelicSlot("player"), GetInventoryItemTexture("player", 18)
			if ( not rngTex and hasRelic ) then return "N/A" end
			
			local rangedAttackSpeed, minDamage, maxDamage, physicalBonusPos, physicalBonusNeg, percent = UnitRangedDamage("player")
			percent = math.floor(percent  * 10^3 + 0.5) / 10^3
			local displayMin, displayMax = max(floor(minDamage), 1), max(ceil(maxDamage), 1)
			local bDmg, fDmg, bonus, dps
			
			if ( HasWandEquipped() ) then
				bonus = 0
			else
				minDamage = (minDamage / percent) - physicalBonusPos - physicalBonusNeg
				maxDamage = (maxDamage / percent) - physicalBonusPos - physicalBonusNeg
				bDmg = (minDamage + maxDamage) * 0.5; fDmg = (bDmg + physicalBonusPos + physicalBonusNeg) * percent; bonus = (fDmg - bDmg)
			end
			
			if ( bonus == 0 ) then
				return string.format("%s-%s", displayMin, displayMax)
			else
				return string.format("%s%s-%s|r", bonus > 0 and gCol or rCol, displayMin, displayMax)
			end
		end,
    },
    [L["Ranged DPS"]] = {
        prefix = L["Rng DPS"], updateFunc = function()
			local hasRelic, rngTex = UnitHasRelicSlot("player"), GetInventoryItemTexture("player", 18)
			if ( not rngTex and hasRelic ) then return "N/A" end
		 
			local rangedAttackSpeed, minDamage, maxDamage, physicalBonusPos, physicalBonusNeg, percent = UnitRangedDamage("player")
			percent = math.floor(percent  * 10^3 + 0.5) / 10^3
			local bDmg, fDmg, bonus, dps
		 
			if ( HasWandEquipped() ) then
				bDmg = (minDamage + maxDamage) * 0.5; fDmg = bDmg * percent; bonus = 0
				if ( rangedAttackSpeed == 0 ) then dps = 0 else dps = (max(fDmg, 1) / rangedAttackSpeed) end
			else
				minDamage = (minDamage / percent) - physicalBonusPos - physicalBonusNeg
				maxDamage = (maxDamage / percent) - physicalBonusPos - physicalBonusNeg
				bDmg = (minDamage + maxDamage) * 0.5; fDmg = (bDmg + physicalBonusPos + physicalBonusNeg) * percent; bonus = (fDmg - bDmg)
				if ( rangedAttackSpeed == 0 ) then dps = 0 else dps = (max(fDmg, 1) / rangedAttackSpeed) end
			end
			
			if ( bonus == 0 ) then
				return string.format("%.1f", dps)
			else
				return string.format("%s%.1f|r", bonus > 0 and gCol or rCol, dps)
			end
		end,
    },
    [L["Ranged Attack Power"]] = {
        prefix = L["Rng AP"], updateFunc = function()
			local base, posBuff, negBuff = UnitRangedAttackPower("player")
			return formatStat(base, posBuff, negBuff)
		end,
    },
    [L["Ranged Attack Speed"]] = {
        prefix = L["Rng Speed"], updateFunc = function()
			local hasRelic, rngTex = UnitHasRelicSlot("player"), GetInventoryItemTexture("player", 18)
			if ( not rngTex and hasRelic ) then return "N/A" end
			return string.format("%.2f", UnitRangedDamage("player"))
		end,
    },
    [L["Ranged Critical Chance"]] = {
        prefix = L["Rng %Crit"], updateFunc = function()
			local critChance = GetRangedCritChance()
			return string.format("%.2f%%", critChance)
		end,
    },
    [L["Ranged Hit Chance"]] = {
        prefix = L["Rng %Hit"], updateFunc = function()
			local hitChance = GetCombatRatingBonus(7) + GetHitModifier()
			if (hitChance >= 0) then
				return string.format("+%.2f%%", hitChance)
			else
				return string.format("%s%.2f%%|r", rCol, hitChance)
			end
		end,
    }, 
    [L["Ranged Haste"]] = {
        prefix = L["Rng Haste"], updateFunc = function()
			local haste = GetRangedHaste()
			if ( haste < 0 ) then
				return string.format("%s%.2f%%|r", rCol, haste)
			else
				return string.format("+%.2f%%", haste)
			end
		end,
    },
    [L["Spell Damage"]] = {
        prefix = L["Spell Dmg"], stat = "", updateFunc = function()
			local minModifier = GetSpellBonusDamage(2)
			for i = 3, 7 do
				local bonusDamage = GetSpellBonusDamage(i)
				minModifier = min(minModifier, bonusDamage)
			end
			return minModifier
		end,
    },
    [L["Spell Healing"]] = {
        prefix = L["Spell Heal"], updateFunc = function()
			return GetSpellBonusHealing()
		end,
    },
    [L["Spell Haste"]] = {
        prefix = L["Spell Haste"], updateFunc = function()
			local haste = UnitSpellHaste("player")
			if ( haste < 0 ) then
				return string.format("%s%.2f%%|r", rCol, haste)
			else
				return string.format("+%.2f%%", haste)
			end
		end,
    },
    [L["Spell Hit Chance"]] = {
        prefix = L["Spell %Hit"], updateFunc = function()
			local hitChance = GetCombatRatingBonus(8) + GetSpellHitModifier()
			if ( hitChance >= 0 ) then
				return string.format("+%.2f%%", hitChance)
			else
				return string.format("%s%.2f%%|r", rCol, hitChance)
			end
		end,
    },
    [L["Spell Penetration"]] = {
        prefix = L["Spell Pen"], updateFunc = function()
			return GetSpellPenetration()
		end,
    },
    [L["Mana Regen (Base)"]] = {
        prefix = L["MP5 (Base)"], updateFunc = function()
			if ( not UnitHasMana("player") ) then return "N/A" end
			local base, casting = GetManaRegen()
			return floor(base * 5.0)
		end,
    },
    [L["Mana Regen (Cast)"]] = {
        prefix = L["MP5 (Cast)"], updateFunc = function()
			if ( not UnitHasMana("player") ) then return "N/A" end
			local base, casting = GetManaRegen()
			return floor(casting * 5.0)
		end,
    },
    [L["Spell Critical Chance"]] = {
        prefix = L["Spell %Crit"], updateFunc = function()
			local minCrit = GetSpellCritChance(2)
			for i = 3, 7 do
				local spellCrit = GetSpellCritChance(i)
				minCrit = min(minCrit, spellCrit)
			end
			return string.format("%.2f%%", minCrit)
		end,
    },
    [L["Armor"]] = {
        prefix = L["Armor"], updateFunc = function()
			local base, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player")
			return formatStat(base, posBuff, negBuff)
		end,
    },
    [L["Armor Reduction"]] = {
        prefix = L["Armor (-)"], updateFunc = function()
			local levelModifier, armor = UnitLevel("player"), select(2, UnitArmor("player"))
			if ( levelModifier > 80 ) then
				levelModifier = levelModifier + (4.5 * (levelModifier-59)) + (20 * (levelModifier - 80))
			elseif ( levelModifier > 59 ) then
				levelModifier = levelModifier + (4.5 * (levelModifier-59))
			end
			local temp = 0.1*armor/(8.5*levelModifier + 40)
			temp = temp/(1+temp)
		 
			if ( temp > 0.75 ) then return 75 end
		 
			if ( temp < 0 ) then return 0 end
		 
			return string.format("%.2f%%", temp*100)
		end,
    },
    [L["Dodge"]] = {
        prefix = L["Dodge"], updateFunc = function()			 
			local chance = GetDodgeChance()
			return string.format("%.02f%%", chance)
		end,
    },
    [L["Parry"]] = {
        prefix = L["Parry"], updateFunc = function()			 
			local chance = GetParryChance()
			return string.format("%.02f%%", chance)
		end,
    },
    [L["Block"]] = {
        prefix = L["Block"], updateFunc = function()		 
			local chance = GetBlockChance()
			return string.format("%.02f%%", chance)
		end,
    },
    [L["Resilience Reduction"]] = {
        prefix = L["Res (-)"], updateFunc = function()
			return GetCombatRating(16)
		end,
    },
	[L["PvP Resilience"]] = {
        prefix = L["PvP Resil"], updateFunc = function()
			local ratingBonus = GetCombatRatingBonus(16)
			local damageReduction = ratingBonus + GetModResilienceDamageReduction()
			return string.format("%.2f%%", damageReduction)
		end,
    },
	[L["PvP Power"]] = {
        prefix = L["PvP Pwr"], updateFunc = function()
			local pvpPowerBonus = GetCombatRatingBonus(27)
			return string.format("%.2f%%", pvpPowerBonus)
		end,
    },
    [L["Arcane (Resist)"]] = {
        prefix = L["(R)Arcane"], updateFunc = function()
			local base, resistance, positive, negative = UnitResistance("player", 6)
			local resistanceIconCode = "|TInterface\\PaperDollInfoFrame\\SpellSchoolIcon"..(7)..":0|t"
			return formatStat(base, positive, negative)
		end,
    },
    [L["Fire (Resist)"]] = {
        prefix = L["(R)Fire"], updateFunc = function()
			local base, resistance, positive, negative = UnitResistance("player", 2)
			local resistanceIconCode = "|TInterface\\PaperDollInfoFrame\\SpellSchoolIcon"..(3)..":0|t"
			return formatStat(base, positive, negative)
		end,
    },
    [L["Nature (Resist)"]] = {
        prefix = L["(R)Nature"], updateFunc = function()
			local base, resistance, positive, negative = UnitResistance("player", 3)
			local resistanceIconCode = "|TInterface\\PaperDollInfoFrame\\SpellSchoolIcon"..(4)..":0|t"
			return formatStat(base, positive, negative)
		end,
    },
    [L["Frost (Resist)"]] = {
        prefix = L["(R)Frost"], updateFunc = function()
			local base, resistance, positive, negative = UnitResistance("player", 4)
			local resistanceIconCode = "|TInterface\\PaperDollInfoFrame\\SpellSchoolIcon"..(5)..":0|t"
			return formatStat(base, positive, negative)
		end,
    },
    [L["Shadow (Resist)"]] = {
        prefix = L["(R)Shadow"], updateFunc = function()
			local base, resistance, positive, negative = UnitResistance("player", 5)
			local resistanceIconCode = "|TInterface\\PaperDollInfoFrame\\SpellSchoolIcon"..(6)..":0|t"
			return formatStat(base, positive, negative)
		end,
    },
}

local function SetupToolTip()
	--[[
	tool:SetScript("OnEnter", function(this)
		tip = SLT:GetTooltip("SLDT_StatLine", frame, false)
		SLT:AddHeader("SLDT_StatLine", "StatLine Title")
		
		if ( not InCombatLockdown() ) then SLT:ShowTooltip("SLDT_StatLine", frame) end
	end)
	tool:SetScript("OnLeave", function(this) SLT:ClearTooltip("SLDT_StatLine") end)
	]]
end

local function SetupStatBlock(self, i)
	self["statblock"..i] = self["statblock"..i] or {}
	self["statblock"..i].frame = self["statblock"..i].frame or CreateFrame("Frame", "SLDTStatBlock"..i, frame)
	self["statblock"..i].text = self["statblock"..i].text or self["statblock"..i].frame:CreateFontString(nil, "OVERLAY")
	
	local f, fs = self["statblock"..i].frame, self["statblock"..i].text
	f:SetBackdrop({ 
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		tile = true, tileSize = 16, edgeSize = 4,
		insets = { left = 0, top = 0, right = 0, bottom = 0 }
	})
	f:SetBackdropColor(0,0,0,0)
	f:SetClampedToScreen(true)
	f:EnableMouse(false)
	
	local font, gfont, gfontSize = SML:Fetch("font", db.font), SML:Fetch("font", SLDT.db.profile.gFont), SLDT.db.profile.gFontSize
	fs:SetFont(db.gfont and gfont or font, db.gfont and gfontSize or db.fontSize, db.outline and "THINOUTLINE" or nil)	
	if ( not db.outline ) then fs:SetShadowOffset(1, -1) else fs:SetShadowOffset(0, 0) end
	fs:ClearAllPoints(); fs:SetPoint("CENTER", f, "CENTER", 0, 0)
end

function SLDT.StatLine:Enable()
	if ( db.enabled ) then
		self:RegisterEvent("CHARACTER_POINTS_CHANGED")
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:SetScript("OnEvent", function(self, event, ...)
			if ( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then
				local source, dest, unit = select(4, ...), select(8, ...), UnitGUID("player")
				-- Only wanna update if it concerns me...
				if ( source == unit or dest == unit ) then self:Refresh() end
			else
				self:Refresh()
			end
		end)
		for i = 1, 5 do
			SetupStatBlock(self, i)
		end
	end
	self:Refresh()
end

function SLDT.StatLine:Disable()
	if ( not db.enabled ) then
		self:UnregisterEvent("CHARACTER_POINTS_CHANGED")
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:SetScript("OnEvent", nil)
	end
	self:Refresh()
end

function SLDT.StatLine:Refresh()
	if ( db.enabled ) then
		if ( not self.firstRun ) then self.firstRun = true; SLDT:UpdateBaseText(self, db) end
		
		local width, height = 0, 0
		for i = 1, db.blockCount do
			local f, fs = self["statblock"..i].frame, self["statblock"..i].text
			fs:SetText(statInfo[db["statblock"..i]].prefix .. " " .. statInfo[db["statblock"..i]].updateFunc())
			f:SetWidth(fs:GetWidth()+6)
			f:SetHeight(fs:GetHeight()+6)
			
			if ( db.blockOrient == "Vertical" ) then
				if ( i == 1 ) then
					f:ClearAllPoints()
					if ( db.aP == "LEFT" ) then
						f:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
					elseif ( db.aP == "RIGHT" ) then
						f:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
					else
						f:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
					end
					if ( not f:IsShown() ) then f:Show() end
				else
					local j = i - 1
					f:ClearAllPoints()
					if ( db.aP == "LEFT" ) then
						f:SetPoint("BOTTOMLEFT", self["statblock"..j].frame, "TOPLEFT", 0, 0)
					elseif ( db.aP == "RIGHT" ) then
						f:SetPoint("BOTTOMRIGHT", self["statblock"..j].frame, "TOPRIGHT", 0, 0)
					else
						f:SetPoint("BOTTOM", self["statblock"..j].frame, "TOP", 0, 0)
					end
					if ( not f:IsShown() ) then f:Show() end
				end
				width, height = floor(max(width, f:GetWidth())), floor(height + f:GetHeight())
			else
				if ( i == 1 ) then
					f:ClearAllPoints()
					f:SetPoint("LEFT", frame, "LEFT", 0, 0)
					if ( not f:IsShown() ) then f:Show() end
				else
					local j = i - 1
					f:ClearAllPoints()
					f:SetPoint("LEFT", self["statblock"..j].frame, "RIGHT", 0, 0)
					if ( not f:IsShown() ) then f:Show() end
				end
				width, height = floor(width + f:GetWidth()), floor(max(height, f:GetHeight()))
			end
		end
		
		-- Clean up...
		if ( db.blockCount < 5 ) then
			for i = db.blockCount + 1, 5 do
				self["statblock"..i].frame:Hide()
			end
		end
	
		-- Trick SLDT Core so it anchors, then change the frame...
		text:SetText("")
		SLDT:UpdateBaseFrame(self, db)
		-- Update the frame size to the appropriate width & height
		self.Frame:SetWidth(width)
		self.Frame:SetHeight(height)
	else
		if ( frame:IsShown() and not SLDataText.db.profile.configMode ) then frame:Hide() end
	end
end

SLDT.StatLine.optsTbl = {
	[1] = { [1] = "toggle", [2] = L["Enabled"], [3] = "enabled" },
	[2] = { [1] = "toggle", [2] = L["Global Font"], [3] = "gfont" },
	[3] = { [1] = "toggle", [2] = L["Outline"], [3] = "outline" },
	[4] = { [1] = "toggle", [2] = L["Force Shown"], [3] = "forceShow" },
	[5] = { [1] = "range", [2] = L["Font Size"], [3] = "fontSize", [4] = 6, [5] = 40, [6] = 1 },
	[6] = { [1] = "select", [2] = L["Font"], [3] = "font", [4] = SLDT.fontTbl },
	[7] = { [1] = "select", [2] = L["Justify"], [3] = "aP", [4] = SLDT.justTbl },
	[8] = { [1] = "text", [2] = L["Parent"], [3] = "anch" },
	[9] = { [1] = "select", [2] = L["Anchor"], [3] = "aF", [4] = SLDT.anchTbl },
	[10] = { [1] = "text", [2] = L["X Offset"], [3] = "xOff" },
	[11] = { [1] = "text", [2] = L["Y Offset"], [3] = "yOff" },
	[12] = { [1] = "select", [2] = L["Frame Strata"], [3] = "strata", [4] = SLDT.stratTbl },
	[13] = { [1] = "column" },
	[14] = { [1] = "range", [2] = L["Block Count"], [3] = "blockCount", [4] = 1, [5] = 5, [6] = 1 },
	[15] = { [1] = "select", [2] = L["Stat Block 1"], [3] = "statblock1", [4] = statSelTbl },
	[16] = { [1] = "select", [2] = L["Stat Block 2"], [3] = "statblock2", [4] = statSelTbl },
	[17] = { [1] = "select", [2] = L["Stat Block 3"], [3] = "statblock3", [4] = statSelTbl },
	[18] = { [1] = "select", [2] = L["Stat Block 4"], [3] = "statblock4", [4] = statSelTbl },
	[19] = { [1] = "select", [2] = L["Stat Block 5"], [3] = "statblock5", [4] = statSelTbl },
	[20] = { [1] = "select", [2] = L["Block Orientation"], [3] = "blockOrient", [4] = orientTbl },
}

function SLDT.StatLine:OnInit()
	SLDT.StatLine.db = SLDT.db:RegisterNamespace(MODNAME)
    SLDT.StatLine.db:RegisterDefaults({
        profile = {
			name = "StatLine",
			enabled = true,
			gfont = false,
			outline = false,
			forceShow = true,
			tooltipOn = true,
			blockCount = 3,
			blockOrient = "Horizontal",
			fontSize = 12,
			font = "Arial Narrow",
			aP = "CENTER",
			anch = "UIParent",
			aF = "CENTER",
			xOff = 0,
			yOff = -96,
			strata = "LOW",
			statblock1 = L["Mastery"],
			statblock2 = L["Item Level"],
			statblock3 = L["Melee DPS"],
			statblock4 = L["Haste"],
			statblock5 = L["Stamina"],
        },
    })
	db = SLDT.StatLine.db.profile
	
	SLDT:AddModule(MODNAME, db)
	frame, text, tool = SLDT:SetupBaseFrame(SLDT.StatLine)
	SetupToolTip()
	
	SLDT.StatLine:UnregisterEvent("PLAYER_ENTERING_WORLD")
	SLDT.StatLine:Enable()
end

if ( IsAddOnLoaded("SLDataText") ) then
	SLDT.StatLine:RegisterEvent("PLAYER_ENTERING_WORLD")
	SLDT.StatLine:SetScript("OnEvent", function(self, ...) self:OnInit() end)
end