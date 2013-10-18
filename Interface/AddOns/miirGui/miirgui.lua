local _, miirgui = ...

miirgui.Color = {0.70,0.69,0.70,1}



function glv()

local lan = GetLocale()

	if lan == "enUS" then

		miirgui.font = {"Fonts\\FRIZQT__.TTF"}

		
	elseif lan == "deDE" then

		miirgui.font = {"Fonts\\FRIZQT__.TTF"}

		
	elseif lan == "frFR" then

		miirgui.font = {"Fonts\\FRIZQT__.TTF"}

		
	elseif lan == "esMX" then

		miirgui.font = {"Fonts\\FRIZQT__.TTF"}

		
	elseif lan == "esES" then

		miirgui.font = {"Fonts\\FRIZQT__.TTF"}

		
	elseif lan == "koKR" then	

		miirgui.font ={"Fonts\\2002.TTF"}

		
	elseif lan ==  "zhCN" then	

		miirgui.font ={"Fonts\\ARKai_T.ttf"}
	
		
	elseif lan == "zhTW" then

		miirgui.font ={"Fonts\\bHEI01B.TTF"}	

		
	elseif lan == "ruRU" then
		
		miirgui.font= {"Fonts\\FRIZQT___CYR.TTF"}

	
	elseif lan == "itIT" then

	miirgui.font = {"Fonts\\FRIZQT__.TTF"}
	
	end	
	

end


local f = CreateFrame("Frame");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:SetScript("OnEvent", function()

glv()
end)