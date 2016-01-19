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

-- Callback function
function Tails:SpawnTail(userInput, args, commandName, player)
    -- Print "Hello world from ExampleMod!" to the (local) chat window
    local m_tail = Eternus.GameObjectSystem:NKCreateGameObject("Tail", true)
    m_tail:NKSetPosition(player:NKGetPosition(), false)
    m_tail:NKSetOrientation(player:NKGetOrientation())
    NKWarn(m_tail:NKGetPosition():NKToString())
end

-- Override model create to hook in adding Tail
local BasePlayer__SetThirdPersonGameObject = BasePlayer._SetThirdPersonGameObject
BasePlayer._SetThirdPersonGameObject = function(self, ...)
    BasePlayer__SetThirdPersonGameObject(self, ...)

    self.m_tail = Eternus.GameObjectSystem:NKCreateGameObject("Tail", true)
    --self.m_3pobject:NKAddChildObject(self.m_tail)
    --self.m_tail:NKSetAttachBone("Bn_SpB01")
    --self.m_3pobject:NKAddChildAtAttachPoint(self.m_tail, "tail", "Bn_SpB01", true)
    self.m_tail.m_player = self
    self.m_tail:NKSetPosition(vec3.new(0.0, 0.0, 0.0), false)
    self.m_tail:NKSetOrientation(quat.new(1.0, 0.0, 0.0, 0.0))
    self.m_tail:NKScale(1.0, false)
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