--[[ 
 ((      /|_/|
  \\.._.'  , ,\
  /\ | '.__ v /			Addon created by Miiru - Eu Lordaron
 (_ .   /   "        
  ) _)._  _ /				Please don't change anything if you don't know what you do.
 '.\ \|( / ( 
   '' ''\\ \\
   
]]

Minimap:SetMaskTexture("Interface\\AddOns\\miirGui\\gfx\\Mask-SQUARE");			--Make the Minimap a Square
function GetMinimapShape() return "SQUARE" end

Minimap:EnableMouseWheel(true)
MinimapZoomOut:Hide()
MinimapZoomIn:Hide()
Minimap:SetScript("OnMouseWheel", function(zoom,arg)
	if arg > 0 and zoom:GetZoom() < 5 then
			zoom:SetZoom(zoom:GetZoom() + 1)
	elseif arg < 0 and zoom:GetZoom() > 0 then
      zoom:SetZoom(zoom:GetZoom() - 1)
  end
end)
MiniMapWorldMapButton:Hide()
MinimapZoneTextButton:SetPoint("Center", Minimap, "Top", 8,8)
hooksecurefunc("Minimap_UpdateRotationSetting", function()
	if ( GetCVar("rotateMinimap") == "1" ) then
		MinimapCompassTexture:Show();
		MinimapNorthTag:Hide();
	else
		MinimapCompassTexture:Hide();
		MinimapNorthTag:Hide();
	end
end)
