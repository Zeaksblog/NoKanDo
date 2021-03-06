if ( GetLocale() ~= "enUS" ) then return end

local addon, ns = ...
ns.L = {
	-- Stat Localization
    ["Mastery"] = "Mastery",
    ["Item Level"] = "Item Level",
    ["Strength"] = "Strength",
	["Str"] = "Str",
    ["Agility"] = "Agility",
	["Agi"] = "Agi",
    ["Stamina"] = "Stamina",
	["Sta"] = "Sta",
    ["Intellect"] = "Intellect",
	["Int"] = "Int",
    ["Spirit"] = "Spirit",
	["Spi"] = "Spi",
    ["Melee Damage"] = "Melee Damage",
	["Melee Dmg"] = "Melee Dmg",
    ["Melee DPS"] = "Melee DPS",
    ["Melee Attack Power"] = "Melee Attack Power",
	["Melee AP"] = "Melee AP",
    ["Melee Attack Speed"] = "Melee Attack Speed",
	["Melee Speed"] = "Melee Speed",
    ["Haste"] = "Haste",
    ["Hit Chance"] = "Hit Chance",
	["%Hit"] = "%Hit",
    ["Critical Chance"] = "Critical Chance",
	["%Crit"] = "%Crit",
    ["Expertise"] = "Expertise",
	["Power Regen"] = "Power Regen",
	["Regen"] = "Regen",
    ["Ranged Damage"] = "Ranged Damage",
	["Rng Dmg"] = "Rng Dmg",
    ["Ranged DPS"] = "Ranged DPS",
	["Rng DPS"] = "Rng DPS",
    ["Ranged Attack Power"] = "Ranged Attack Power",
	["Rng AP"] = "Rng AP",
    ["Ranged Attack Speed"] = "Ranged Attack Speed",
	["Rng Speed"] = "Rng Speed",
    ["Ranged Critical Chance"] = "Ranged Critical Chance",
	["Rng %Crit"] = "Rng %Crit",
    ["Ranged Hit Chance"] = "Ranged Hit Chance",
	["Rng %Hit"] = "Rng %Hit",
    ["Ranged Haste"] = "Ranged Haste",
	["Rng Haste"] = "Rng Haste",
    ["Spell Damage"] = "Spell Damage",
	["Spell Dmg"] = "Spell Dmg",
    ["Spell Healing"] = "Spell Healing",
	["Spell Heal"] = "Spell Heal",
    ["Spell Haste"] = "Spell Haste",
    ["Spell Hit Chance"] = "Spell Hit Chance",
	["Spell %Hit"] = "Spell %Hit",
    ["Spell Penetration"] = "Spell Penetration",
	["Spell Pen"] = "Spell Pen",
    ["Mana Regen (Base)"] = "Mana Regen (Base)",
	["MP5 (Base)"] = "MP5 (Base)",
    ["Mana Regen (Cast)"] = "Mana Regen (Cast)",
	["MP5 (Cast)"] = "MP5 (Cast)",
    ["Spell Critical Chance"] = "Spell Critical Chance",
	["Spell %Crit"] = "Spell %Crit",
	["Armor"] = "Armor",
	["Armor Reduction"] = "Armor Reduction",
	["Armor (-)"] = "Armor (-)",
	["Dodge"] = "Dodge",
	["Parry"] = "Parry",
	["Block"] = "Block",
	["Resilience Reduction"] = "Resilience Reduction",
	["Res (-)"] = "Res (-)",
	["Resilience Critical"] = "Resilience Critical",
	["Res Crit"] = "Res Crit",
	["PvP Resilience"] = "PvP Resilience",
	["PvP Resil"] = "PvP Resil",
	["PvP Power"] = "PvP Power",
	["PvP Pwr"] = "PvP Pwr",
    ["Arcane (Resist)"] = "Arcane",
	["(R)Arcane"] = "(R)Arcane",
    ["Fire (Resist)"] = "Fire",
	["(R)Fire"] = "(R)Fire",
    ["Frost (Resist)"] = "Frost",
	["(R)Frost"] = "(R)Frost",
    ["Nature (Resist)"] = "Nature",
	["(R)Nature"] = "(R)Nature",
    ["Shadow (Resist)"] = "Shadow",
	["(R)Shadow"] = "(R)Shadow",
	
	-- AddOn Stuff
	["Horizontal"] = "Horizontal",
	["Vertical"] = "Vertical",
	["N/A"] = "N/A",	
	["Enabled"] = "Enabled",
	["Global Font"] = "Global Font",
	["Outline"] = "Outline",
	["Force Shown"] = "Force Shown",
	["Block Count"] = "Block Count",
	["Font Size"] = "Font Size",
	["Font"] = "Font",
	["Justify"] = "Justify",
	["Parent"] = "Parent",
	["Anchor"] = "Anchor",
	["X Offset"] = "X Offset",
	["Y Offset"] = "Y Offset",
	["Frame Strata"] = "Frame Strata",
	["Stat Block 1"] = "Stat Block 1",
	["Stat Block 2"] = "Stat Block 2",
	["Stat Block 3"] = "Stat Block 3",
	["Stat Block 4"] = "Stat Block 4",
	["Stat Block 5"] = "Stat Block 5",
	["Block Orientation"] = "Block Orientation",
}