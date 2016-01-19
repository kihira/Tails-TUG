-- Tails

-------------------------------------------------------------------------------
if Tails == nil then
	Tails = EternusEngine.ModScriptClass.Subclass("Tails")
end

-------------------------------------------------------------------------------
function Tails:Constructor(  )
    self.b_assignedTail = false
    self.b_check = false
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