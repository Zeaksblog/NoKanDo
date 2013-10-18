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

local f = CreateFrame("Frame");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:SetScript("OnEvent", function()

--[[Setting up the border-function]]
		local function Border(arg1,arg2,arg3,arg4,arg5,arg6,arg7)																								
				f = CreateFrame("Frame", "nil", arg1)
				f:SetSize(arg2, arg3)
				f:SetPoint(arg4,arg5,arg6 )
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
		frame:RegisterEvent("ITEM_TEXT_BEGIN")
		
		local frame2 = CreateFrame("Frame");
		frame2:RegisterEvent("MERCHANT_SHOW")

--[[GameMenuFrame Changes]]
		GameMenuFrameHeader:Hide()
		GameMenuText=select (11,GameMenuFrame:GetRegions())
		GameMenuText:Hide()

--[[TradeFrame Changes]]
		TradeFramePlayerPortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
		TradeFramePlayerPortrait:SetPoint("Topleft",-8,10)
		TradeFramePlayerPortrait:SetWidth(64)
		TradeFramePlayerPortrait:SetHeight(64)
		TradeFrameRecipientPortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
		TradeFrameRecipientPortrait:SetWidth(62)
		TradeFrameRecipientPortrait:SetHeight(62)
		TradeRecipientBG:Hide()
		TradeRecipientBotLeftCorner:SetPoint("BOTTOMLEFT", "TradeFrame", "BOTTOMRight", -178, -5)
		
--[[LootFrame Changes]]
		LootFramePortraitOverlay:SetTexCoord(0.13, 0.83, 0.13, 0.83)
		LootFramePortraitOverlay:SetPoint("Topleft",-8,10)
		LootFramePortraitOverlay:SetWidth(64)
		LootFramePortraitOverlay:SetHeight(64)

--[[LFGDungeonReadyDialorFrame Changes]]
		LFGDungeonReadyDialogRewardsFrameReward1Border:Hide()
		LFGDungeonReadyDialogRewardsFrameReward1Texture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFGDungeonReadyDialogRewardsFrameReward2Border:Hide()
		LFGDungeonReadyDialogRewardsFrameReward2Texture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFGDungeonReadyDialogBackground:Hide()
		LFDQueueFrameRandomScrollFrameScrollBackground:Hide()
		LFDQueueFrameBackground:Hide()
		
		RaidFinderQueueFrameBackground:Hide()
		ScenarioBG= select(1,ScenarioQueueFrame:GetRegions())
		ScenarioBG:Hide()
		
		Border(LFDQueueFrame,334,260,"Center",0,-60,14)		
		Border(RaidFinderQueueFrame,334,260,"Center",0,-57,14)
		Border(LFGDungeonReadyDialogRewardsFrameReward1,36,36,"Center",-2,2,12)
		Border(LFGDungeonReadyDialogRewardsFrameReward2,36,36,"Center",-2,2,12)
		Border(ScenarioQueueFrame,334,336,"Center",-2,-22,14)
--[[ItemTextFrame Changes]]

		InboxFrameBg:Hide()
		ItemTextScrollFrameMiddle:Hide()
		ItemTextFrameIcon = select(18,ItemTextFrame:GetRegions())
		ItemTextFrameIcon:SetPoint("Topleft",-8,9)
		ItemTextFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		ItemTextFrameIcon:SetWidth(64)
		ItemTextFrameIcon:SetHeight(64)
		Border(ItemTextFrame,330,364,"Center",0,-27,14)
	
		function frame:OnEvent(event)
		if ( event == "ITEM_TEXT_BEGIN" ) then
			ItemTextPageText:SetTextColor(1,1,1,1)
			ItemTextPageText:SetFont(unpack(miirgui.font),13, "OUTLINE")
			ItemTextPageText:SetShadowColor(0,0,0,0)
		end
		end
		
--[[MailFrame Changes]]

		OpenMailFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		OpenMailBodyText:SetTextColor(1,1,1,1)
		OpenMailBodyText:SetShadowColor(0,0,0,0)
		OpenMailBodyText:SetFont(unpack(miirgui.font),12, "OUTLINE")
		OpenStationeryBackgroundLeft:Hide()
		OpenStationeryBackgroundRight:Hide()
		OpenMailInvoiceItemLabel:SetTextColor(1,1,1,1)
		OpenMailInvoiceItemLabel:SetShadowColor(0,0,0,0)
		OpenMailInvoiceItemLabel:SetFont(unpack(miirgui.font),12, "OUTLINE")
		
		OpenMailInvoicePurchaser:SetTextColor(1,1,1,1)
		OpenMailInvoicePurchaser:SetShadowColor(0,0,0,0)
		OpenMailInvoicePurchaser:SetFont(unpack(miirgui.font),12, "OUTLINE")
		
		OpenMailInvoiceSalePrice:SetTextColor(1,1,1,1)
		OpenMailInvoiceSalePrice:SetShadowColor(0,0,0,0)
		OpenMailInvoiceSalePrice:SetFont(unpack(miirgui.font),12, "OUTLINE")
		
		OpenMailInvoiceBuyMode:SetTextColor(1,1,1,1)
		OpenMailInvoiceBuyMode:SetShadowColor(0,0,0,0)
		OpenMailInvoiceBuyMode:SetFont(unpack(miirgui.font),12, "OUTLINE")
		
		OpenMailInvoiceAmountReceived:SetTextColor(1,1,1,1)
		OpenMailInvoiceAmountReceived:SetShadowColor(0,0,0,0)
		OpenMailInvoiceAmountReceived:SetFont(unpack(miirgui.font),12, "OUTLINE")
		
		SendMailBodyEditBox:SetFont(unpack(miirgui.font),12, "OUTLINE")
		SendMailBodyEditBox:SetTextColor(1,1,1,1)
		SendMailBodyEditBox:SetShadowColor(0,0,0,0)
		
		OpenMailInvoiceDeposit:SetFont(unpack(miirgui.font),12, "OUTLINE")
		OpenMailInvoiceDeposit:SetTextColor(1,1,1,1)
		OpenMailInvoiceDeposit:SetShadowColor(0,0,0,0)
		
		OpenMailInvoiceHouseCut:SetFont(unpack(miirgui.font),12, "OUTLINE")
		OpenMailInvoiceHouseCut:SetTextColor(1,1,1,1)
		OpenMailInvoiceHouseCut:SetShadowColor(0,0,0,0)
		
		InvoiceTextFontNormal:SetFont(unpack(miirgui.font),11, "OUTLINE")
		InvoiceTextFontNormal:SetTextColor(1,1,1,1)
		InvoiceTextFontNormal:SetShadowColor(0,0,0,0)
		
		SendStationeryBackgroundLeft:Hide()
		SendStationeryBackgroundRight:Hide()
		
		SendMailMoneyInset:Hide()
			
		MailItem1Horizontal = select(3,MailItem1:GetRegions())
		MailItem1Horizontal:SetTexture(0.129,0.113,0.129,1)																		
		MailItem2Horizontal = select(3,MailItem2:GetRegions())
		MailItem2Horizontal:SetTexture(0.129,0.113,0.129,1)		
		MailItem3Horizontal = select(3,MailItem3:GetRegions())
		MailItem3Horizontal:SetTexture(0.129,0.113,0.129,1)		
		MailItem4Horizontal = select(3,MailItem4:GetRegions())
		MailItem4Horizontal:SetTexture(0.129,0.113,0.129,1)		
		MailItem5Horizontal = select(3,MailItem5:GetRegions())
		MailItem5Horizontal:SetTexture(0.129,0.113,0.129,1)		
		MailItem6Horizontal = select(3,MailItem6:GetRegions())
		MailItem6Horizontal:SetTexture(0.129,0.113,0.129,1)	
		MailItem7Horizontal = select(3,MailItem7:GetRegions())
		MailItem7Horizontal:SetTexture(0.129,0.113,0.129,1)		
		MailFrameIcon = select(18,MailFrame:GetRegions())
		MailFrameIcon:SetPoint("Topleft",-8,9)
		MailFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		MailFrameIcon:SetWidth(64)
		MailFrameIcon:SetHeight(64)
		Border(SendMailFrame,330,322,"Center",-24,18,14)
		Border(InboxFrame,330,364,"Center",-24,18,14)
		Border(OpenMailFrameInset,330,320,"TOPLEFT",0,0,14)
	
--[[GossipFrame Changes]]	

		GossipFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		GossipGreetingText:SetTextColor(1, 1, 1,1)
		GossipGreetingText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		GossipGreetingText:SetShadowColor(0,0,0,0)
		GossipFrameBackground = select(19,GossipFrame:GetRegions())
		GossipFrameBackground:Hide()
		Border(GossipFrame,330,412,"Center",0,-18,14)
		
--[[DressUpFrame Changes]]			
						
		DressUpFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
--[[Bag and BankFrame Changes]]	
																			
		BankPortraitTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		BankPortraitTexture:SetPoint("Topleft",-8,9)
		BankPortraitTexture:SetWidth(64)
		BankPortraitTexture:SetHeight(64)	
		BankFrameBg:SetTexture(0.078,0.078,0.078,1)
		ContainerFrame1Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)		
		ContainerFrame2Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)			
		ContainerFrame3Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame4Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)		
		ContainerFrame5Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)		
		ContainerFrame6Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame7Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame8Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame9Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame10Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame11Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		ContainerFrame12Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

--[[FriendsFrame Changes]]	
			
		FriendsFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		FriendsFrameIcon:SetPoint("Topleft",-8,9)
		FriendsFrameIcon:SetWidth(64)
		FriendsFrameIcon:SetHeight(64)		
	
--[[MerchantFrame Changes]]		
	
		MerchantFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)		
		BuybackBG:SetTexture(0.078,0.078,0.078,1)	
		
		function frame2:OnEvent(event)	
			if event == "MERCHANT_SHOW" then
			MerchantExtraCurrencyInset:Show();
			end
		end
	
--[[TabardFrame Changes]]		

		TabardFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
--[[QuestFrame Changes]]	
		
		QuestFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)																														
		QuestFrameDetailPanelBg:Hide()
		QuestLogDetailFramePageBg:Hide()
		QuestFrameRewardPanelBg:Hide()
		QuestLogFramePageBg:Hide()	
		QuestFrameGreetingPanelBg:Hide()
		QuestFrameProgressPanelBg:Hide()
		QuestNPCModelTextBotLeftCorner:Hide() 
		QuestNPCModelTextBotRightCorner:Hide() 
		QuestNPCModelTextBottomBorder:Hide() 
		QuestNPCModelTextLeftBorder:Hide() 
		QuestNPCModelTextRightBorder:Hide() 
		QuestNPCModelBg:SetPoint("Topleft",-8,20)
		QuestNPCModelBg:SetWidth(210)
		QuestNPCModelBg:SetHeight(334)
		QuestNPCModelBotLeftCorner:Hide()
		QuestNPCModelBotRightCorner:Hide()
		QuestNPCModelTopBorder:Hide()
		QuestNPCModelLeftBorder:Hide()
		QuestNPCModelRightBorder:Hide()
		QuestNPCModelTopBg:SetWidth(208)
		QuestNPCModelTopBg:SetPoint("Topleft",-6,16)
		QuestNPCModelNameplate:SetWidth(208)
		QuestNPCModelNameplate:SetPoint("TopLeft",-6,-218)
		QuestLogDetailFrameIcon = select(18, QuestLogDetailFrame:GetRegions())																												
		QuestLogDetailFrameIcon:SetWidth(64)
		QuestLogDetailFrameIcon:SetHeight(64)
		QuestLogDetailFrameIcon:SetPoint("Topleft",-8,9)
		QuestFont:SetTextColor(1,1,1,1)
		QuestFont:SetFont(unpack(miirgui.font),13, "OUTLINE")
		QuestFont:SetShadowColor(0,0,0,0)
		QuestFont_Shadow_Small:SetTextColor(1,1,1,1)
		QuestFont_Shadow_Small:SetShadowColor(0,0,0,0)
		QuestFont_Shadow_Huge:SetTextColor(1,1,1,1)
		QuestFont_Shadow_Huge:SetShadowColor(0,0,0,0)
		Border(QuestFrame,332,414,"Center",-0,-16,14)
		Border(QuestLogDetailFrame,330,414,"Center",0,-16,14)
		Border(QuestLogFrame,304,412,"Left",5,-17,14)
		Border(QuestLogFrame,330,412,"Right",-5,-17,14)		
		Border(QuestNPCModelTextFrame,204,338,"Center",8,134,14)
		
		hooksecurefunc("QuestFrame_ShowQuestPortrait", function(parentFrame, portrait, text, name, x, y)
    	QuestNPCModel:SetParent(parentFrame);
    	QuestNPCModel:ClearAllPoints();
    	QuestNPCModel:SetPoint("TOPLEFT", parentFrame, "TOPRIGHT", 10, y);
    	QuestNPCModel:Show();
    	QuestFrame_UpdatePortraitText(text);
     
    		if (name and name ~= "") then
        	QuestNPCModelNameplate:Show();
        	QuestNPCModelBlankNameplate:Hide();
        	QuestNPCModelNameText:Show();
        	QuestNPCModelNameText:SetText(name);
    		else
        	QuestNPCModelNameplate:Hide();
        	QuestNPCModelBlankNameplate:Show();
        	QuestNPCModelNameText:Hide();
    		end
    		
 				if (portrait == -1) then
        	QuestNPCModel:SetUnit("player");
    		else
        	QuestNPCModel:SetDisplayInfo(portrait);
    		end
		end)

--[[CharacterFrame Changes]]	

		hooksecurefunc("CharacterFrame_UpdatePortrait", function()																			
		local masteryIndex = GetSpecialization();
			if (masteryIndex == nil) then
				local _, class = UnitClass("player");
				CharacterFramePortrait:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\classes");
				CharacterFramePortrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[class]));
				CharacterFramePortrait:SetPoint("Topleft",-8,9)
				CharacterFramePortrait:SetWidth(64)
				CharacterFramePortrait:SetHeight(64)
				else
				local icon = select(4,GetSpecializationInfo(masteryIndex))
				CharacterFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85);
			end
    end);

    
--[[PVEFrame Changes]]	    
    
		RaidFinderFrameRoleBackground:Hide()
		GroupFinderFrameGroupButton1Ring:Hide()
		GroupFinderFrameGroupButton1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		GroupFinderFrameGroupButton1Icon:SetWidth(46)
		GroupFinderFrameGroupButton1Icon:SetHeight(46)
		GroupFinderFrameGroupButton2Ring:Hide() 
		GroupFinderFrameGroupButton2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		GroupFinderFrameGroupButton2Icon:SetWidth(46)
		GroupFinderFrameGroupButton2Icon:SetHeight(46)	
		GroupFinderFrameGroupButton3Ring:Hide() 
		GroupFinderFrameGroupButton3Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		GroupFinderFrameGroupButton3Icon:SetWidth(46)
		GroupFinderFrameGroupButton3Icon:SetHeight(46)
		RaidBrowserFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFDQueueFrameRoleButtonTankIncentiveIconBorder:Hide()
		LFDQueueFrameRoleButtonTankIncentiveIconTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFDQueueFrameRoleButtonHealerIncentiveIconBorder:Hide()
		LFDQueueFrameRoleButtonHealerIncentiveIconTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFDQueueFrameRoleButtonDPSIncentiveIconBorder:Hide()
		LFDQueueFrameRoleButtonDPSIncentiveIconTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PVEFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)				
		Border(GroupFinderFrameGroupButton1,50,50,"Left",10,0,14)
		Border(GroupFinderFrameGroupButton2,50,50,"Left",10,0,14)
		Border(GroupFinderFrameGroupButton3,50,50,"Left",10,0,14)
		Border(LFDQueueFrameRoleButtonTankIncentiveIcon,19,19,"Left",0,3,4)
		Border(LFDQueueFrameRoleButtonHealerIncentiveIcon,19,19,"Left",0,3,4)
		Border(LFDQueueFrameRoleButtonDPSIncentiveIcon,19,19,"Left",0,3,4)
		
		local c= CreateFrame("Frame","RaidFinderBg",RaidFinderQueueFrame)
		c:SetFrameStrata("Medium")
		c:SetWidth(512) 
		c:SetHeight(128)
		local ct = c:CreateTexture(nil,"BACKGROUND")
		ct:SetTexture("Interface\\LFGFrame\\UI-LFG-BlueBG.blp")
		ct:SetAllPoints(c)
		c.texture = ct
		c:SetPoint("Topleft",2,-23)
		c:Show()

--[[SpellBookFrame Changes]]	
		
		SpellBookFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		PrimaryProfession1Icon:SetAlpha(1)
		PrimaryProfession1Icon:SetDesaturated(nil)
		PrimaryProfession1Icon:SetBlendMode("Blend")
		PrimaryProfession1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PrimaryProfession2Icon:SetAlpha(1)
		PrimaryProfession2Icon:SetDesaturated(nil)
		PrimaryProfession2Icon:SetBlendMode("Blend")
		PrimaryProfession2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookFrameTutorialButton:Hide()
		
		SpellBookSkillLineTab1Icon=select(4,SpellBookSkillLineTab1:GetRegions())
		SpellBookSkillLineTab1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
		SpellBookSkillLineTab2Icon=select(4,SpellBookSkillLineTab2:GetRegions())
		SpellBookSkillLineTab2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
		SpellBookSkillLineTab3Icon=select(4,SpellBookSkillLineTab3:GetRegions())
		SpellBookSkillLineTab3Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
		SpellBookSkillLineTab4Icon=select(4,SpellBookSkillLineTab4:GetRegions())
		SpellBookSkillLineTab4Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
		SpellBookSkillLineTab5Icon=select(4,SpellBookSkillLineTab5:GetRegions())
		SpellBookSkillLineTab5Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
						
		SpellBookPageText:SetTextColor(1, 1, 1,1)
		SpellBookPageText:SetFont(unpack(miirgui.font),11, "OUTLINE")
		SpellBookPageText:SetShadowColor(0,0,0,0)
				
		PrimaryProfession1Missing:SetTextColor(unpack(miirgui.Color))
		PrimaryProfession1Missing:SetFont(unpack(miirgui.font),16, "OUTLINE")
		PrimaryProfession1Missing:SetShadowColor(0,0,0,0)
		
		PrimaryProfession2Missing:SetTextColor(unpack(miirgui.Color))
		PrimaryProfession2Missing:SetFont(unpack(miirgui.font),16, "OUTLINE")
		PrimaryProfession2Missing:SetShadowColor(0,0,0,0)		
		
		SecondaryProfession1Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession1Missing:SetFont(unpack(miirgui.font),14, "OUTLINE")
		SecondaryProfession1Missing:SetShadowColor(0,0,0,0)
		
		SecondaryProfession2Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession2Missing:SetFont(unpack(miirgui.font),14, "OUTLINE")
		SecondaryProfession2Missing:SetShadowColor(0,0,0,0)
		
		SecondaryProfession3Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession3Missing:SetFont(unpack(miirgui.font),14, "OUTLINE")
		SecondaryProfession3Missing:SetShadowColor(0,0,0,0)
		
		SecondaryProfession4Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession4Missing:SetFont(unpack(miirgui.font),14, "OUTLINE")
		SecondaryProfession4Missing:SetShadowColor(0,0,0,0)	

		PrimaryProfession1missingtext=select(4,PrimaryProfession1:GetRegions())
		PrimaryProfession1missingtext:SetTextColor(1,1,1,1)
		PrimaryProfession1missingtext:SetShadowColor(0,0,0,0)
		PrimaryProfession1missingtext:SetFont(unpack(miirgui.font),11, "OUTLINE")
		
		SecondaryProfession1missingtext=select(4,SecondaryProfession1:GetRegions())
		SecondaryProfession1missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession1missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession1missingtext:SetFont(unpack(miirgui.font),11, "OUTLINE")
		
		SecondaryProfession2missingtext=select(4,SecondaryProfession2:GetRegions())
		SecondaryProfession2missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession2missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession2missingtext:SetFont(unpack(miirgui.font),11, "OUTLINE")
		
		SecondaryProfession3missingtext=select(4,SecondaryProfession3:GetRegions())
		SecondaryProfession3missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession3missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession3missingtext:SetFont(unpack(miirgui.font),11, "OUTLINE")
			
		SecondaryProfession4missingtext=select(4,SecondaryProfession4:GetRegions())
		SecondaryProfession4missingtext:SetTextColor(1,1,1,1)	
		SecondaryProfession4missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession4missingtext:SetFont(unpack(miirgui.font),11, "OUTLINE")
		
		PrimaryProfession2missingtext=select(4,PrimaryProfession2:GetRegions())
		PrimaryProfession2missingtext:SetTextColor(1,1,1,1)
		PrimaryProfession2missingtext:SetShadowColor(0,0,0,0)	
		PrimaryProfession2missingtext:SetFont(unpack(miirgui.font),11, "OUTLINE")
					
		Border(PrimaryProfession1,74,74,"Left",6,-2,14)	
		Border(PrimaryProfession2,74,74,"Left",6,-2,14)
	
hooksecurefunc("FormatProfession",function(frame, index)
    if index then
        frame.missingHeader:Hide();
        frame.missingText:Hide();
         
        local name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier, specializationIndex, specializationOffset = GetProfessionInfo(index);
       frame.skillName = name;
--        frame.spellOffset = spelloffset;
        frame.skillLine = skillLine;
        frame.specializationIndex = specializationIndex;
        frame.specializationOffset = specializationOffset;
         
        frame.statusBar:SetMinMaxValues(1,maxRank);
        frame.statusBar:SetValue(rank);
         
        local prof_title = "";
        for i=1,#PROFESSION_RANKS do
            local value,title = PROFESSION_RANKS[i][1], PROFESSION_RANKS[i][2];
            if maxRank < value then break end
            prof_title = title;
        end
        frame.rank:SetText(prof_title);
        frame.rank:SetShadowColor(0,0,0,0)
        frame.rank:SetFont(unpack(miirgui.font),11, "OUTLINE")
         
        frame.statusBar:Show();
        if rank == maxRank then
            frame.statusBar.capRight:Show();
        else
            frame.statusBar.capRight:Hide();
        end
        -- trial cap
        if IsTrialAccount() then
            local _, _, profCap = GetRestrictedAccountData();
            if rank >= profCap then
                frame.statusBar.capped:Show();
                frame.statusBar.rankText:SetTextColor(1,1,1,1)
                frame.statusBar.tooltip = RED_FONT_COLOR_CODE..TRIAL_CAPPED;
            else
                frame.statusBar.capped:Hide();
                frame.statusBar.rankText:SetTextColor(1,1,1,1)
                frame.statusBar.tooltip = nil;
            end
        end
         
--        if frame.icon and texture then
--            SetPortraitToTexture(frame.icon, texture); 
--            frame.unlearn:Show();
--        end
         
        frame.professionName:SetText(name);
				frame.professionName:SetTextColor(unpack(miirgui.Color))
				frame.professionName:SetFont(unpack(miirgui.font),14, "OUTLINE")
				frame.professionName:SetShadowColor(0,0,0,0)
         
        if ( rankModifier > 0 ) then
            frame.statusBar.rankText:SetFormattedText(TRADESKILL_RANK_WITH_MODIFIER, rank, rankModifier, maxRank);
        else
            frame.statusBar.rankText:SetFormattedText(TRADESKILL_RANK, rank, maxRank);
        end
 
         
        if numSpells <= 0 then      
            frame.button1:Hide();
            frame.button2:Hide();
        elseif numSpells == 1 then     
            frame.button2:Hide();
            frame.button1:Show();
            UpdateProfessionButton(frame.button1);     
        else -- if numSpells >= 2 then  
            frame.button1:Show();
            frame.button2:Show();
            UpdateProfessionButton(frame.button1);         
            UpdateProfessionButton(frame.button2);
        end
         
        if numSpells >  2 then
            local errorStr = "Found "..numSpells.." skills for "..name.." the max is 2:"
            for i=1,numSpells do
                errorStr = errorStr.." ("..GetSpellBookItemName(i + spelloffset, SpellBookFrame.bookType)..")";
            end
            assert(false, errorStr)
        end
    else       
        frame.missingHeader:Show();
        frame.missingText:Show();
         
--        if frame.icon then
--            SetPortraitToTexture(frame.icon, "Interface\\Icons\\INV_Scroll_04");   
--           frame.unlearn:Hide();          
--            frame.specialization:SetText("");
--        end        
--        frame.button1:Hide();
--        frame.button2:Hide();
--        frame.statusBar:Hide();
--        frame.rank:SetText("");
--        frame.professionName:SetText("");      
    end
end)




hooksecurefunc("UpdateProfessionButton",function(self)
    local spellIndex = self:GetID() + self:GetParent().spellOffset;
    local texture = GetSpellBookItemTexture(spellIndex, SpellBookFrame.bookType);
    local spellName, subSpellName = GetSpellBookItemName(spellIndex, SpellBookFrame.bookType);
    local isPassive = IsPassiveSpell(spellIndex, SpellBookFrame.bookType);
    if ( isPassive ) then
        self.highlightTexture:SetTexture("Interface\\Buttons\\UI-PassiveHighlight");
        self.spellString:SetTextColor(unpack(miirgui.Color))
				self.spellString:SetFont(unpack(miirgui.font),12, "OUTLINE")
				self.spellString:SetShadowColor(0,0,0,0)     
    else
        self.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
        self.spellString:SetTextColor(1.0, 1.0, 1.0);
        self.spellString:SetTextColor(unpack(miirgui.Color))
				self.spellString:SetFont(unpack(miirgui.font),12, "OUTLINE")
				self.spellString:SetShadowColor(0,0,0,0)
    end
     
    self.iconTexture:SetTexture(texture);
    local start, duration, enable = GetSpellCooldown(spellIndex, SpellBookFrame.bookType);
    CooldownFrame_SetTimer(self.cooldown, start, duration, enable);
    if ( enable == 1 ) then
        self.iconTexture:SetVertexColor(1.0, 1.0, 1.0);
    else
        self.iconTexture:SetVertexColor(0.4, 0.4, 0.4);
    end
 
    if ( self:GetParent().specializationIndex >= 0 and self:GetID() == self:GetParent().specializationOffset) then
        self.unlearn:Show();
    else
        self.unlearn:Hide();
    end
     
    self.spellString:SetText(spellName);
    self.subSpellString:SetText(subSpellName); 
    self.iconTexture:SetTexture(texture);
     
    SpellButton_UpdateSelection(self);
end)



	
		hooksecurefunc("SpellBookCoreAbilities_UpdateTabs",function()
			local numSpecs = GetNumSpecializations();
			local currentSpec = GetSpecialization();
			local index = 1;
			local tab;
				if ( currentSpec ) then
					tab = SpellBook_GetCoreAbilitySpecTab(index);
					local id, name, description, icon = GetSpecializationInfo(currentSpec);
					tab:SetID(currentSpec);
					tab:SetNormalTexture(icon);
					tab:GetNormalTexture():SetTexCoord(0.85, 0.15, 0.15, 0.85)
					tab:SetChecked(SpellBookCoreAbilitiesFrame.selectedSpec == tab:GetID());
					tab.tooltip = name;
					tab:Show();
					index = index + 1;
				end
	
			tab = SpellBook_GetCoreAbilitySpecTab(2);
				if ( currentSpec ) then
					tab:SetPoint("TOPLEFT", SpellBookCoreAbilitiesFrame.SpecTabs[1], "BOTTOMLEFT", 0, -40);
				else
					tab:SetPoint("TOPLEFT", SpellBookCoreAbilitiesFrame.SpecTabs[1], "BOTTOMLEFT", 0, -17);
				end
	
				for i=1, numSpecs do
					if ( not currentSpec or currentSpec ~= i ) then
						tab = SpellBook_GetCoreAbilitySpecTab(index);
						local id, name, description, icon = GetSpecializationInfo(i);
						tab:SetID(i);
						tab:SetNormalTexture(icon);
						tab:GetNormalTexture():SetTexCoord(0.85, 0.15, 0.15, 0.85)
						tab:SetChecked(SpellBookCoreAbilitiesFrame.selectedSpec == tab:GetID());
						tab:GetNormalTexture():SetDesaturated(currentSpec and not (currentSpec == i));
						tab.tooltip = name;
						tab:Show();
						index = index + 1;
					end
				end
				for i = numSpecs + 1, #SpellBookCoreAbilitiesFrame.SpecTabs do
					SpellBook_GetCoreAbilitySpecTab(i):Hide();
				end
		end)
		
		hooksecurefunc("SpellBook_UpdateCoreAbilitiesTab", function()
		SpellBookFrame_UpdatePages();
		SpellBookCoreAbilities_UpdateTabs();
	
		local currentSpec = GetSpecialization();
		local desaturate = currentSpec and (currentSpec ~= SpellBookCoreAbilitiesFrame.selectedSpec);
		local specID, displayName = GetSpecializationInfo(SpellBookCoreAbilitiesFrame.selectedSpec);
		local draggable = false;
		if ( GetSpecialization() == SpellBookCoreAbilitiesFrame.selectedSpec ) then
			draggable = true;
		end
	
		SpellBookCoreAbilitiesFrame.SpecName:SetText(displayName);
		SpellBookCoreAbilitiesFrame.SpecName:SetTextColor(unpack(miirgui.Color))
		SpellBookCoreAbilitiesFrame.SpecName:SetFont(unpack(miirgui.font),18, "OUTLINE")
		SpellBookCoreAbilitiesFrame.SpecName:SetShadowColor(0,0,0,0)
	
		local abilityList = SPEC_CORE_ABILITY_DISPLAY[specID];
		if ( abilityList ) then
			for i=1, #abilityList do
			local name, subname = GetSpellInfo(abilityList[i]);
			local _, icon = GetSpellTexture(abilityList[i]);
			local button = SpellBook_GetCoreAbilityButton(i);
			local level = GetSpellLevelLearned(abilityList[i]);
			local showLevel = (level and level > UnitLevel("player"));
			local isPassive = IsPassiveSpell(abilityList[i]);
			
			button.spellID = abilityList[i];
			button.Name:SetText(name);
			button.Name:SetTextColor(unpack(miirgui.Color))
			button.Name:SetFont(unpack(miirgui.font),14, "OUTLINE")
			button.Name:SetShadowColor(0,0,0,0)
			button.InfoText:SetText(_G[SPEC_CORE_ABILITY_TEXT[specID].."_CORE_ABILITY_"..i]);
			button.InfoText:SetTextColor(1, 1, 1)
			button.InfoText:SetFont(unpack(miirgui.font),11, "OUTLINE")
			button.InfoText:SetShadowColor(0,0,0,0)
			button.iconTexture:SetTexture(icon);
			button.iconTexture:SetDesaturated(showLevel or desaturate);
			
			button.ActiveTexture:SetShown(not showLevel and not isPassive);
			button.ActiveTexture:SetDesaturated(desaturate);
			button.FutureTexture:SetShown(showLevel);
			button.FutureTexture:SetDesaturated(desaturate);
			button.EmptySlot:SetDesaturated(desaturate);
			button.draggable = draggable and not isPassive and not showLevel;
			
			if ( showLevel ) then
				button.RequiredLevel:SetFormattedText(SPELLBOOK_AVAILABLE_AT, level);
			else
				button.RequiredLevel:SetText("");
			end
	
			if ( showLevel or isPassive ) then
				button.highlightTexture:SetTexture("Interface\\Buttons\\UI-PassiveHighlight");
			else
				button.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
			end
	
			button:Show();
			end
		end
		for i = #abilityList + 1, #SpellBookCoreAbilitiesFrame.Abilities do
		SpellBook_GetCoreAbilityButton(i):Hide();
		end
		end)

		hooksecurefunc("SpellButton_UpdateButton", function(self)
			local slot, slotType = SpellBook_GetSpellBookSlot(self);
			local name = self:GetName();
			local subSpellString = _G[name.."SubSpellName"]
			local spellString = _G[name.."SpellName"];
			
		  spellString:SetTextColor(unpack(miirgui.Color));
		  spellString:SetFont(unpack(miirgui.font),12, "OUTLINE")
		  spellString:SetShadowColor(0,0,0,0)
		  
			subSpellString:SetTextColor(1, 1, 1)
		  subSpellString:SetShadowColor(0,0,0,0)
		  subSpellString:SetFont(unpack(miirgui.font),11, "OUTLINE")
			
    if slotType == "FUTURESPELL" then
        
        local level = GetSpellAvailableLevel(slot, SpellBookFrame.bookType)
        if (level and level > UnitLevel("player")) then
			self.RequiredLevelString:SetTextColor(1, 1, 1);
			self.RequiredLevelString:SetFont(unpack(miirgui.font),10, "OUTLINE")
			self.RequiredLevelString:SetShadowColor(0,0,0,0)

        end			
			end
			
		

		end)
 
		hooksecurefunc ("SpellBook_UpdateWhatHasChangedTab", function()
		local displayName, class = UnitClass("player");
		local changedList = WHAT_HAS_CHANGED_DISPLAY[class];
		local changedTitle = WHAT_HAS_CHANGED_TITLE[class];

		SpellBookWhatHasChanged.ClassName:SetText(displayName);
		SpellBookWhatHasChanged.ClassName:SetTextColor(unpack(miirgui.Color))
		SpellBookWhatHasChanged.ClassName:SetFont(unpack(miirgui.font),18, "OUTLINE")
		SpellBookWhatHasChanged.ClassName:SetShadowColor(0,0,0,0)

		if ( changedList ) then
			for i=1, #changedList do
				local frame = SpellBook_GetWhatChangedItem(i);
				frame.Number:SetText(i);
				frame.Title:SetText(changedTitle[i]);
				frame.Title:SetTextColor(unpack(miirgui.Color))
				frame.Title:SetFont(unpack(miirgui.font),14, "OUTLINE")
				frame.Title:SetShadowColor(0,0,0,0)
				frame:SetText(changedList[i], true);
				frame:SetTextColor(1, 1, 1)
				frame:SetFont(unpack(miirgui.font),12, "OUTLINE")
				frame:SetShadowColor(0,0,0,0)
			end
		end
		end)

--[[GuildRegistrarFrame Changes]]	
		GuildRegistrarRealBG=select(19,GuildRegistrarFrame:GetRegions())
		GuildRegistrarRealBG:Hide()
		GuildRegistrarFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		AvailableServicesText:SetTextColor(1,1,1,1)
		AvailableServicesText:SetShadowColor(0,0,0,0)
		AvailableServicesText:SetFont(unpack(miirgui.font),13, "OUTLINE")
		Border(GuildRegistrarFrame,332,340,"TopLeft",2,-60,14)

--[[OptionsFrameChanges]]	

		InterfaceOptionsFramePanelContainer:SetBackdrop({
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 14,
		})
		InterfaceOptionsFrameHeader:Hide()
		InterfaceOptionsFrameHeaderText:Hide()
		VideoOptionsFrameHeader:Hide()
		VideoOptionsFrameHeaderText:Hide()
		
--[[WatchFrame]]

		hooksecurefunc("WatchFrame_SetLine", function(line, anchor, verticalOffset, isHeader, text, dash, hasItem, isComplete, eligible)
	-- text
	line.text:SetText(text);
	if ( isHeader ) then
		WATCHFRAME_SETLINES_NUMLINES = 0;
		line.text:SetTextColor(unpack(miirgui.Color));
		line.text:SetShadowColor(0,0,0,0)
		line.text:SetFont(unpack(miirgui.font),12, "OUTLINE")
	else
		--this should be the default, set in WatchFrameLineTemplate_Reset
		if ( eligible ~= nil and eligible == false) then
			line.text.eligible = eligible;
			line.text:SetTextColor(unpack(miirgui.Color));
			line.text:SetShadowColor(0,0,0,0)
			line.text:SetFont(unpack(miirgui.font),12, "OUTLINE")
		else
			line.text.eligible = true;
			line.text:SetTextColor(1, 1, 1);
			line.text:SetShadowColor(0,0,0,0)
			line.text:SetFont(unpack(miirgui.font),12, "OUTLINE")
		end
	end
	
		end)

		WatchFrameTitle:SetTextColor(1,1,1,1)
		WatchFrameTitle:SetFont(unpack(miirgui.font),12, "OUTLINE")
		WatchFrameTitle:SetShadowColor(0,0,0,0)

		hooksecurefunc("WatchFrameLinkButtonTemplate_Highlight", function(self, onEnter)
	local line;
	for index = self.startLine, self.lastLine do
		line = self.lines[index];
		if ( line ) then
			if ( index == self.startLine ) then
				-- header
				if ( onEnter ) then
					line.text:SetTextColor(unpack(miirgui.Color));
				else
					line.text:SetTextColor(unpack(miirgui.Color));
				end
			else
				if ( onEnter ) then
					if (line.text.eligible) then
						line.text:SetTextColor(0.8,0.8,0.8,1);
					else
						line.text:SetTextColor(0.8,0.8,0.8,1);
					end
					line.dash:SetTextColor(0.8,0.8,0.8,1);
				else
					if (line.text.eligible) then
						line.text:SetTextColor(1,1,1,1);
					else
						line.text:SetTextColor(1,1,1,1);
					end
					line.dash:SetTextColor(1, 1, 1,1);
				end
			end
		end
	end
		end)
				
--[[TargetFrame Changes]]	

		hooksecurefunc("TargetFrame_CheckClassification",function(self, forceNormalTexture)
			local classification = UnitClassification(self.unit);
			self.nameBackground:Show();
			self.manabar:Show();
			self.manabar.TextString:Show();
			self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
		
			if ( forceNormalTexture ) then
				self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
			elseif ( classification == "minus" ) then
				self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus");
				self.nameBackground:Hide();
				self.manabar:Hide();
				self.manabar.TextString:Hide();
				forceNormalTexture = true;
			elseif ( classification == "worldboss" or classification == "elite" ) then
				self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
			elseif ( classification == "rareelite" ) then
				self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite");
			elseif ( classification == "rare" ) then
				self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare");
			else
				self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
				forceNormalTexture = true;
			end
				
			if ( forceNormalTexture ) then
				self.haveElite = nil;
				if ( classification == "minus" ) then
					self.Background:SetSize(119,12);
					self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 47);
				else
					self.Background:SetSize(119,25);
					self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
				end
				if ( self.threatIndicator ) then
					if ( classification == "minus" ) then
						self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
						self.threatIndicator:SetTexCoord(0, 1, 0, 1);
						self.threatIndicator:SetWidth(256);
						self.threatIndicator:SetHeight(128);
						self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -23, 0);
					else
						self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
						self.threatIndicator:SetWidth(242);
						self.threatIndicator:SetHeight(93);
						self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -23, 0);
					end
				end	
			else
				self.haveElite = true;
				TargetFrameBackground:SetSize(119,41);
				if ( self.threatIndicator ) then
					self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
					self.threatIndicator:SetWidth(242);
					self.threatIndicator:SetHeight(93);
					self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -23, 0);
				end		
			end	
			if (self.questIcon) then
				if (UnitIsQuestBoss(self.unit)) then
					self.questIcon:Show();
				else
					self.questIcon:Hide();
				end
			end
		end)
		
--[[Combuctor Icon Fix]]

if (CombuctorFrame1) then
	CombuctorFrame1Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
	CombuctorFrame1Portrait:ClearAllPoints()
	CombuctorFrame1Portrait:SetPoint("TopLeft", -6,7)
end
				
--[[GameMenu Changes]]

gamemenubg = select(1,GameMenuFrame:GetRegions())
gamemenubg:ClearAllPoints()
gamemenubg:SetPoint("Topleft", GameMenuFrame, 8,-8)
gamemenubg:SetPoint("Bottomright", GameMenuFrame, -8,8)

--[[Static Popup Changes]]

staticbg = select(1,StaticPopup1:GetRegions())
staticbg:ClearAllPoints()
staticbg:SetPoint("Topleft",StaticPopup1, 8,-8)
staticbg:SetPoint("Bottomright", StaticPopup1, -8,8)

		frame:SetScript("OnEvent", frame.OnEvent);
		frame2:SetScript("OnEvent", frame2.OnEvent);

end)