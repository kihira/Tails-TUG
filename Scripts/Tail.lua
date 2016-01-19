-- Tail
include("Scripts/Characters/BasePlayer.lua")

-------------------------------------------------------------------------------

-- Override model create to hook in adding Tail
local BasePlayer__SetThirdPersonGameObject = BasePlayer._SetThirdPersonGameObject
BasePlayer._SetThirdPersonGameObject = function(self, gameObjectName)
    BasePlayer__SetThirdPersonGameObject(self, gameObjectName)

    self.m_tail = Eternus.GameObjectSystem:NKCreateGameObject("Tail", true)
    self.m_3pobject:NKAddChildObject(self.m_tail)
    self.m_tail:NKSetAttachBone("Bn_SpB01")
    --self.m_3pobject:NKAddChildAtAttachPoint(self.m_tail, "tail", "Bn_SpB01", true)
    self.m_tail.m_player = self
    self.m_tail:NKSetPosition(vec3.new(0.0, 0.0, 0.0), false)
    self.m_tail:NKSetOrientation(quat.new(1.0, 0.0, 0.0, 0.0))
    self.m_tail:NKScale(1.0, false)
end

-------------------------------------------------------------------------------

Tail = BaseCharacter.Subclass("Tail")

-------------------------------------------------------------------------------

function Tail:Constructor( args )
    self.m_player = nil
end

-------------------------------------------------------------------------------
function Tail:Update( dt )
    if not self.m_player:IsDead() then
        self:NKSetPosition(self.m_player.m_3pobject:NKGetPosition())
        self:NKSetOrientation(self.m_player.m_3pobject:NKGetOrientation())
    end
end

function Tail:Spawn()
    self:NKSetControllerCapsuleSize(1, 1)
    self:NKEnableScriptProcessing(true)
end

EntityFramework:RegisterGameObject(Tail)