-- [[ Framework Selector ]] -- 
function FrameworkSelector() -- Config Select
    if Config.FW == 'QBX' then
        print('[FrameworkSelector] QBX Core Loaded...')
        if Config.UseTarget then
            targetOptions = true
            print('[FrameworkSelector] Target options pending...')
        else 
            targetOptions = false
        end
        elseif Config.FW == 'STANDALONE' then
        print('[FrameworkSelector] Standalone loaded...')
        if Config.UseTarget then
            targetOptions = true
            print('[FrameworkSelector] Target options pending...')
        else 
            targetOptions = false
        end
    else
        error('[FrameworkSelector] Framework not supported...')
    end
end

-- Auto Framework Selector [QBX Support/QBCore/ESX]
QBX = false
QBCore = false
ESX = false

function AutoSelect()
    if GetResourceState('qbx_core') == 'started' then
        QBX = true
        ESX = false
        QBCore = false
        print('[FrameworkSelector] QBX Core Loaded...')
    elseif GetResourceState('qb_core') == 'started' then
        QBCore = true
        QBX = false
        ESX = false
        print('[FrameworkSelector] QB_Core Loaded...')
    elseif GetResourceState('es_extended') == 'started' then
        ESX = true
        QBX = false
        QBCore = false
        print('[FrameworkSelector] ESX Loaded...')
    else
        error('[FrameworkSelector] Framework not supported...')
    end
end

AddEventHandler("onResourceStart", function(resName)
    if (GetCurrentResourceName() == resName) then
		Wait(350)
        if Config.Selector then
            FrameworkSelector()
        else 
            AutoSelect()
        end
    end
end)