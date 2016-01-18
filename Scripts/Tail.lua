-- Tail

-------------------------------------------------------------------------------
if Tail == nil then
    Tail = EternusEngine.ModScriptClass.Subclass("Tail")
end

-------------------------------------------------------------------------------
function Tails:Constructor(  )
    self.b_assignedTail = false
    self.b_check = false
end

function Tails:LocalPlayerReady(player)
    local gfx = player.m_3pobject:NKGetAnimatedGraphics()
    gfx:NKSetSubmeshVisibility("Geo_FoxTail", true)

    -- Animation
    player.m_tailAnimSlot = gfx:NKGetBlendSlot("Tail")

    --WorldService.NKGetLocalWorldPlayer():NKGetPawn().m_3pobject:ApplyRule("Chest", { submesh = "Geo_FoxTail" })
    --WorldService.NKGetLocalWorldPlayer():NKGetPawn().m_3pobject:SetSlotAppearanceRules("Chest" , { ['Chest'] = { priority = 0.5, submesh = ("Geo_FoxTail") } } )

    --Note for self
    --Bone weight per vertex matters
    --Have to assign high weight to Bn_spB01 to prevent deformation
    --Might be able to counter that with custom animation
    --Working theory is that because default animations does not have bone animation for our bone structure
    --Causes it to do weird stuff
    --TODO create idle animation to see if it combats deformation
    --Animations can only be defined in game object data file...
    --Maybe create placeholder game object for tail, set position to player and use GetBonePosition to get specific anchor point
    self.b_assignedTail = true
    NKWarn("Assigned Tail")
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