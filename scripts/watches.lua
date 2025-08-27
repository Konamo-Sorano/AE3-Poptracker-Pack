function updatePlayer()
    local val = Tracker:ProviderCountForCode("Yumi") > 0
    if val then
        Tracker:AddLayouts("layouts/Yumi_items.jsonc")
    else
        Tracker:AddLayouts("layouts/items.jsonc")
    end
end
ScriptHost:AddWatchForCode("updatePlayer", "Player", updatePlayer)