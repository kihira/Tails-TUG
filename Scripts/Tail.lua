-- Tail
include("Scripts/Objects/PlaceableObject.lua")
-------------------------------------------------------------------------------

Tail = EternusEngine.GameObjectClass.Subclass("Tail")

-------------------------------------------------------------------------------

function Tail:Constructor( args )
    --Tail.__super.Constructor(args)
    self.m_player = nil
end

-------------------------------------------------------------------------------
function Tail:PostLoad( )
    self:NKSetControllerCapsuleSize(0, 0)
    self:NKEnableScriptProcessing(true)
end

function Tail:Update( dt )
    local gfx = self:NKGetAnimatedGraphics()
    --gfx:GetBlendInfo():NKSetState("Idle State", 0)
    --if not gfx:NKGetBlendSlot("Full Body Slot"):GetPlayingAnimation() then
        --NKWarn("Starting animation")
       --gfx:NKGetBlendSlot("Full Body Slot"):NKPlayCustomAnimHold(gfx:GetAnimation("Idle"), 0.1, true)
    --end
end

function Tail:Spawn()
    --local gfx = self:NKGetAnimatedGraphics()
    --gfx:GetBlendInfo():NKSetState("Idle State", 0)
end

EntityFramework:RegisterGameObject(Tail)