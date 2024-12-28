local frame = CreateFrame("Frame", "FollowFrame", UIParent)
frame:SetSize(75, 25)
frame:SetPoint("CENTER")

local texture = frame:CreateTexture(nil, "BACKGROUND")
texture:SetAllPoints(frame)
texture:SetColorTexture(0, 0, 0, 0.5)

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("CENTER")
title:SetText("Follow")

frame:EnableMouse(true)
frame:SetMovable(true) 
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

frame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not IsShiftKeyDown() then
        if UnitExists("target") and UnitIsFriend("player", "target") then
            FollowUnit("target")
        else
            print("No target")
        end
    end
end)

