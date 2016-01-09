-- Tails

-------------------------------------------------------------------------------
if Tails == nil then
	Tails = EternusEngine.ModScriptClass.Subclass("MyModName")
end

-------------------------------------------------------------------------------
function Tails:Constructor(  )

end


-------------------------------------------------------------------------------
-- Called once from C++ at engine initialization time
function Tails:Initialize()
end

-------------------------------------------------------------------------------
-- Called from C++ when the current game enters 
function Tails:Enter()
end

-------------------------------------------------------------------------------
-- Called from C++ when the game leaves it current mode
function Tails:Leave()
end

-------------------------------------------------------------------------------
-- Called from C++ every update tick
function Tails:Process(dt)
end

-------------------------------------------------------------------------------
-- Called from C++ every time the world is saved
function Tails:Save(outData)
end

-------------------------------------------------------------------------------
-- Called from C++ every time the world is restored
function Tails:Restore(inData, version)
end

EntityFramework:RegisterModScript(Tails)