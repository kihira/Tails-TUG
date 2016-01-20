-- Tail
include("Scripts/Objects/PlaceableObject.lua")
-------------------------------------------------------------------------------

Tail = PlaceableObject.Subclass("Tail")

-------------------------------------------------------------------------------

function Tail:Constructor( args )
    --Tail.__super.Constructor(args)
    self.m_player = nil
end

-------------------------------------------------------------------------------
function Tail:PostLoad( )
    Tail.__super.PostLoad(self)
    self:NKSetControllerCapsuleSize(0, 0)
    self:NKEnableScriptProcessing(true)
end

function Tail:Update( dt )
    --local gfx = self:NKGetAnimatedGraphics()
    --gfx:GetBlendInfo():NKSetState("Idle State", 0)
    --if not gfx:NKGetBlendSlot("Full Body Slot"):GetPlayingAnimation() then
        --NKWarn("Starting animation")
       --gfx:NKGetBlendSlot("Full Body Slot"):NKPlayCustomAnimHold(gfx:GetAnimation("Idle"), 0.1, true)
    --end
end

function Tail:Spawn()
    Tail.__super.Spawn(self)
    --local gfx = self:NKGetAnimatedGraphics()
    --gfx:GetBlendInfo():NKSetState("Idle State", 0)
end

EntityFramework:RegisterGameObject(Tail)