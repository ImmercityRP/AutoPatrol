local active = false
local framework = Config.Framework
local speed = Config.DefaultSpeed
local speeds = Config.Speeds
local speedMod, vehicle

if Config.SpeedUnit == 'MPH' then 
    speedMod = 2.236936 
elseif Config.SpeedUnit == 'KMH' then 
    speedMod = 3.6 
end

RegisterCommand("AutoPatrol", function()
    if framework == 'Standalone' or (framework == 'ESX' and not Config.Jobs or (Config.Jobs and JobCheck())) then
        ped = PlayerPedId()
        if active == false then
            if IsPedInAnyVehicle(ped, false) then
                vehicle = GetVehiclePedIsIn(ped, false)
                if GetPedInVehicleSeat(vehicle, -1) == ped then
                    SetDriverAbility(ped, 1.0)
                    SetDriverAggressiveness(ped, 0.0)
                    TaskVehicleDriveWander(ped,vehicle,GetVehicleModelMaxSpeed(GetEntityModel(vehicle)),Config.DriveStyle)
                    SetVehicleMaxSpeed(vehicle, speeds[speed])
                    active = true
                    if framework == 'ESX' then
                        ESX.ShowNotification('~r~Automatic ~s~Patrol ~b~Enabled~s~')
                        ESX.ShowNotification('~r~Adjust ~s~Patrol ~b~Speed~s~: ~y~'..Config.SpeedUpLabel..'~s~ / ~y~'..Config.SpeedDownLabel..'~s~')
                    end
                end
            end
        else
            ClearPedTasks(ped)
            SetVehicleMaxSpeed(vehicle, 0.0) --Sets vehicle back to normal speeds for regular driving
            active = false
            if framework == 'ESX' then
                ESX.ShowNotification('~r~Automatic ~s~Patrol ~b~Disabled~s~')
            end
        end
    end
end)

function JobCheck()
    if not ESX.PlayerData or not ESX.PlayerData.job then 
        return false 
    end
    for k,v in pairs(Config.Jobs) do
        if ESX.PlayerData.job.name == v then 
            return true 
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if active then
            if IsControlJustReleased(0, Config.SpeedUp) then
                speed = speed + 1
                if speed >= #speeds then speed = #speeds end
                local currentSpeed = math.floor(speeds[speed] * speedMod)
                if framework == 'ESX' then
                    ESX.ShowNotification('~r~Patrol Speed~s~: '..currentSpeed..'~b~ '..Config.SpeedUnit..'~s~')
                end
                SetVehicleMaxSpeed(vehicle, speeds[speed])
            elseif IsControlJustReleased(0, Config.SpeedDown) then
                speed = speed - 1
                if speed <= 1 then speed = 1 end
                local currentSpeed = math.floor(speeds[speed] * speedMod)
                if framework == 'ESX' then
                    ESX.ShowNotification('~r~Patrol Speed~s~: '..currentSpeed..'~b~ '..Config.SpeedUnit..'~s~')
                end
                SetVehicleMaxSpeed(vehicle, speeds[speed])
            end
        else
            Wait(1000)
        end
    end
end)

RegisterKeyMapping("AutoPatrol", "AutoPatrol", "Keyboard", Config.Keybind)