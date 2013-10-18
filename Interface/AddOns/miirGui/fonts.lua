--[[ 
 ((      /|_/|
  \\.._.'  , ,\
  /\ | '.__ v /			Addon created by Miiru - Eu Lordaron
 (_ .   /   "        
  ) _)._  _ /				Please don't change anything if you don't know what you do.
 '.\ \|( / ( 
   '' ''\\ \\
   
]]

local _, miirgui = ...




		
		
		hooksecurefunc("QuestFrameProgressItems_Update", function()
		
		QuestProgressTitleText:SetTextColor(unpack(miirgui.Color))
		QuestProgressTitleText:SetShadowColor(0,0,0,0)
		QuestProgressTitleText:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestProgressText:SetTextColor(1, 1, 1,1)
		QuestProgressText:SetShadowColor(0,0,0,0)
		QuestProgressText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		QuestProgressRequiredItemsText:SetTextColor(unpack(miirgui.Color))
		QuestProgressRequiredItemsText:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestProgressRequiredItemsText:SetShadowColor(0,0,0,0)
		QuestProgressRequiredMoneyText:SetTextColor(1, 1, 1,1)
		QuestProgressRequiredMoneyText:SetShadowColor(0,0,0,0)
		end)

		local function QuestObjectiveText()
		local numObjectives = GetNumQuestLeaderBoards()
		local objective
		local type, finished
		local numVisibleObjectives = 0
			for i = 1, numObjectives do
			_, type, finished = GetQuestLogLeaderBoard(i)
				if (type ~= "spell") then
				numVisibleObjectives = numVisibleObjectives+1
				objective = _G["QuestInfoObjective"..numVisibleObjectives]
					if ( finished ) then
						objective:SetTextColor(0, 1, 0.5, 1)
						objective:SetFont(unpack(miirgui.font),12, "OUTLINE")
						objective:SetShadowColor(0,0,0,0)
						else
						objective:SetTextColor(0.6, 0.6, 0.6)
						objective:SetFont(unpack(miirgui.font),12, "OUTLINE")
						objective:SetShadowColor(0,0,0,0)
					end
				end
			end
		end
		QuestFrameGreetingPanel:HookScript("OnShow", function()
		GreetingText:SetTextColor(1, 1, 1,1)
		GreetingText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		GreetingText:SetShadowColor(0,0,0,0)
		
		CurrentQuestsText:SetTextColor(unpack(miirgui.Color))
		CurrentQuestsText:SetShadowColor(0,0,0,0)
		CurrentQuestsText:SetFont(unpack(miirgui.font),16, "OUTLINE")
		
		AvailableQuestsText:SetTextColor(unpack(miirgui.Color))
		AvailableQuestsText:SetShadowColor(0,0,0,0)
		AvailableQuestsText:SetFont(unpack(miirgui.font),16, "OUTLINE")

		for i=1, MAX_NUM_QUESTS do
		local button = _G["QuestTitleButton"..i]
		if button:GetFontString() then
		if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
		button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffffffff"))
		button:GetFontString():SetFont(unpack(miirgui.font),13, "OUTLINE")
		button:GetFontString():SetShadowColor(0,0,0,0)
		end
		end
		end
		end)
	
		hooksecurefunc("GossipFrameUpdate", function()
		
		for i=1, NUMGOSSIPBUTTONS do
		local button = _G["GossipTitleButton"..i]

		if button:GetFontString() then
		if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
		button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffffffff"))
		button:GetFontString():SetShadowColor(0,0,0,0)
		button:GetFontString():SetFont(unpack(miirgui.font),13, "OUTLINE")
		end
		end
		end
		end)

		hooksecurefunc("QuestInfo_Display", function(template, parentFrame, acceptButton, material)

		
		QuestFont:SetTextColor(1,1,1,1)
		QuestFont:SetFont(unpack(miirgui.font),13, "OUTLINE")
		QuestFont:SetShadowColor(0,0,0,0)
		
		--QuestFont_Shadow_Small:SetTextColor(1,1,1,1)
		--QuestFont_Shadow_Small:SetShadowColor(0,0,0,0)
		--QuestFont_Shadow_Small:SetFont(unpack(miirgui.font),18, "OUTLINE")
		
		--QuestFont_Shadow_Huge:SetTextColor(1,1,1,1)
		--QuestFont_Shadow_Huge:SetShadowColor(0,0,0,0)
		
		QuestInfoDescriptionText:SetTextColor(1, 1, 1)
		QuestInfoDescriptionText:SetShadowColor(0,0,0,0)
		QuestInfoDescriptionText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoObjectivesText:SetTextColor(1, 1, 1)
		QuestInfoObjectivesText:SetShadowColor(0,0,0,0)
		QuestInfoObjectivesText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoGroupSize:SetTextColor(1, 1, 1)
		QuestInfoGroupSize:SetShadowColor(0,0,0,0)
		QuestInfoGroupSize:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoRewardText:SetTextColor(1, 1, 1)
		QuestInfoRewardText:SetShadowColor(0,0,0,0)
		QuestInfoRewardText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoTitleHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoTitleHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoTitleHeader:SetShadowColor(0,0,0,0)
			
		QuestInfoDescriptionHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoDescriptionHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoDescriptionHeader:SetShadowColor(0,0,0,0)
		
		QuestInfoRewardsHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoRewardsHeader:SetTextColor(unpack(miirgui.Color))	
		QuestInfoRewardsHeader:SetShadowColor(0, 0, 0,0)	
		
		QuestInfoObjectivesHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoObjectivesHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoObjectivesHeader:SetShadowColor(0,0,0,0)	

		
		QuestInfoItemChooseText:SetTextColor(1, 1, 1)
		QuestInfoItemChooseText:SetShadowColor(0,0,0,0)
		QuestInfoItemChooseText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoItemReceiveText:SetTextColor(1, 1, 1)
		QuestInfoItemReceiveText:SetShadowColor(0,0,0,0)
		QuestInfoItemReceiveText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoSpellLearnText:SetTextColor(1, 1, 1)
		QuestInfoSpellLearnText:SetShadowColor(0,0,0,0)
		QuestInfoSpellLearnText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoXPFrameReceiveText:SetTextColor(1, 1, 1)
		QuestInfoXPFrameReceiveText:SetShadowColor(0,0,0,0)
		QuestInfoXPFrameReceiveText:SetFont(unpack(miirgui.font),13, "OUTLINE")

		
		GreetingText:SetTextColor(1, 1, 1,1)
		GreetingText:SetShadowColor(0,0,0,0)
		GreetingText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		AvailableQuestsText:SetTextColor(unpack(miirgui.Color))
		AvailableQuestsText:SetShadowColor(0,0,0,0)
		AvailableQuestsText:SetFont(unpack(miirgui.font),16, "OUTLINE")
		
		QuestInfoSpellObjectiveLearnLabel:SetTextColor(1, 1, 1,1)
		QuestInfoSpellObjectiveLearnLabel:SetShadowColor(0,0,0,0)
		QuestInfoSpellObjectiveLearnLabel:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		CurrentQuestsText:SetTextColor((unpack(miirgui.Color)))
		CurrentQuestsText:SetShadowColor(0,0,0,0)
		CurrentQuestsText:SetFont(unpack(miirgui.font),16, "OUTLINE")
				
		QuestObjectiveText()
		end)

hooksecurefunc("QuestFrameGreetingPanel_OnShow", function()

		
		
		for i=1, MAX_NUM_QUESTS do
		local button = _G["QuestTitleButton"..i]
		if button:GetFontString() then
		if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
		button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffffffff"))
		button:GetFontString():SetFont(unpack(miirgui.font),13, "OUTLINE")
		button:GetFontString():SetShadowColor(0,0,0,0)
		end
		end
		end
		
		QuestFont:SetTextColor(1,1,1,1)
		QuestFont:SetFont(unpack(miirgui.font),13, "OUTLINE")
		QuestFont:SetShadowColor(0,0,0,0)
		
		--QuestFont_Shadow_Small:SetTextColor(1,1,1,1)
		--QuestFont_Shadow_Small:SetShadowColor(0,0,0,0)
		--QuestFont_Shadow_Small:SetFont(unpack(miirgui.font),18, "OUTLINE")
		
		--QuestFont_Shadow_Huge:SetTextColor(1,1,1,1)
		--QuestFont_Shadow_Huge:SetShadowColor(0,0,0,0)
		
		QuestInfoDescriptionText:SetTextColor(1, 1, 1)
		QuestInfoDescriptionText:SetShadowColor(0,0,0,0)
		QuestInfoDescriptionText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoObjectivesText:SetTextColor(1, 1, 1)
		QuestInfoObjectivesText:SetShadowColor(0,0,0,0)
		QuestInfoObjectivesText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoGroupSize:SetTextColor(1, 1, 1)
		QuestInfoGroupSize:SetShadowColor(0,0,0,0)
		QuestInfoGroupSize:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoRewardText:SetTextColor(1, 1, 1)
		QuestInfoRewardText:SetShadowColor(0,0,0,0)
		QuestInfoRewardText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoTitleHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoTitleHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoTitleHeader:SetShadowColor(0,0,0,0)
			
		QuestInfoDescriptionHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoDescriptionHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoDescriptionHeader:SetShadowColor(0,0,0,0)
		
		QuestInfoRewardsHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoRewardsHeader:SetTextColor(unpack(miirgui.Color))	
		QuestInfoRewardsHeader:SetShadowColor(0, 0, 0,0)	
		
		QuestInfoObjectivesHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoObjectivesHeader:SetFont(unpack(miirgui.font),16, "OUTLINE")
		QuestInfoObjectivesHeader:SetShadowColor(0,0,0,0)	

		
		QuestInfoItemChooseText:SetTextColor(1, 1, 1)
		QuestInfoItemChooseText:SetShadowColor(0,0,0,0)
		QuestInfoItemChooseText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoItemReceiveText:SetTextColor(1, 1, 1)
		QuestInfoItemReceiveText:SetShadowColor(0,0,0,0)
		QuestInfoItemReceiveText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoSpellLearnText:SetTextColor(1, 1, 1)
		QuestInfoSpellLearnText:SetShadowColor(0,0,0,0)
		QuestInfoSpellLearnText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		QuestInfoXPFrameReceiveText:SetTextColor(1, 1, 1)
		QuestInfoXPFrameReceiveText:SetShadowColor(0,0,0,0)
		QuestInfoXPFrameReceiveText:SetFont(unpack(miirgui.font),13, "OUTLINE")

		
		GreetingText:SetTextColor(1, 1, 1,1)
		GreetingText:SetShadowColor(0,0,0,0)
		GreetingText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		AvailableQuestsText:SetTextColor(unpack(miirgui.Color))
		AvailableQuestsText:SetShadowColor(0,0,0,0)
		AvailableQuestsText:SetFont(unpack(miirgui.font),16, "OUTLINE")
		
		QuestInfoSpellObjectiveLearnLabel:SetTextColor(1, 1, 1,1)
		QuestInfoSpellObjectiveLearnLabel:SetShadowColor(0,0,0,0)
		QuestInfoSpellObjectiveLearnLabel:SetFont(unpack(miirgui.font),13, "OUTLINE")
		
		CurrentQuestsText:SetTextColor(unpack(miirgui.Color))
		CurrentQuestsText:SetShadowColor(0,0,0,0)
		CurrentQuestsText:SetFont(unpack(miirgui.font),16, "OUTLINE")
end)