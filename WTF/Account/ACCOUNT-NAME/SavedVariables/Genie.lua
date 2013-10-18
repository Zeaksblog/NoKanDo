
GenieDB = {
	["factionrealm"] = {
		["Horde - Feathermoon"] = {
			["gb"] = {
				["HaHa No Zug Zug"] = {
					{
					}, -- [1]
					{
					}, -- [2]
					{
					}, -- [3]
					{
					}, -- [4]
				},
			},
		},
	},
	["profileKeys"] = {
		["Natilya - Feathermoon"] = "Default",
		["Ovidias - Feathermoon"] = "Default",
		["Triggey - Feathermoon"] = "Default",
		["Toenails - Feathermoon"] = "Default",
		["Jae - Feathermoon"] = "Default",
		["Zeaks - Feathermoon"] = "Default",
		["Nokando - Feathermoon"] = "Default",
		["Nuggit - Feathermoon"] = "Default",
		["Olythia - Feathermoon"] = "Default",
		["Pingaling - Feathermoon"] = "Default",
		["Janacy - Feathermoon"] = "Default",
		["Zeaksherbs - Feathermoon"] = "Default",
		["Buckroger - Feathermoon"] = "Default",
	},
	["global"] = {
		["color"] = {
			["bool"] = {
				["a"] = 1,
				["b"] = 0.8705882352941177,
				["g"] = 0.6901960784313725,
				["r"] = 0.9372549019607843,
			},
			["string"] = {
				["a"] = 1,
				["b"] = 0.4,
				["g"] = 0.9372549019607843,
				["r"] = 0.8862745098039215,
			},
			["disabled"] = {
				["a"] = 1,
				["b"] = 0.3686274509803922,
				["g"] = 0.3686274509803922,
				["r"] = 0.3686274509803922,
			},
			["family"] = {
				["a"] = 1,
				["b"] = 0.4431372549019608,
				["g"] = 0.4431372549019608,
				["r"] = 0.9686274509803922,
			},
			["combined"] = {
				["a"] = 1,
				["b"] = 1,
				["g"] = 0.6588235294117647,
				["r"] = 0.5372549019607843,
			},
			["number"] = {
				["a"] = 1,
				["b"] = 0.8666666666666667,
				["g"] = 0.9372549019607843,
				["r"] = 0.5019607843137255,
			},
			["editHighlight"] = {
				["a"] = 0.5100000202655792,
				["b"] = 0.8941176470588235,
				["g"] = 1,
				["r"] = 0.4509803921568628,
			},
		},
		["GB_Delay"] = 1,
		["edit"] = false,
	},
	["profiles"] = {
		["Default"] = {
			["classranking"] = {
				{
					["enabled"] = true,
					["type"] = "bool",
					["criteria"] = "QuestItem",
					["name"] = "Quest Item",
				}, -- [1]
				{
					["enabled"] = true,
					["type"] = "bool",
					["criteria"] = "Soulbound",
					["name"] = "Soulbound",
				}, -- [2]
				{
					["enabled"] = true,
					["type"] = "number",
					["criteria"] = "Rarity",
					["max"] = 9,
					["invert"] = true,
					["name"] = "Quality",
				}, -- [3]
				{
					["enabled"] = true,
					["type"] = "number",
					["criteria"] = "TStID",
					["max"] = 9999,
					["invert"] = false,
					["name"] = "Aic",
				}, -- [4]
				{
					["enabled"] = true,
					["type"] = "string",
					["criteria"] = "EquipLoc",
					["name"] = "Equip Location",
				}, -- [5]
				{
					["enabled"] = true,
					["type"] = "string",
					["criteria"] = "Name",
					["name"] = "Name",
				}, -- [6]
				{
					["enabled"] = true,
					["type"] = "number",
					["criteria"] = "Count",
					["max"] = 9999,
					["name"] = "Count",
				}, -- [7]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "Unique",
					["invert"] = true,
					["name"] = "Unique",
				}, -- [8]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "iLvl",
					["max"] = 999,
					["name"] = "ItemLevel",
				}, -- [9]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "MinLevel",
					["max"] = 99,
					["name"] = "Minimum level",
				}, -- [10]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "StackCount",
					["max"] = 9999,
					["name"] = "Stackcount",
				}, -- [11]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "Texture",
					["name"] = "Texture",
				}, -- [12]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "Type",
					["name"] = "Type",
				}, -- [13]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "SubType",
					["name"] = "Subtype",
				}, -- [14]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "boe",
					["name"] = "Binds when equipped",
				}, -- [15]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "bop",
					["name"] = "Binds when picked up",
				}, -- [16]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "bou",
					["name"] = "Binds when used",
				}, -- [17]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "boa",
					["name"] = "Binds to account",
				}, -- [18]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "ItemID",
					["max"] = 999999,
					["invert"] = true,
					["name"] = "ItemID",
				}, -- [19]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "Price",
					["max"] = 9999999999,
					["invert"] = true,
					["name"] = "Sell price",
				}, -- [20]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "TradeskillLvl",
					["max"] = 999,
					["invert"] = true,
					["name"] = "Tradeskilllevel",
				}, -- [21]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "Tradeskill",
					["name"] = "Tradeskill",
				}, -- [22]
				{
					["enabled"] = false,
					["type"] = "family",
					["criteria"] = "<<set",
					["name"] = "Equipment sets",
				}, -- [23]
				{
					["enabled"] = false,
					["type"] = "family",
					["name"] = "healing",
					["invert"] = true,
					["criteria"] = "healing",
				}, -- [24]
				{
					["enabled"] = false,
					["type"] = "family",
					["name"] = "dps",
					["invert"] = true,
					["criteria"] = "dps",
				}, -- [25]
			},
			["date"] = 1381410621,
			["bags"] = {
				["ignore"] = {
				},
			},
			["attachTo"] = {
				["minimap"] = true,
				["tooltip"] = true,
			},
			["version"] = 50200,
			["customFamilies"] = {
				["dps"] = {
					[101867] = "Cranefeather Jerkin:5",
					[101869] = "Cranefeather Waistband:6",
					[83676] = "Steppebeast Legguards:7",
					[82574] = "Coin of Blessings:14",
					[101829] = "Warmsun Ring:12",
					[101866] = "Cranefeather Hood:1",
					[82555] = "Silentleaf Armwraps:9",
					[84607] = "Locket of the Sumprushes:2",
					[101868] = "Cranefeather Shoulders:3",
					[77530] = "Ghost Iron Dragonling:13",
					[45581] = "Orgrimmar Tabard:19",
					[83728] = "Seal of Taran Zhu:11",
					[101828] = "Warmsun Cloak:15",
					[101865] = "Cranefeather Gloves:10",
					[101863] = "Cranefeather Boots:8",
					[87419] = "Kaleiki's Lost Training Staff:16",
					["set"] = "DPS",
				},
				["healing"] = {
					[101898] = "Amaranthine Signet:11",
					[101784] = "Fire-Chanter Gloves:10",
					[101786] = "Fire-Chanter Jerkin:5",
					[101788] = "Fire-Chanter Waistband:6",
					[90010] = "Cranedancer's Staff:16",
					[83723] = "Lao-Chin's Ring:12",
					[101800] = "Amaranthine Cloak:15",
					[101781] = "Fire-Chanter Bindings:9",
					[101783] = "Fire-Chanter Britches:7",
					[101785] = "Fire-Chanter Hood:1",
					[101787] = "Fire-Chanter Shoulders:3",
					[103688] = "Contemplation of Chi-Ji:14",
					["set"] = "healing",
					[101863] = "Cranefeather Boots:8",
					[77530] = "Ghost Iron Dragonling:13",
					[83805] = "Skymage Circle:2",
				},
				["ignore"] = {
					[6948] = true,
				},
			},
		},
	},
}
