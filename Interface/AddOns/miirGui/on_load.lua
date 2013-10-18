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

--[[Setting up the border-functions]]

		local function Border(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)																								
			local f = CreateFrame("Frame", "nil", arg1)
			f:SetSize(arg2, arg3)
			f:SetFrameStrata(arg8)
			f:SetPoint(arg4,arg5,arg6)
			f:SetBackdrop({
			bgFile = "",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = arg7,
			})
			f:SetBackdropColor(0, 0, 0, 0)
			f:SetBackdropBorderColor(1, 1, 1)	
		end

--[[Registering Events]]

		local frame = CreateFrame("FRAME");																					
		frame:RegisterEvent("ADDON_LOADED")
		function frame:OnEvent(event, arg1)
		
--[[EncounterJournalFrame Changes]]
		
		if event == "ADDON_LOADED" and arg1 == "Blizzard_EncounterJournal"  then
			EncounterJournalPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			EncounterJournalInstanceSelectScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoLootScrollFrameScrollBarTrack:Hide()
			Border(EncounterJournalEncounterFrameInstanceFrame,340,266,"Center",3,34,12,"MEDIUM")
			Border(EncounterJournalInstanceSelect,794	,388,"Center",1,-22,12,"HIGH")
			for i = 1, 9 do
      	_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetTextColor(1, 1, 1)
      	_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetShadowColor(0,0,0,0)
      	_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetFont(unpack(miirgui.font),12, "OUTLINE")
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetTextColor(1, 1, 1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetFont(unpack(miirgui.font),12, "OUTLINE")
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetTextColor(1, 1, 1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetFont(unpack(miirgui.font),13, "OUTLINE")
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetTextColor(1, 1, 1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetFont(unpack(miirgui.font),13, "OUTLINE")
			end
        _G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetTextColor(1, 1, 1)
        _G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetShadowColor(0,0,0,0)
        _G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetFont(unpack(miirgui.font),12, "OUTLINE") 
        _G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetTextColor(1, 1, 1)
        _G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetShadowColor(0,0,0,0)
        _G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetFont(unpack(miirgui.font),12, "OUTLINE") 
        _G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetTextColor(unpack(miirgui.Color))
        _G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetFont(unpack(miirgui.font),14, "OUTLINE")   
				_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetShadowColor(0,0,0,0)                        

			for i = 1,6 do
			_G["EncounterJournalEncounterFrameInfoCreatureButton"..i.."Creature"]:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			i = i+1
			end

			hooksecurefunc("EncounterJournal_ToggleHeaders", function()
            for i = 1, 50 do
                if _G["EncounterJournalInfoHeader"..i] then  
                        _G["EncounterJournalInfoHeader"..i].description:SetTextColor(1, 1, 1)
                        _G["EncounterJournalInfoHeader"..i].description:SetShadowColor(0,0,0,0)
                        _G["EncounterJournalInfoHeader"..i].description:SetFont(unpack(miirgui.font),12, "OUTLINE")
                        _G["EncounterJournalInfoHeader"..i].button.title:SetTextColor(1, 1, 1)
												_G["EncounterJournalInfoHeader"..i].button.title:SetShadowColor(0,0,0,0)
												_G["EncounterJournalInfoHeader"..i].button.title:SetFont(unpack(miirgui.font),12, "OUTLINE")
                        _G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetTextColor(1, 1, 1)
												_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetShadowColor(0,0,0,0)
												_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetFont(unpack(miirgui.font),12, "OUTLINE")      
                end                
            end    
			end)

			hooksecurefunc("EncounterJournal_DisplayInstance", function(instanceID, noButton)
	local self = EncounterJournal.encounter;
	EncounterJournal.instanceSelect:Hide();
	EncounterJournal.encounter:Show();
	EncounterJournal.ceatureDisplayID = 0;
	
	EncounterJournal.instanceID = instanceID;
	EncounterJournal.encounterID = nil;
	EJ_SelectInstance(instanceID);
	EncounterJournal_LootUpdate();
	EncounterJournal_ClearDetails()
	
	local iname, description, bgImage, _, loreImage = EJ_GetInstanceInfo();
	self.instance.title:SetText(iname);
	self.instance.loreBG:SetTexture(loreImage);
	self.info.instanceTitle:SetText(iname);
	self.instance.title:SetTextColor(1,1,1,1)
	self.instance.title:SetFont(unpack(miirgui.font),16, "OUTLINE")
	
	self.instance.loreScroll.child.lore:SetText(description);
	local loreHeight = self.instance.loreScroll.child.lore:GetHeight();
	self.instance.loreScroll.ScrollBar:SetValue(0);
	if loreHeight <= 97 then
		self.instance.loreScroll.ScrollBar:Hide();
	else
		self.instance.loreScroll.ScrollBar:Show();
	end
	
	self.info.model.dungeonBG:SetTexture(bgImage);
	
	local bossIndex = 1;
	local name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
	local bossButton;
	while bossID do
		bossButton = _G["EncounterJournalBossButton"..bossIndex];
		if not bossButton then -- create a new header;
			bossButton = CreateFrame("BUTTON", "EncounterJournalBossButton"..bossIndex, EncounterJournal.encounter.bossesFrame, "EncounterBossButtonTemplate");
			if bossIndex > 1 then
				bossButton:SetPoint("TOPLEFT", _G["EncounterJournalBossButton"..(bossIndex-1)], "BOTTOMLEFT", 0, -15);
			else
				bossButton:SetPoint("TOPLEFT", EncounterJournal.encounter.bossesFrame, "TOPLEFT", 0, -10);
			end
		end
		
		bossButton.link = link;
		bossButton:SetText(name);
		bossButton:Show();
		bossButton.encounterID = bossID;
		--Use the boss' first creature as the button icon
		local _, _, _, _, bossImage = EJ_GetCreatureInfo(1, bossID);
		bossImage = bossImage or "Interface\\EncounterJournal\\UI-EJ-BOSS-Default";
		bossButton.creature:SetTexture(bossImage);
		bossButton:UnlockHighlight();
		
		bossIndex = bossIndex + 1;
		name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
	end
	
	--disable model tab, no boss selected
	EncounterJournal.encounter.info.modelTab:Disable();
	EncounterJournal.encounter.info.modelTab:GetDisabledTexture():SetDesaturated(true);
	EncounterJournal.encounter.info.modelTab.unselected:SetDesaturated(true);
	
	self.instance:Show();
	self.info.detailsScroll:Hide();
	self.info.lootScroll:Hide();
	self.info.rightShadow:Hide();

	
	if not noButton then
		local buttonData = {
			id = instanceID,
			name = iname,
			OnClick = EJNAV_RefreshInstance,
			listFunc = EJNAV_ListEncounter
		}
		NavBar_AddButton(EncounterJournal.navBar, buttonData);
	end
			end)

--[[GuildFrame Changes]]		
	
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_GuildUI" then	
			GuildPerksContainerScrollBarTrack:Hide()
			GuildLogScrollFrameScrollBarTrack:Hide()
			
--[[GuildBankFrame Changes]]		
	
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_GuildBankUI" then	
			GuildBankFrameBlackBG:Hide()
			GuildBankEmblemFrame:Hide()
			Border(GuildBankFrame,720,316,"Center",1,0,14,"MEDIUM")
		
			local c = CreateFrame("Frame",GuildBankBackground,GuildBankFrame)
			c:SetFrameStrata("Low")
			local ct = c:CreateTexture(nil,"BACKGROUND")
			ct:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			ct:SetAllPoints(c)
			c.texture = ct
			c:SetPoint("Topleft",0,0)
			c:SetPoint("Bottomright",0,0)
			c:Show()	
	
--[[PetJournalFrame Changes]]	

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_PetJournal" then					
			PetJournalParentPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PetJournalTutorialButton:Hide()
			MountJournalListScrollFrameScrollBarBG:Hide()																								
			PetJournalListScrollFrameScrollBarBG:Hide()				
			PetJournalLoadoutPet2BG:Hide()
			PetJournalLoadoutPet3BG:Hide()
			PetJournalLoadoutPet1PetTypeIcon:SetBlendMode("Add")
			PetJournalLoadoutPet2PetTypeIcon:SetBlendMode("Add")
			PetJournalLoadoutPet3PetTypeIcon:SetBlendMode("Add")	
			PetJournalHealPetButtonBorder:Hide()
			Border(PetJournalParent,264,522,"Left",2,-17,14,"HIGH")
			Border(MountJournal,414,522,"Center",139,-17,12,"HIGH")
			Border(PetJournalPetCard,414,174,"TopLeft",-4,4,14,"HIGH")
			Border(PetJournalLoadoutPet2,414,108,"TopLeft",-8,0,14,"HIGH")
			Border(PetJournalLoadoutPet1,414,334,"TopLeft",-8,6,14,"HIGH")

--[[ItemSocktingFrame Changes]]	

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemSocketingUI" then	
			ItemSocketingFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			Border(ItemSocketingFrameInset,304,276,"TopLeft",12,-12,12,"MEDIUM")
		
--[[ArchaeologyFrame Changes]]	
	
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ArchaeologyUI" then		
			ArchaeologyFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			ArchaeologyFrameHelpPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameHelpPageTitle:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameHelpPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameHelpPageDigTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameHelpPageDigTitle:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameHelpPageDigTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1,1,1,1)
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetFont(unpack(miirgui.font),12, "OUTLINE")
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameSummaryPageTitle:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameSummaryPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitle:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameCompletedPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitleMid:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitleMid:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameCompletedPageTitleMid:SetShadowColor(0,0,0,0)
			nothingcompleted=select(1,ArchaeologyFrameCompletedPage:GetRegions())
			nothingcompleted:SetFont(unpack(miirgui.font),12, "OUTLINE")
			nothingcompleted:SetTextColor(1,1,1,1)
			nothingcompleted:SetShadowColor(0,0,0,0)
			for i= 1, 12 do		
				DiggingRace= _G["ArchaeologyFrameSummaryPageRace"..i]
				DiggingRaceProgress = select(1,DiggingRace:GetRegions())
				DiggingRaceProgress:SetTextColor(1,1,1,1)	
				DiggingRaceProgress:SetFont(unpack(miirgui.font),12, "OUTLINE")
				DiggingRaceProgress:SetShadowColor(0,0,0,0)	
			end
			ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageHistoryTitle:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameArtifactPageHistoryTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1,1,1,1)	
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetFont(unpack(miirgui.font),12, "OUTLINE")
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitleTop:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitleTop:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameCompletedPageTitleTop:SetShadowColor(0,0,0,0)
			for i= 1,12 do
				ArtifactNumber= _G["ArchaeologyFrameCompletedPageArtifact"..i]
				ArtifactBg=select(2,ArtifactNumber:GetRegions())
				ArtifactBg:Hide()
				ArtifactName=select(4,ArtifactNumber:GetRegions())
				ArtifactName:SetTextColor(1,1,1,1)	
				ArtifactName:SetFont(unpack(miirgui.font),12, "OUTLINE")
				ArtifactName:SetShadowColor(0,0,0,0)
				ArtifactSubText=select(5,ArtifactNumber:GetRegions())
				ArtifactSubText:SetTextColor(1,1,1,1)
				ArtifactSubText:SetFont(unpack(miirgui.font),10, "OUTLINE")
				ArtifactSubText:SetShadowColor(0,0,0,0)
			end
			ArchaeologyFrameCompletedPagePageText:SetTextColor(1,1,1,1)	
			ArchaeologyFrameCompletedPagePageText:SetFont(unpack(miirgui.font),12, "OUTLINE")
			ArchaeologyFrameCompletedPagePageText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageRaceBG:SetDesaturated(1)
			ArchaeologyFrameRankBarBar:SetVertexColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageArtifactName:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageArtifactName:SetFont(unpack(miirgui.font),14, "OUTLINE")
			ArchaeologyFrameArtifactPageArtifactName:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageArtifactSubText:SetTextColor(1,1,1,1)
			ArchaeologyFrameArtifactPageArtifactSubText:SetFont(unpack(miirgui.font),11, "OUTLINE")
			ArchaeologyFrameArtifactPageArtifactSubText:SetShadowColor(0,0,0,0)
	
			hooksecurefunc("ArchaeologyFrame_CurrentArtifactUpdate", function(self)
				local RaceName, RaceTexture, RaceitemID	= GetArchaeologyRaceInfo(self.raceID);
				local name, description, rarity, icon, spellDescription, numSockets, bgTexture =  GetSelectedArtifactInfo();
				self.currentName = name;
				if 	self.solveFrame:IsShown() then
					local base, adjust, totalCost = GetArtifactProgress();
					self.solveFrame.statusBar:SetMinMaxValues(0, totalCost);
					self.solveFrame.statusBar:SetValue(min(base+adjust, totalCost));
					if adjust > 0 then
						self.solveFrame.statusBar.text:SetText((base+adjust).." "..GREEN_FONT_COLOR_CODE.."(+"..adjust.." "..ARCHAEOLOGY_RUNE_STONES..")|r /"..totalCost);
					else
						self.solveFrame.statusBar.text:SetText(base.."/"..totalCost);
					end	
						
					if CanSolveArtifact() then
						self.solveFrame.solveButton:Enable();
					else 
						self.solveFrame.solveButton:Disable();
					end
				end
					
				self.artifactName:SetText(name);
				self.icon:SetTexture(icon);	
				self.historyScroll.child.text:SetText(description);
				
				self.historyTitle:ClearAllPoints();
				local runeName, _, _, _, _, _, _, _, _, runeStoneIconPath = GetItemInfo(RaceitemID);
				local endFound = false;
				for i=1,ARCHAEOLOGY_MAX_STONES do
					if i > numSockets or not runeName then
						self.solveFrame["keystone"..i]:Hide();
					else
						self.solveFrame["keystone"..i].icon:SetTexture(runeStoneIconPath);
						if ItemAddedToArtifact(i) then
							self.solveFrame["keystone"..i].icon:Show();
							self.solveFrame["keystone"..i].tooltip = string.format(ARCHAEOLOGY_KEYSTONE_REMOVE_TOOLTIP, runeName);
							self.solveFrame["keystone"..i]:Enable();
						else
							self.solveFrame["keystone"..i].icon:Hide();
							self.solveFrame["keystone"..i].tooltip = string.format(ARCHAEOLOGY_KEYSTONE_ADD_TOOLTIP, runeName);
							self.solveFrame["keystone"..i]:Enable();
							if endFound then
								self.solveFrame["keystone"..i]:Disable();
							end
							endFound = true;
						end
						self.solveFrame["keystone"..i]:Show();
					end
				end
				
				if rarity == 0 then --Common Item
					self.historyTitle:SetPoint("RIGHT", -110, 126);
					self.historyScroll:SetSize(190, 200);
					self.historyScroll.child:SetSize(190, 200);
					self.historyScroll.child.text:SetWidth(190);
					self.artifactBG:SetTexture("");
					
					self.raceRarity:SetText(RaceName.." - "..ITEM_QUALITY1_DESC);
					if RaceTexture and RaceTexture ~= "" then
						self.raceBG:SetTexture(RaceTexture.."BIG");
						self.raceBG:SetDesaturated(1)
						self.raceBG:SetVertexColor(0.3,0.3,0.3)
					else
						self.raceBG:SetTexture("Interface\\Archeology\\Arch-TempLogo".."BIG");
						self.raceBG:SetDesaturated(1)
						self.raceBG:SetVertexColor(0.3,0.3,0.3)
					end
				else
					if 	self.solveFrame:IsShown() then
						self.historyTitle:SetPoint("CENTER", 0, -25);
						self.historyScroll:SetSize(400, 68);
						self.historyScroll.child:SetSize(400, 68);
						self.historyScroll.child.text:SetWidth(400);
					else
						self.historyTitle:SetPoint("CENTER", 0, -25);
						self.historyScroll:SetSize(400, 118);
						self.historyScroll.child:SetSize(400, 118);
						self.historyScroll.child.text:SetWidth(400);
						
						self.historyScroll.child.text:SetText(spellDescription);
					end
					self.raceBG:SetTexture("");
					self.raceRarity:SetText(RaceName.." - "..ITEM_QUALITY3_DESC);
					if bgTexture and bgTexture ~= "" then
						self.artifactBG:SetTexture(bgTexture)
						self.artifactBG:SetDesaturated(1)
					else
						self.artifactBG:SetTexture("Interface\\Archeology\\Arch-TempRareSketch");
					end
				end		
			end)
			
--[[AuctionFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_AuctionUI" then		
			local BrowseButton1Middle = select (6, BrowseButton1:GetRegions())
			BrowseButton1Middle:SetHeight(36)			
			BrowseButton1Left:SetHeight(36)
			BrowseButton1Left:ClearAllPoints()
			BrowseButton1Left:SetPoint("Left",34,3.5)	
			BrowseButton1Right:SetHeight(36)
			BrowseButton1Right:ClearAllPoints()
			BrowseButton1Right:SetPoint("Right",0,3.5)
			BrowseButton1Highlight:ClearAllPoints()
			BrowseButton1Highlight:SetPoint("Topleft",35,2)
			BrowseButton1Highlight:SetHeight(34)

			local BrowseButton2Middle = select (6, BrowseButton2:GetRegions())
			BrowseButton2Middle:SetHeight(36)	
			BrowseButton2Left:SetHeight(36)
			BrowseButton2Left:ClearAllPoints()
			BrowseButton2Left:SetPoint("Left",34,3.5)
			BrowseButton2Right:SetHeight(36)
			BrowseButton2Right:ClearAllPoints()
			BrowseButton2Right:SetPoint("Right",0,3.5)
			BrowseButton2Highlight:ClearAllPoints()
			BrowseButton2Highlight:SetPoint("Topleft",35,2)
			BrowseButton2Highlight:SetHeight(34)
    	
			local BrowseButton3Middle = select (6, BrowseButton3:GetRegions())
			BrowseButton3Middle:SetHeight(36)		
			BrowseButton3Left:SetHeight(36)
			BrowseButton3Left:ClearAllPoints()
			BrowseButton3Left:SetPoint("Left",34,3.5)	
			BrowseButton3Right:SetHeight(36)
			BrowseButton3Right:ClearAllPoints()
			BrowseButton3Right:SetPoint("Right",0,3.5)
    	BrowseButton3Highlight:ClearAllPoints()
			BrowseButton3Highlight:SetPoint("Topleft",35,2)
			BrowseButton3Highlight:SetHeight(34)
			
			local BrowseButton4Middle = select (6, BrowseButton4:GetRegions())
			BrowseButton4Middle:SetHeight(36)
			BrowseButton4Left:SetHeight(36)
			BrowseButton4Left:ClearAllPoints()
			BrowseButton4Left:SetPoint("Left",34,3.5)
			BrowseButton4Right:SetHeight(36)
			BrowseButton4Right:ClearAllPoints()
			BrowseButton4Right:SetPoint("Right",0,3.5)
 			BrowseButton4Highlight:ClearAllPoints()
			BrowseButton4Highlight:SetPoint("Topleft",35,2)
			BrowseButton4Highlight:SetHeight(34)
			
			local BrowseButton5Middle = select (6, BrowseButton5:GetRegions())
			BrowseButton5Middle:SetHeight(36)
			BrowseButton5Left:SetHeight(36)
			BrowseButton5Left:ClearAllPoints()
			BrowseButton5Left:SetPoint("Left",34,3.5)
			BrowseButton5Right:SetHeight(36)
			BrowseButton5Right:ClearAllPoints()
			BrowseButton5Right:SetPoint("Right",0,3.5)
			BrowseButton5Highlight:ClearAllPoints()
			BrowseButton5Highlight:SetPoint("Topleft",35,2)
			BrowseButton5Highlight:SetHeight(34)
						
			local BrowseButton6Middle = select (6, BrowseButton6:GetRegions())
			BrowseButton6Middle:SetHeight(36)
			BrowseButton6Left:SetHeight(36)
			BrowseButton6Left:ClearAllPoints()
			BrowseButton6Left:SetPoint("Left",34,3.5)
			BrowseButton6Right:SetHeight(36)
			BrowseButton6Right:ClearAllPoints()
			BrowseButton6Right:SetPoint("Right",0,3.5)
			BrowseButton6Highlight:ClearAllPoints()
			BrowseButton6Highlight:SetPoint("Topleft",35,2)
			BrowseButton6Highlight:SetHeight(34)
					
			local BrowseButton7Middle = select (6, BrowseButton7:GetRegions())
			BrowseButton7Middle:SetHeight(36)
			BrowseButton7Left:SetHeight(36)
			BrowseButton7Left:ClearAllPoints()
			BrowseButton7Left:SetPoint("Left",34,3.5)
			BrowseButton7Right:SetHeight(36)
			BrowseButton7Right:ClearAllPoints()
			BrowseButton7Right:SetPoint("Right",0,3.5)		
			BrowseButton7Highlight:ClearAllPoints()
			BrowseButton7Highlight:SetPoint("Topleft",35,2)
			BrowseButton7Highlight:SetHeight(34)	
					
			local BrowseButton8Middle = select (6, BrowseButton8:GetRegions())
			BrowseButton8Middle:SetHeight(36)
			BrowseButton8Left:SetHeight(36)
			BrowseButton8Left:ClearAllPoints()
			BrowseButton8Left:SetPoint("Left",34,3.5)
			BrowseButton8Right:SetHeight(36)
			BrowseButton8Right:ClearAllPoints()
			BrowseButton8Right:SetPoint("Right",0,3.5)		
			BrowseButton8Highlight:ClearAllPoints()
			BrowseButton8Highlight:SetPoint("Topleft",35,2)
			BrowseButton8Highlight:SetHeight(34)		
			
--[[LookingForGuildFrame Changes]]	
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_LookingForGuildUI" then
			LookingForGuildFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)

--[[MacroFrame Changes]]	
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_MacroUI" then		
		
			MacroFramePortraitmiirgui=select(18,MacroFrame:GetRegions())
			MacroFramePortraitmiirgui:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			MacroFramePortraitmiirgui:SetPoint("Topleft",-8,9)
			MacroFramePortraitmiirgui:SetWidth(64)
			MacroFramePortraitmiirgui:SetHeight(64)
			
--[[InspectFrame Changes]]			
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI" then
		InspectFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		SpecializationRing:Hide()
		SpecializationSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGlyphsGlyph1Ring:Hide()
 		InspectGlyphsGlyph2Ring:Hide()
 		InspectGlyphsGlyph3Ring:Hide()
 		InspectGlyphsGlyph4Ring:Hide()
 		InspectGlyphsGlyph5Ring:Hide()
 		InspectGlyphsGlyph6Ring:Hide()
 		InspectGlyphsGlyph1Glyph:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGlyphsGlyph2Glyph:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGlyphsGlyph3Glyph:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGlyphsGlyph4Glyph:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGlyphsGlyph5Glyph:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGlyphsGlyph6Glyph:SetTexCoord(0.85, 0.15, 0.15, 0.85)
 		InspectGuildFrameBG:Hide()
 		Border(InspectGlyphsGlyph1,48,48,"Center",0,0,14,"Medium")	
 		Border(InspectGlyphsGlyph5,48,48,"Center",0,0,14,"Medium")	
 		Border(InspectGlyphsGlyph3,48,48,"Center",0,0,14,"Medium")	
 		Border(InspectGlyphsGlyph2,64,64,"Center",0,0,14,"Medium")
 		Border(InspectGlyphsGlyph4,64,64,"Center",0,0,14,"Medium")
 		Border(InspectGlyphsGlyph6,64,64,"Center",0,0,14,"Medium")	
 		Border(Specialization,76,76,"TOPLEFT",16,-14,14,"Medium")
 		Border(InspectGuildFrame,330,340,"LEFT",4,-18,14,"Medium")	
 			
--[[TrainerFrame Changes]]				
			
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TrainerUI" then	
			ClassTrainerFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

--[[TradeSkillFrame Changes]]		
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TradeSkillUI" then	
			TradeSkillFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)	

--[[ChallengesFrame Changes]]			
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ChallengesUI" then	
			ChallengesFrameDetailsLine1:Hide()
			ChallengesFrameDetailsLine2:Hide()
			Border(ChallengesFrameDetails,340,34,"Center",0,20,14,"HIGH")
			Border(ChallengesFrameRewardRow1,340,34,"Center",0,0,12,"MEDIUM")
			Border(ChallengesFrameRewardRow2,340,34,"Center",0,0,12,"MEDIUM")	
			Border(ChallengesFrameRewardRow3,340,34,"Center",0,0,12,"MEDIUM")	
		
--[[ReforgingFrame Changes]]				
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ReforgingUI" then			
			ReforgingFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			ReforgingFrame.ButtonFrame:GetRegions():Hide()
			ReforgingFrame.ButtonFrame.ButtonBorder:Hide()
			ReforgingFrame.ButtonFrame.ButtonBottomBorder:Hide()
			ReforgingFrameHeaderTintage = select(23, ReforgingFrame:GetRegions())
			ReforgingFrameHeaderTintage:SetTexture(0,0,0,0)
			ReforgingFrameBackgroundTintage = select(25, ReforgingFrame:GetRegions())
			ReforgingFrameBackgroundTintage:SetTexture(0.078,0.078,0.078,1) 
			ReforgingFrameBackgroundTintage2 = select(27, ReforgingFrame:GetRegions())
			ReforgingFrameBackgroundTintage2:SetTexture(0,0,0,0)
			ReforgingFrame.RestoreMessage:SetTextColor(1, 1, 1,1)
			ReforgingFrame.RestoreMessage:SetFont(unpack(miirgui.font),12, "OUTLINE")
			ReforgingFrame.RestoreMessage:SetShadowColor(0,0,0,0)
			ReforgingFrame.ItemButton:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
hooksecurefunc("ReforgingFrame_Update", function(self)
	CloseDropDownMenus();
	ReforgingFrameRestoreButton:Disable();
	ReforgingFrameReforgeButton:Disable();
	ReforgingFrame.ReceiptBG:Hide();
	ReforgingFrame.RestoreMessage:Hide();
	ReforgingFrame.Lines:Show();
	
	local currentReforge, icon, name, quality, bound, cost = GetReforgeItemInfo();
	if icon then
		ReforgingFrame.ItemButton.IconTexture:SetTexture(icon);
		ReforgingFrame.ItemButton.IconTexture:SetTexCoord( 0, 1, 0, 1);
		local _, _, _, hex = GetItemQualityColor(quality);
		ReforgingFrame.ItemButton.ItemName:SetText("|c"..hex..name.."|r");
		ReforgingFrame.ItemButton.BoundStatus:SetText(bound);
		ReforgingFrame.ItemButton.MissingText:Hide();
		ReforgingFrame.MissingDescription:Hide();
		ReforgingFrame.MissingFadeOut:Hide();
		ReforgingFrame.HorzBar:Show();
		ReforgingFrame.TitleTextLeft:Show();
		ReforgingFrame.TitleTextRight:Show();
		
		
		local stats = {GetReforgeItemStats()};
		local bonusStatIndex = #stats/3 + 1;
		local rightStat, leftStat;
		local restoreMode = false;
		
		if currentReforge ~= 0 then --has a current reforge 
			restoreMode = true;
			ReforgingFrame.srcName, ReforgingFrame.srcStat, ReforgingFrame.srcValue, ReforgingFrame.destName, 
			ReforgingFrame.destStat, ReforgingFrame.destValue = GetReforgeOptionInfo(currentReforge);
		end
		
		if restoreMode then
			ReforgingFrame.ReceiptBG:Show();
			ReforgingFrame.RestoreMessage:Show();
			ReforgingFrame.Lines:Hide();
			MoneyFrame_Update(ReforgingFrameMoneyFrame, 0);
			ReforgingFrameRestoreButton:Enable();
			ReforgingFrame.TitleTextRight:SetText(REFORGE_RESTORE);
			HideStats();
			
			local index = 1;
			for i=1,#stats,3 do
				leftStat , rightStat = ReforgingFrame_GetStatRow(index, true);
				if not leftStat then
					break;
				end
				
				rightStat:Show();
				leftStat:Show();
				rightStat.Button:Hide();
				leftStat.Button:Hide();
				local name, statID, statValue = stats[i], stats[i+1], stats[i+2];
				if statID == ReforgingFrame.srcStat then --this stat will be restored
					rightStat.Text:SetText(GREEN_FONT_COLOR_CODE.."+"..statValue.." ".. name);
					leftStat.Text:SetText(RED_FONT_COLOR_CODE.."+"..(statValue-ReforgingFrame.srcValue).." "..name.." ("..statValue..")");
				else
					rightStat.Text:SetText("+"..statValue.." ".. name);
					leftStat.Text:SetText("+"..statValue.." "..name);
				end
				index = index+1;
			end
			
			leftStat , _ = ReforgingFrame_GetStatRow(bonusStatIndex, true);
			if leftStat then
				leftStat:Show();
				leftStat.Button:Hide();
				leftStat.Text:SetText(GREEN_FONT_COLOR_CODE.."+"..ReforgingFrame.destValue.." ".. ReforgingFrame.destName);
			end
			
		else --no current reforge 
			MoneyFrame_Update(ReforgingFrameMoneyFrame, cost);
			local enoughMoney = GetMoney() >=  cost;
			if enoughMoney then
				SetMoneyFrameColor("ReforgingFrameMoneyFrame", "white");
			else
				SetMoneyFrameColor("ReforgingFrameMoneyFrame", "red");
			end
			ReforgingFrame.TitleTextRight:SetText(REFORGE);
			
			if ReforgingFrame.srcStat and ReforgingFrame.destStat then
				if enoughMoney then
					ReforgingFrameReforgeButton:Enable();
				end
				--_ , rightStat = ReforgingFrame_GetStatRow(bonusStatIndex, true);
				--if rightStat then	
				--	rightStat:Show();
				--end
			end
		end
		
	else  -- There is no item so hide elements
		ReforgingFrame.ItemButton.IconTexture:SetTexture("");
		ReforgingFrame.ItemButton.IconTexture:SetTexCoord( 0, 0.640625, 0, 0.640625);
		ReforgingFrame.ItemButton.ItemName:SetText("");
		ReforgingFrame.ItemButton.BoundStatus:SetText("");
		ReforgingFrame.ItemButton.MissingText:Show();
		ReforgingFrame.MissingDescription:Show();
		ReforgingFrame.HorzBar:Hide();
		MoneyFrame_Update(ReforgingFrameMoneyFrame, 0);
		ReforgingFrame.TitleTextLeft:Hide();
		ReforgingFrame.TitleTextRight:Hide();
		ReforgingFrame.MissingFadeOut:Show();
		HideStats();
	end
end)

--[[TalentFrame Changes]]				
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TalentUI" then
			PlayerTalentFrameSpecializationSpecButton1Ring:Hide()
			PlayerTalentFrameSpecializationSpecButton1SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFrameSpecializationSpecButton1SpecIcon:SetWidth(42)
			PlayerTalentFrameSpecializationSpecButton1SpecIcon:SetHeight(42)
			
			PlayerTalentFrameSpecializationSpecButton2Ring:Hide()
			PlayerTalentFrameSpecializationSpecButton2SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFrameSpecializationSpecButton2SpecIcon:SetWidth(42)
			PlayerTalentFrameSpecializationSpecButton2SpecIcon:SetHeight(42)			
			
			PlayerTalentFrameSpecializationSpecButton3Ring:Hide()
			PlayerTalentFrameSpecializationSpecButton3SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFrameSpecializationSpecButton3SpecIcon:SetWidth(42)
			PlayerTalentFrameSpecializationSpecButton3SpecIcon:SetHeight(42)
			
			PlayerTalentFrameSpecializationSpecButton4Ring:Hide()
			PlayerTalentFrameSpecializationSpecButton4SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFrameSpecializationSpecButton4SpecIcon:SetWidth(42)
			PlayerTalentFrameSpecializationSpecButton4SpecIcon:SetHeight(42)
			
			PlayerTalentFramePetSpecializationSpecButton1Ring:Hide()
			PlayerTalentFramePetSpecializationSpecButton1SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFramePetSpecializationSpecButton1SpecIcon:SetWidth(42)
			PlayerTalentFramePetSpecializationSpecButton1SpecIcon:SetHeight(42)
			
			PlayerTalentFramePetSpecializationSpecButton2Ring:Hide()
			PlayerTalentFramePetSpecializationSpecButton2SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFramePetSpecializationSpecButton2SpecIcon:SetWidth(42)
			PlayerTalentFramePetSpecializationSpecButton2SpecIcon:SetHeight(42)			
			
			PlayerTalentFramePetSpecializationSpecButton3Ring:Hide()
			PlayerTalentFramePetSpecializationSpecButton3SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerTalentFramePetSpecializationSpecButton3SpecIcon:SetWidth(42)
			PlayerTalentFramePetSpecializationSpecButton3SpecIcon:SetHeight(42)			
			

			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildRing:Hide()
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1Ring:Hide()	
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildRing:Hide()
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1Ring:Hide()	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameTalentsTutorialButton:Hide()
			PlayerTalentFrameSpecializationTutorialButton:Hide()	
			PlayerTalentFramePetSpecializationTutorialButton:Hide()	
			PlayerTalentFramePortrait:SetWidth(64)
			PlayerTalentFramePortrait:SetHeight(64)
			PlayerTalentFramePortrait:SetPoint("Topleft",-8,9)
			
			PlayerTalentFrameHoritontal = select(12,PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFrameHoritontal:SetTexture(0.78,0.78,0.78,0)
			PlayerTalentFrameTintage = select(1,PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFrameTintage:SetTexture(0,0,0,0)		
			
			PlayerTalentFramePetHoritontal = select(12,PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFramePetHoritontal:SetTexture(0.78,0.78,0.78,0)
			PlayerTalentFramePetTintage = select(1,PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFramePetTintage:SetTexture(0,0,0,0)	
			
			PlayerSpecTab1Icon=select(2,PlayerSpecTab1:GetRegions())
			PlayerSpecTab1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerSpecTab2Icon=select(2,PlayerSpecTab2:GetRegions())
			PlayerSpecTab2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			Border(PlayerTalentFrameSpecializationSpellScrollFrame,414,414,"Center",0,-2,14,"MEDIUM")	
			Border(PlayerTalentFramePetSpecializationSpellScrollFrame,414,414,"Center",0,-2,14,"MEDIUM")	
			
			Border(PlayerTalentFramePetSpecializationSpecButton1,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFramePetSpecializationSpecButton2,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFramePetSpecializationSpecButton3,46,46,"Left",14,0,14,"MEDIUM")	
			Border(PlayerTalentFrameSpecializationSpecButton1,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFrameSpecializationSpecButton2,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFrameSpecializationSpecButton3,46,46,"Left",14,0,14,"MEDIUM")	
			Border(PlayerTalentFrameSpecializationSpellScrollFrameScrollChild,76,76,"TopLeft",16,-14,14,"MEDIUM")		
			Border(PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1,58,58,"Center",0,0,14,"MEDIUM")	
			Border(PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild,76,76,"TopLeft",16,-14,14,"MEDIUM")		
			Border(PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1,58,58,"Center",0,0,14,"MEDIUM")	
	

			hooksecurefunc("PlayerTalentFrame_CreateSpecSpellButton", function(frame, index)
   	 		local scrollChild = frame.spellsScroll.child;
   	 		local name = scrollChild:GetName() .. "Ability" .. index;
    		local button = _G[name];
    		child1,child2 = _G[name]:GetRegions();
				child1:Hide()
				child2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
    		Border(_G[name],58,58,"Center",0,0,14,"MEDIUM")
   	 	end);
   	 
--[[ItemAlterationFrame Changes]]
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemAlterationUI" then		
			TransmogrifyArtFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			TransmogrifyModelFrameFix1 = select(2,TransmogrifyModelFrame:GetRegions())			
			TransmogrifyModelFrameFix1:SetTexture(0,0,0,0)
			TransmogrifyModelFrameFix2 = select(1,TransmogrifyFrameButtonFrame:GetRegions())			
			TransmogrifyModelFrameFix2:SetTexture(0,0,0,0)
			TranmogrifyArtFrameFix1 = select(23,TransmogrifyArtFrame:GetRegions())
			TranmogrifyArtFrameFix1:SetTexture(0,0,0,0)	
			
			local c = CreateFrame("Frame",miirgui_TransmogrifyBackground,TransmogrifyFrame)
			c:SetFrameStrata("Low")
			local ct = c:CreateTexture(nil,"BACKGROUND")
			ct:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			ct:SetAllPoints(c)
			c.texture = ct
			c:SetPoint("Topleft",0,0)
			c:SetPoint("Bottomright",0,0)
			c:Show()	
			
--[[VoidStorageFrame Changes]]
		
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_VoidStorageUI" then		
			VoidStorageDepositFrameBg:Hide()
			VoidStorageWithdrawFrameBg:Hide()
			VoidStorageStorageFrameLine1:SetTexture(unpack(miirgui.Color))
			VoidStorageStorageFrameLine1:SetWidth(1)
			VoidStorageStorageFrameLine2:SetTexture(unpack(miirgui.Color))
			VoidStorageStorageFrameLine2:SetWidth(1)
			VoidStorageStorageFrameLine3:SetTexture(unpack(miirgui.Color))
			VoidStorageStorageFrameLine3:SetWidth(1)
			VoidStorageStorageFrameLine4:SetTexture(unpack(miirgui.Color))
			VoidStorageStorageFrameLine4:SetWidth(1)
			VoidStoragePurchaseTintage = select (2,VoidStoragePurchaseFrame:GetRegions())
			VoidStoragePurchaseTintage:Hide()
			VoidStorageFrameFix1 = select (2,VoidStorageFrame:GetRegions())
			VoidStorageFrameFix1:SetTexture(1,1,1,0)
			Border(VoidStoragePurchaseFrame,496,184,"Center",0,0,14,"MEDIUM")	
				
--[[AchievementFrame Changes]]	
				
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_AchievementUI" then				
			AchievementFrameSummaryCategoriesCategory1FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory1Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory2FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory2Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory3FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory3Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory4FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory4Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory5FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory5Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory6FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory6Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory7FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory7Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory8FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory8Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory9FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory9Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesCategory10FillBar:Hide()
			AchievementFrameSummaryCategoriesCategory10Bar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesStatusBarFillBar:Hide()
			AchievementFrameSummaryCategoriesStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameAchievementsContainerScrollBarBG:Hide()
			AchievementFrameStatsContainerScrollBarBG:Hide()
			AchievementFrameComparisonStatsContainerScrollBarBG:Hide()
			AchievementFrameComparisonDark:SetAlpha(0)
			AchievementFrameCategoriesContainerScrollBarBG:SetAlpha(0)
			AchievementFrameComparisonContainerScrollBarBG:SetAlpha(0)
			Border(AchievementFrameSummary,530,460,"Center",0,-1,14,"HIGH")
			
			FuglyGreenBorder1 = select(3,AchievementFrameStats:GetChildren())
			FuglyGreenBorder1:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder1:SetBackdropBorderColor(1, 1, 1,1)	
			
			FuglyGreenBorder2 = select(2,AchievementFrameAchievements:GetChildren())
			FuglyGreenBorder2:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder2:SetBackdropBorderColor(1, 1, 1,1)	
			
			FuglyGreenBorder3 = select(5,AchievementFrameComparison:GetChildren())
			FuglyGreenBorder3:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder3:SetBackdropBorderColor(1, 1, 1,1)	

			
			AchievementFrameCategories:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			
			local ach1frame = CreateFrame("Frame", "ach1border")
			ach1frame:SetSize(234, 52)
			ach1frame:SetAlpha(0)
			ach1frame:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
			ach1frame:SetBackdropColor(0, 0, 0, 1)
			ach1frame:SetBackdropBorderColor(1, 1, 1)
			
			local ach1frameb = CreateFrame("Frame", "ach1iconborder")
			ach1frameb:SetSize(52, 52)
			ach1frameb:SetAlpha(0)
			ach1frameb:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14})
			ach1frameb:SetBackdropColor(0, 0, 0, 0)
			ach1frameb:SetBackdropBorderColor(1, 1, 1)		
			
			local ach2frame = CreateFrame("Frame", "ach1border")
			ach2frame:SetSize(234, 52)
			ach2frame:SetAlpha(0)
			ach2frame:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
			ach2frame:SetBackdropColor(0, 0, 0, 1)
			ach2frame:SetBackdropBorderColor(1, 1, 1)		
			
			local ach2frameb = CreateFrame("Frame", "ach1iconborder")
			ach2frameb:SetSize(52, 52)
			ach2frameb:SetAlpha(0)
			ach2frameb:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14})
			ach2frameb:SetBackdropColor(0, 0, 0, 0)
			ach2frameb:SetBackdropBorderColor(1, 1, 1)	
			
			 hooksecurefunc("AchievementAlertFrame_ShowAlert",function() -- achivement alerts
                if (AchievementAlertFrame1) then
                	AchievementAlertFrame1:SetFrameStrata("TOOLTIP")
									ach1frame:SetParent(AchievementAlertFrame1Icon)
									ach1frame:SetAlpha(1)
									ach1frame:SetPoint("Left",88,3)
									ach1frame:SetFrameStrata("HIGH")			
									ach1frameb:SetParent(AchievementAlertFrame1Icon)
									ach1frameb:SetAlpha(1)
									ach1frameb:SetPoint("Center",0,3)
									ach1frameb:SetFrameStrata("TOOLTIP")		
															
                	AchievementAlertFrame1Unlocked:SetTextColor(unpack(miirgui.Color))
                	AchievementAlertFrame1Unlocked:SetFont(unpack(miirgui.font),10, "OUTLINE")
									AchievementAlertFrame1Unlocked:SetShadowColor(0,0,0,0)
                	AchievementAlertFrame1Name:SetTextColor(1,1,1,1)
                	AchievementAlertFrame1Name:SetFont(unpack(miirgui.font),12, "OUTLINE")
									AchievementAlertFrame1Name:SetShadowColor(0,0,0,0)	
									AchievementAlertFrame1GuildName:SetTextColor(1,1,1,1)
                	AchievementAlertFrame1GuildName:SetFont(unpack(miirgui.font),12, "OUTLINE")
									AchievementAlertFrame1GuildName:SetShadowColor(0,0,0,0)			
									AchievementAlertFrame1Background:Hide()
									AchievementAlertFrame1ShieldIcon:SetTexture("Interface\\Achievementframe\\miirgui_shield.blp")
									AchievementAlertFrame1GuildBanner:Hide()
								end
								if (AchievementAlertFrame2) then				  
									AchievementAlertFrame2:SetFrameStrata("TOOLTIP")              
									ach2frame:SetParent(AchievementAlertFrame2Icon)
									ach2frame:SetAlpha(1)
									ach2frame:SetPoint("Left",88,3)
									ach2frame:SetFrameStrata("High")		
									ach2frameb:SetParent(AchievementAlertFrame2Icon)
									ach2frameb:SetAlpha(1)
									ach2frameb:SetPoint("Center",0,3)
									ach2frameb:SetFrameStrata("TOOLTIP")	
									
									AchievementAlertFrame2Unlocked:SetTextColor(unpack(miirgui.Color))
                	AchievementAlertFrame2Unlocked:SetFont(unpack(miirgui.font),10, "OUTLINE")
									AchievementAlertFrame2Unlocked:SetShadowColor(0,0,0,0)
                	AchievementAlertFrame2Name:SetTextColor(1,1,1,1)
                	AchievementAlertFrame2Name:SetFont(unpack(miirgui.font),12, "OUTLINE")
									AchievementAlertFrame2Name:SetShadowColor(0,0,0,0)	
									AchievementAlertFrame2GuildName:SetTextColor(unpack(miirgui.Color))
                	AchievementAlertFrame2GuildName:SetFont(unpack(miirgui.font),12, "OUTLINE")
									AchievementAlertFrame2GuildName:SetShadowColor(0,0,0,0)		
									AchievementAlertFrame2Background:Hide()
									AchievementAlertFrame2ShieldIcon:SetTexture("Interface\\Achievementframe\\miirgui_shield.blp")
									AchievementAlertFrame2GuildBanner:Hide()
							end
       end)
			
--[[keybindingFrames Changes]]	
			
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_BindingUI" then	
			KeyBindingFrameHeader:Hide()
			KeyBindingFrameHeaderText:Hide()
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TimeManager" then
			TimeManagerGlobe:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			TimeManagerGlobe:SetPoint("TOPLEFT", -7,9)
			
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_PVPUI" then	
				
			PVPUIFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PVPBannerFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			
			wargamesscroll = select(2,WarGamesFrameInfoScrollFrameScrollBar:GetRegions())
			wargamesscroll:Hide()

			wargamesscroll2 = select(1,WarGamesFrame:GetRegions())
			wargamesscroll2:Hide()

			WarGamesFrameDescription:SetTextColor(1,1,1,1)
			WarGamesFrameDescription:SetFont(unpack(miirgui.font),12, "OUTLINE")
			WarGamesFrameDescription:SetShadowColor(0,0,0,0)
			
			ring1 = select(2,PVPQueueFrameCategoryButton1:GetRegions())
			ring1:Hide()
			icon1 = select(3,PVPQueueFrameCategoryButton1:GetRegions())
			icon1:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon1:SetWidth(42)
			icon1:SetHeight(42)		
				
			ring2 = select(2,PVPQueueFrameCategoryButton2:GetRegions())
			ring2:Hide()
			icon2 = select(3,PVPQueueFrameCategoryButton2:GetRegions())
			icon2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon2:SetWidth(42)
			icon2:SetHeight(42)	
			
			ring3 = select(2,PVPQueueFrameCategoryButton3:GetRegions())
			ring3:Hide()
			icon3 = select(3,PVPQueueFrameCategoryButton3:GetRegions())
			icon3:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon3:SetWidth(42)
			icon3:SetHeight(42)							
			
			ArenaTeamFrameGlowTop:Hide()
			ArenaTeamFrameGlowLeft:Hide()
			ArenaTeamFrameGlowRight:Hide()
			ArenaTeamFrameGlowBottom:Hide()
				
			ArenaTeamFrameShadowTopLeft:Hide()
			ArenaTeamFrameShadowTopRight:Hide()
			ArenaTeamFrameShadowBottomLeft:Hide()
			ArenaTeamFrameShadowBottomRight:Hide()
			
			ArenaTeamBG = select(24,ArenaTeamFrame:GetChildren())
			ArenaTeamBG2 = select(1,ArenaTeamBG:GetRegions())
			ArenaTeamBG2:SetTexture(0.128,0.117,0.128,1)
			ArenaTeamBG2:SetGradientAlpha("HORIZONTAL", 1,1,1,1, 1,1,1,1)
			
			PVPRole = select(1,HonorFrame:GetChildren())
			local kids = {PVPRole:GetRegions() };
			for _, child in ipairs(kids) do
		  child:Hide()
			end
			
			PVPReadyDialogBackground:Hide()
			
			Border(PVPQueueFrameCategoryButton1,46,46,"Left",14,0,14,"MEDIUM")
			Border(PVPQueueFrameCategoryButton2,46,46,"Left",14,0,14,"MEDIUM")
			Border(PVPQueueFrameCategoryButton3,46,46,"Left",14,0,14,"MEDIUM")
			Border(ArenaTeamFrame,336,400,"Center",2,2,12,"HIGH")
			
		--[[Item Upgrade Changes]]
		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemUpgradeUI" then
			ItemUpgradeFramePortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)	
			ItemUpgradeFrame.ButtonFrame:GetRegions():Hide()
			ItemUpgradeFrame.ButtonFrame.ButtonBorder:Hide()
			ItemUpgradeFrame.ButtonFrame.ButtonBottomBorder:Hide()
			ItemUpgradeFrameHeaderTintage = select(23,ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameHeaderTintage:SetTexture(0.128,0.117,0.128,1)
			ItemUpgradeFrameBackgroundTintage = select(25, ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameBackgroundTintage:SetTexture(0.078,0.078,0.078,1) 
			ItemUpgradeFrameBackgroundTintage2 = select(27, ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameBackgroundTintage2:SetTexture(0,0,0,0)
			
		end	
end


frame:SetScript("OnEvent", frame.OnEvent);


		hooksecurefunc("ToggleSpellBook", function(bookType)
			if 	(CliqueSpellTab) then
				CliqueIcon = select(6,CliqueSpellTab:GetRegions())
				CliqueIcon:SetTexCoord(0.13, 0.83, 0.13, 0.83)
				CliqueConfigPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			end
		end)