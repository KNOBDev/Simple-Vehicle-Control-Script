-- E N G I N E --
RegisterNetEvent('engineoff')
AddEventHandler('engineoff',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			
			SetVehicleUndriveable(vehicle,true)
			ShowNotification("Engine ~r~off~s~.")
	end
end)
RegisterNetEvent('engineon')
AddEventHandler('engineon',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			
			SetVehicleUndriveable(vehicle,false)
			ShowNotification("Engine ~g~on~s~.")
	end
end)
-- T R U N K --
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player,true)
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			
			if (isopen == 0) then
			SetVehicleDoorOpen(vehicle,5,0,0)
			else
			SetVehicleDoorShut(vehicle,5,0)
			end
end)
-- R E A R  D O O R S --
RegisterNetEvent('rdoors')
AddEventHandler('rdoors',function() 
	local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player,true)
			local isopen = GetVehicleDoorAngleRatio(vehicle,2) and GetVehicleDoorAngleRatio(vehicle,3)
			
			if (isopen == 0) then
			SetVehicleDoorOpen(vehicle,2,0,0)
			SetVehicleDoorOpen(vehicle,3,0,0)
			else
			SetVehicleDoorShut(vehicle,2,0)
			SetVehicleDoorShut(vehicle,3,0)
			end
end)

-- H O O D --
RegisterNetEvent('hood')
AddEventHandler('hood',function() 
	local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player,true)
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			
			if (isopen == 0) then
			SetVehicleDoorOpen(vehicle,4,0,0)
			else
			SetVehicleDoorShut(vehicle,4,0)
			end
end)
-- L O C K --
RegisterNetEvent('lock')
AddEventHandler('lock',function()
	local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player,true)
	local islocked = GetVehicleDoorLockStatus(vehicle)			
			if (islocked == 1)then
			SetVehicleDoorsLocked(vehicle, 2)
			ShowNotification("Vehicle locked.")
			else
			SetVehicleDoorsLocked(vehicle,1)
			ShowNotification("Vehicle unlocked.")
			end
	end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end