-- =====================================
-- Archipelago Channel Unlock Logic
-- =====================================

APData = {
    slot_data = nil,
    progression = {},  -- list of numbers
    channel_order = {}, -- list of names
    keys = 0           -- how many keys you’ve found (can be updated from items)
}

-- Called automatically when connecting to the AP server
Archipelago:AddClearHandler("LoadSlotData", function(slot_data)
    APData.slot_data = slot_data
    APData.progression = slot_data.progression or {}
    APData.channel_order = slot_data.Channel_Order or {}

    print("✅ Slot data received!")
    print("Progression list:", table.concat(APData.progression, ", "))
    print("Channel order:", table.concat(APData.channel_order, ", "))

    APData.keys = 0 -- start fresh each time
end)

-- Get how many channels are currently unlocked
function getUnlockedChannels()
    if not APData.progression or not APData.channel_order then
        return {}
    end
   
    --local keys = (APData.keys or 0)+1
    local keys = Tracker:FindObjectForCode("Channel_Key").AcquiredCount+1
    print("keys", keys)
    local totalUnlocked = 1
    for i = 1, keys do
        totalUnlocked = totalUnlocked + (APData.progression[i] or 0)
    end
    print("totalUnlocked", totalUnlocked)
    local unlocked = {}
    for i = 1, totalUnlocked do
        local idx = APData.channel_order[i]
        if idx ~= nil then
            table.insert(unlocked, tostring(idx))
        end
    end

    return unlocked
end

-- Check if a given channel (like "8", "3", "21") is unlocked
function canAccessChannel(channel_id)
    local unlocked = getUnlockedChannels()

    print("Checking channel:", channel_id)
    print("Unlocked channels:", table.concat(unlocked, ", "))

    for idx, id in ipairs(unlocked) do
        print("Loop index:", idx, "id:", id, "type(id):", type(id))
        if id == tostring(channel_id) then
            print("Match found for channel", channel_id)
            return true
        end
    end

    print("No match found for channel", channel_id)
    return false
end
