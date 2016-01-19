-- Tail
-------------------------------------------------------------------------------

Tail = EternusEngine.GameObjectClass.Subclass("Tail")

-------------------------------------------------------------------------------

function Tail:Constructor( )
    self.m_player = nil
end

-------------------------------------------------------------------------------
function Tail:PostLoad( )
    self:NKSetControllerCapsuleSize(10, 10)
    self:NKEnableScriptProcessing(true)
    NKWarn("Post load")
end

function Tail:Update( dt )
    if self.m_player and not self.m_player:IsDead() then
        self:NKSetShouldRender(true, true)
        --self:NKSetPosition(self.m_player.m_3pobject:NKGetPosition())
        --self:NKSetOrientation(self.m_player.m_3pobject:NKGetOrientation())
        --NKWarn(self:NKGetPosition():NKToString())
    else
        --NKWarn("Player dead")
    end
end

function Tail:Spawn()

end

EntityFramework:RegisterGameObject(Tail)