-- Tails
include("Scripts/Characters/BasePlayer.lua")

-------------------------------------------------------------------------------
if Tails == nil then
	Tails = EternusEngine.ModScriptClass.Subclass("Tails")
end

-------------------------------------------------------------------------------
function Tails:Constructor()
    self.b_assignedTail = false
    self.b_check = false
end

function Tails:Initialize()
    Eternus.GameState:RegisterSlashCommand("SpawnTail", self, "SpawnTail")
end

function Tails:SpawnTail(userInput, args, commandName, player)
    local m_tail = Eternus.GameObjectSystem:NKCreateGameObject("Tail", true)
    m_tail:NKSetPosition(player:NKGetPosition(), false)
    m_tail:NKSetOrientation(player:NKGetOrientation())
    m_tail:NKPlaceInWorld(true, false)
    NKWarn(m_tail:NKGetPosition():NKToString())
end

-- Override model create to hook in adding Tail
local BasePlayer__SetThirdPersonGameObject = BasePlayer._SetThirdPersonGameObject
BasePlayer._SetThirdPersonGameObject = function(self, ...)
    BasePlayer__SetThirdPersonGameObject(self, ...)

    self.m_tail = Eternus.GameObjectSystem:NKCreateGameObject("Tail3", true)
    self.m_tail:NKPlaceInWorld(false, false)
    self.m_3pobject:NKAddChildObject(self.m_tail)
    self.m_tail:NKSetAttachBone("Bn_SpB01")
    self.m_tail.m_player = self
    --self.m_tail:NKSetPosition(vec3.new(0.0, 0.0, 0.0), false)
    local rot = quat.new(0.5, 0, 0.86603, 0)
    rot = rot * quat.new(0.70711, -0.70711, 0, 0)
    self.m_tail:NKSetOrientation(rot)
end

-------------------------------------------------------------------------------
-- Called from C++ every time the world is saved
--function Tails:Save(outData)
--end

-------------------------------------------------------------------------------
-- Called from C++ every time the world is restored
--function Tails:Restore(inData, version)
--end

EntityFramework:RegisterModScript(Tails)

-------------------------------------------------------------------------------