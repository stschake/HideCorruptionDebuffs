local frame = CreateFrame("FRAME")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent",
  function(self, event, arg1)
    if event ~= "ADDON_LOADED" or arg1 ~= "HideCorruptionDebuffs" then return end

    local prevhook = _G.CompactUnitFrame_Util_ShouldDisplayDebuff
    _G.CompactUnitFrame_Util_ShouldDisplayDebuff = function(...)
      local name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, _, spellId, canApplyAura, isBossAura = ...;
      if name == "Corrupted Zone" or name == "Grasping Tendrils" or name == "Grand Delusions" or name == "Creeping Death" then return false end
      return prevhook(...)
    end
    print("HideCorruptionDebuffs loaded")
  end
)
