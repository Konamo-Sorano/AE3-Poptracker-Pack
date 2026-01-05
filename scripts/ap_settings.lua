-- ============================================
-- Archipelago Settings Loader
-- ============================================

APSettings = {}

Archipelago:AddClearHandler("LoadSlotData", function(slot_data)
    print("📡 Loading AP settings...")
    APSettings.raw = slot_data
    applySimpleSettings()
end)

function applySimpleSettings()
    if not APSettings.raw then return end
    
    print("Applying settings...")
    
    -- 1. Logic Preference - Set the PROGRESSIVE item directly
    if APSettings.raw.logic_preference ~= nil then
        local logicValue = APSettings.raw.logic_preference
        print("Logic value: " .. tostring(logicValue))
        
        -- Find the PROGRESSIVE item (not the individual toggles)
        local logicItem = Tracker:FindObjectForCode("Logic")
        
        if logicItem then
            -- For progressive items: CurrentStage is 0-based
            -- 0=Easy, 1=Normal, 2=Hard, 3=Expert, 4=HDS MQJ
            if logicValue >= 0 and logicValue <= 4 then
                logicItem.CurrentStage = logicValue
                print("✓ Set Logic to stage: " .. logicValue)
            else
                print("⚠️ Invalid logic value: " .. tostring(logicValue))
            end
        else
            print("❌ Could not find progressive item with code 'Logic'")
        end
    else
        print("No logic_preference setting")
    end
    
    -- 2. Camera Sanity
    if APSettings.raw.camerasanity ~= nil then
        local camItem = Tracker:FindObjectForCode("Camera setting")
        if camItem then
            camItem.Active = APSettings.raw.camerasanity == 1
            print("✓ Camera Sanity: " .. tostring(camItem.Active))
        end
    end
    
    -- 3. Cellphone Sanity
    if APSettings.raw.cellphonesanity ~= nil then
        local phoneItem = Tracker:FindObjectForCode("Cellphone setting")
        if phoneItem then
            phoneItem.Active = APSettings.raw.cellphonesanity == 1
            print("✓ Cellphone Sanity: " .. tostring(phoneItem.Active))
        end
    end
    
    -- Optional: Password monkeys
    if APSettings.raw.monkeysanity_passwords ~= nil then
        local passItem = Tracker:FindObjectForCode("Password")
        if passItem then
            passItem.Active = APSettings.raw.monkeysanity_passwords == 1
            print("✓ Password Monkeys: " .. tostring(passItem.Active))
        end
    end
    
    print("✅ Settings applied!")
end