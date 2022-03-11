local recoils = {}

local cos = false


local Mario = {
	cols = {
	  [16] =  {r=55,  g=55,   b=55},
	  [18] =  {r=55,  g=55,   b=135},
	  [24] =  {r=55,  g=95,   b=135},
	  [52] =  {r=95,  g=55,   b=55},
	  [67] =  {r=95,  g=135,  b=175},
	  [88] =  {r=135, g=55,   b=55},
	  [95] =  {r=135, g=95,   b=95},
	  [124] = {r=175, g=55,   b=55},
	  [133] = {r=175, g=95,   b=175},
	  [173] = {r=215, g=135,  b=95},
	  [203] = {r=255, g=95,   b=95},
	  [210] = {r=255, g=135,  b=135},
	  [216] = {r=255, g=175,  b=135},
	  [222] = {r=255, g=215,  b=135},
	  [231] = {r=255, g=255,  b=255},
	},
	bits = {
	  {
		133,133,133,133,88,88,88,88,88,88,133,133,133,133,133,133,
		133,133,133,88,124,222,222,124,124,124,88,133,133,133,133,133,
		133,133,133,88,124,231,231,203,203,203,124,88,133,133,133,133,
		133,133,88,88,88,88,88,88,88,203,203,124,88,88,133,133,
		133,88,124,203,203,203,203,124,124,88,203,203,124,124,88,133,
		133,88,88,88,88,88,88,88,88,88,124,203,203,124,88,133,
		133,133,133,95,231,231,210,231,231,210,88,88,88,88,88,133,
		133,133,133,95,231,67,216,67,231,210,210,52,52,95,133,133,
		133,133,133,95,231,16,216,16,231,216,210,52,52,216,95,133,
		133,133,95,216,216,216,216,216,216,216,52,52,52,216,95,133,
		133,133,16,210,216,216,210,210,16,216,216,52,210,95,133,133,
		133,16,16,16,210,210,16,16,16,16,216,210,210,52,52,133,
		133,133,133,16,16,16,16,16,216,216,210,210,52,52,133,133,
		133,133,133,133,95,210,210,210,210,210,210,95,133,133,133,133,
		133,133,95,95,24,18,88,88,88,18,18,88,88,88,133,133,
		133,95,231,24,18,124,124,124,18,24,203,203,203,124,88,133,
		95,231,222,18,124,203,203,18,24,124,95,95,95,203,124,88,
		95,222,222,18,124,124,124,18,24,95,231,231,231,95,124,88,
		133,95,18,24,18,18,18,24,95,231,231,231,231,222,95,88,
		133,133,18,222,67,67,222,222,95,231,231,231,222,222,95,133,
		133,52,52,222,67,67,222,222,67,95,222,222,222,95,133,133,
		52,173,173,52,24,67,67,67,67,24,95,95,95,52,133,133,
		52,95,95,173,52,67,24,24,67,67,24,24,18,95,52,133,
		52,52,95,95,52,24,24,18,24,67,67,67,18,95,52,52,
		52,52,95,95,52,24,18,18,18,24,24,67,18,95,95,52,
		133,52,52,95,52,18,133,133,133,18,18,24,18,173,95,52,
		133,52,52,52,133,133,133,133,133,133,133,18,18,173,95,52,
		133,133,133,133,133,133,133,133,133,133,133,133,133,52,52,133
	  },
	  {
		133,133,133,133,88,88,88,88,88,88,133,133,133,133,133,133,
		133,133,133,88,124,222,222,124,124,124,88,133,133,133,133,133,
		133,133,133,88,124,231,231,203,203,203,124,88,133,133,133,133,
		133,133,88,88,88,88,88,88,88,203,203,124,88,88,133,133,
		133,88,124,203,203,203,203,124,124,88,203,203,124,124,88,133,
		133,88,88,88,88,88,88,88,88,88,124,203,203,124,88,133,
		133,133,133,95,231,231,210,231,231,210,88,88,88,88,88,133,
		133,133,133,95,231,67,216,67,231,210,210,52,52,95,133,133,
		133,133,133,95,231,16,216,16,231,216,210,52,52,216,95,133,
		133,133,95,216,216,216,216,216,216,216,52,52,52,216,95,133,
		133,133,16,210,216,216,210,210,16,216,216,52,210,95,133,133,
		133,16,16,16,210,210,16,16,16,16,216,210,210,52,52,133,
		133,133,133,16,16,16,16,16,216,216,210,210,52,52,133,133,
		133,133,133,133,95,210,210,210,210,210,210,95,133,133,133,133,
		133,133,133,133,18,88,88,88,18,18,88,88,88,133,133,133,
		133,133,95,18,124,124,124,18,95,95,95,203,203,88,133,133,
		133,95,231,18,124,203,203,95,231,231,231,95,203,203,88,133,
		133,95,222,18,124,124,95,231,231,231,231,222,95,124,88,133,
		133,95,18,24,18,18,95,231,231,231,222,222,95,124,88,133,
		133,133,18,222,67,67,222,95,222,222,222,95,88,88,133,133,
		133,133,18,222,67,67,222,222,95,95,95,24,24,18,133,133,
		133,18,24,24,67,67,24,24,67,67,24,24,18,133,133,133,
		133,52,52,24,24,24,24,18,24,67,67,24,18,52,133,133,
		52,173,173,52,24,24,24,18,24,24,24,24,52,95,52,133,
		52,95,95,173,52,24,18,133,18,24,24,24,52,95,52,133,
		133,52,95,95,95,52,133,133,133,52,52,52,173,95,52,133,
		133,133,52,95,95,52,133,133,52,173,173,95,95,52,133,133,
		133,133,133,52,52,52,133,133,52,52,52,52,52,133,133,133
	  },
	  {
		133,133,133,133,88,88,88,88,88,88,133,133,133,133,133,133,
		133,133,133,88,124,222,222,124,124,124,88,133,133,133,133,133,
		133,133,133,88,124,231,231,203,203,203,124,88,133,133,133,133,
		133,133,88,88,88,88,88,88,88,124,203,124,88,88,133,133,
		133,88,124,203,203,203,203,124,124,88,203,203,124,124,88,133,
		133,88,88,88,88,88,88,88,88,88,124,203,203,124,88,133,
		133,133,133,95,231,231,210,231,231,210,88,88,88,88,88,133,
		133,133,133,95,231,67,216,67,231,210,210,52,52,95,133,133,
		133,133,133,95,231,16,216,16,231,216,210,52,52,210,95,133,
		133,133,95,216,216,216,216,216,216,216,52,52,52,210,95,133,
		133,133,16,210,216,216,210,210,16,216,216,52,210,95,133,133,
		133,16,16,16,210,210,16,16,16,16,216,210,210,52,52,133,
		133,133,133,16,16,16,16,16,216,216,210,210,52,52,133,133,
		133,133,133,133,95,210,210,210,210,210,210,95,133,133,133,133,
		133,133,133,133,18,88,95,95,95,88,88,88,88,133,133,133,
		133,133,133,18,88,95,231,231,231,95,203,203,124,88,133,133,
		133,133,133,18,95,231,231,231,231,222,95,203,203,88,133,133,
		133,133,18,88,95,231,231,231,222,222,95,203,124,88,133,133,
		133,133,18,18,18,95,222,222,222,95,124,124,124,88,133,133,
		133,133,18,222,67,222,95,95,95,88,88,88,88,18,133,133,
		133,133,18,222,67,222,222,67,24,24,24,24,24,18,133,133,
		133,133,133,18,67,67,67,67,67,24,24,24,18,133,133,133,
		133,133,133,18,24,18,67,67,67,24,24,24,18,133,133,133,
		133,133,133,133,18,24,18,67,24,24,24,18,133,133,133,133,
		133,133,133,133,18,18,18,18,18,18,18,18,133,133,133,133,
		133,133,133,133,52,95,52,173,173,95,95,52,133,133,133,133,
		133,133,133,52,95,52,173,173,95,95,95,52,133,133,133,133,
		133,133,133,52,52,52,52,52,52,52,52,52,133,133,133,133
	  },
	},
  }
  
  local Cubes = {}
  
  local LastPedInteraction = 0
  local LastPedTurn
  local MarioInit
  local PedSpawned
  local EvilPed
  
  local MarioState = 1
  local MarioTimer = 0
  local MarioLength = 15
  local MarioAlpha = 0
  local MarioAdder = 1
  local MarioZOff = -20.0
  local MarioZAdd = 0.01
  
  DoAcid = function(time)
	local song = (time and time >= 200000 and 2 or 1)
	SendNUIMessage({type = "playMusic", song = song})
  
	InitCubes()
  
	local step = 0
	local timer = GetGameTimer() 
	local ped = GetPlayerPed(-1)
	local lastPos = GetEntityCoords(ped)
  
	while GetGameTimer() - timer < time do
	  local plyPos = GetEntityCoords(GetPlayerPed(-1))
	  local dist = GetVecDist(lastPos,plyPos)
	  if dist > 1.0 then
		step = step + 1
		if step == 5 then
		  step = 0
		  local dir = (lastPos - plyPos)
		  local vel = GetEntityVelocity(GetPlayerPed(-1))
		  SetEntityCoordsNoOffset(GetPlayerPed(-1),plyPos.x + dir.x, plyPos.y + dir.y,plyPos.z)
		  ForcePedMotionState(GetPlayerPed(-1), -1115154469, 1, 1, 0)
		  SetEntityVelocity(GetPlayerPed(-1), vel.x,vel.y,vel.z)
		end
		lastPos = GetEntityCoords(GetPlayerPed(-1))
	  end
  
	  DrawToons()
	  DrawCubes()
  
	  if MarioInit and not PedSpawned then 
		PedSpawned = true
		Citizen.CreateThread(InitPed)
	  end
	  Wait(0)
	end
  
	ClearTimecycleModifier()
	ShakeGameplayCam('DRUNK_SHAKE', 0.0)  
	SetPedMotionBlur(GetPlayerPed(-1), false)
  
	SetEntityAsMissionEntity(EvilPed,true,true)
	DeleteEntity(EvilPed)
  
	SendNUIMessage({type = "stopMusic"})
  
	Cubes = {}
  
	LastPedInteraction = 0
	LastPedTurn = nil
	MarioInit = nil
	PedSpawned = nil
	EvilPed = nil
  
	MarioState = 1
	MarioTimer = 0
	MarioLength = 15
	MarioAlpha = 0
	MarioAdder = 1
	MarioZOff = -20.0
	MarioZAdd = 0.01
  end
  
  InitPed = function()
	local plyPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(plyPed)
  
	local randomAlt     = math.random(0,359)
	local randomDist    = math.random(50,80)
	local spawnPos      = pos + PointOnSphere(0.0,randomAlt,randomDist)
  
	while World3dToScreen2d(spawnPos.x,spawnPos.y,spawnPos.z) and not IsPointOnRoad(spawnPos.x,spawnPos.y,spawnPos.z) do 
	  randomAlt   = math.random(0,359)
	  randomDist  = math.random(50,80)
	  spawnPos    = GetEntityCoords(GetPlayerPed(-1)) + PointOnSphere(0.0,randomAlt,randomSphere)
	  Citizen.Wait(0)
	end 
  
	EvilPed = ClonePed(plyPed, GetEntityHeading(plyPed), false, false)
	Wait(10)
	SetEntityCoordsNoOffset(EvilPed, spawnPos.x,spawnPos.y,spawnPos.z + 1.0)
	SetPedComponentVariation(EvilPed, 1, 60, 0, 0, 0)
  
	SetEntityInvincible(EvilPed,true)
	SetBlockingOfNonTemporaryEvents(EvilPed,true)
  
	TrackEnt()
  end
  
  TrackEnt = function()
	while true do
	  local dist = GetVecDist(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(EvilPed))
	  if dist > 5.0 then
		TaskGoToEntity(EvilPed, GetPlayerPed(-1), -1, 4.0, 100.0, 1073741824, 0)
		Wait(1000)
	  else       
		if not IsTaskMoveNetworkActive(EvilPed) then
		  RequestAnimDict("anim@mp_point")
		  while not HasAnimDictLoaded("anim@mp_point") do Wait(0); end
		  TaskMoveNetworkByName(EvilPed, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
		  SetPedCurrentWeaponVisible(EvilPed, 0, 1, 1, 1)
		  SetPedConfigFlag(EvilPed, 36, 1)
		end
  
		if not LastPedTurn or (GetGameTimer() - LastPedTurn) > 1000 then
		  LastPedTurn = GetGameTimer()
		  TaskTurnPedToFaceEntity(EvilPed, GetPlayerPed(-1), -1)
		end
  
		SetTaskMoveNetworkSignalFloat (EvilPed, "Pitch",          0.4)
		SetTaskMoveNetworkSignalFloat (EvilPed, "Heading",        0.5)
		SetTaskMoveNetworkSignalBool  (EvilPed, "isBlocked",      false)
		SetTaskMoveNetworkSignalBool  (EvilPed, "isFirstPerson",  false)
  
		if IsPedRagdoll(EvilPed) then
		  while IsPedRagdoll(EvilPed) do Wait(0); end
		  ClearPedTasksImmediately(EvilPed)
		  Wait(10)
		end
		Wait(0)
	  end
	end
  end
  
  InitCubes = function()
	for i=1,50,1 do
	  local r = math.random(5,255)
	  local g = math.random(5,255)
	  local b = math.random(5,255)
	  local a = math.random(50,100)
  
	  local x = math.random(1,180)
	  local y = math.random(1,359)
	  local z = math.random(15,35)
  
	  Cubes[i] = {pos=PointOnSphere(x,y,z),points={x=x,y=y,z=z},col={r=r, g=g, b=b, a=a}}
	end  
  
	ShakeGameplayCam('DRUNK_SHAKE', 0.0) 
	SetTimecycleModifierStrength(0.0) 
	SetTimecycleModifier("BikerFilter")
	SetPedMotionBlur(GetPlayerPed(-1), true)
  
	local counter = 4000
	local tick = 0
	while tick < counter do
	  tick = tick + 1
	  local plyPos = GetEntityCoords(GetPlayerPed(-1))
	  local adder = 0.1 * (tick/40)
	  SetTimecycleModifierStrength(math.min(0.1 * (tick/(counter/40)),1.5))
	  ShakeGameplayCam('DRUNK_SHAKE', math.min(0.1 * (tick/(counter/40)),1.5))  
	  for k,v in pairs(Cubes) do
		local pos = plyPos + v.pos
		DrawBox(pos.x+adder,pos.y+adder,pos.z+adder,pos.x-adder,pos.y-adder,pos.z-adder, v.col.r,v.col.g,v.col.g,v.col.a)
		local points = {x=v.points.x+0.1,y=v.points.y+0.1,z=v.points.z}
		Cubes[k].points = points
		Cubes[k].pos = PointOnSphere(points.x,points.y,points.z)
	  end
	  Wait(0)
	end
  end
  
  DrawCubes = function()
	local position = GetEntityCoords(GetPlayerPed(-1))
	local adder = 10
	for k,v in pairs(Cubes) do
	  local addX = 0.1
	  local addY = 0.1
  
	  if k%4 == 0 then
		addY = -0.1
	  elseif k%3 == 0 then
		addX = -0.1
	  elseif k%2 == 0 then
		addX = -0.1
		addY = -0.1
	  end
  
	  local pos = position + v.pos
	  DrawBox(pos.x+adder,pos.y+adder,pos.z+adder,pos.x-adder,pos.y-adder,pos.z-adder, v.col.r,v.col.g,v.col.g,v.col.a)
	  local points = {x=v.points.x+addX,y=v.points.y+addY,z=v.points.z}
	  Cubes[k].points = points
	  Cubes[k].pos = PointOnSphere(points.x,points.y,points.z)
	end
  end
  
  DrawToons = function()
	local plyPed = GetPlayerPed(-1)
	local plyPos = GetEntityCoords(plyPed)
  
	local infront = vector3(plyPos.x+35.0, plyPos.y-8.0,plyPos.z)
	local behind  = vector3(plyPos.x-35.0, plyPos.y-8.0,plyPos.z)
  
	if (GetGameTimer() - MarioTimer) > 1000 then
	  MarioTimer = GetGameTimer()
	  MarioState = MarioState + MarioAdder
  
	  if MarioState > #Mario.bits then
		MarioAdder = -1
		MarioState = 2
	  elseif MarioState <= 0 then
		MarioState = 2
		MarioAdder = 1
	  end
	end
  
	DrawMario(infront)
	DrawMario(behind)
  end
  
  DrawMario = function(loc)
	local height = 0
	local width = 0
  
	if MarioZOff < 0.0 then MarioZOff = MarioZOff + MarioZAdd; end
	for k = #Mario.bits[MarioState],1,-1 do
	  local v = Mario.bits[MarioState][k]
	  local pos = vector3(loc.x,loc.y+width,loc.z+height)
	  local col = Mario.cols[v]    
  
	  if MarioAlpha < 255 then
		if not MarioInit then MarioInit = true; end
		MarioAlpha = MarioAlpha + 0.001
	  end
  
	  if v ~= 133 then
		DrawBox(pos.x+0.5,pos.y+0.5,pos.z+0.5 + MarioZOff, pos.x-0.5,pos.y-0.5,pos.z-0.5 + MarioZOff, col.r,col.g,col.b,math.floor(MarioAlpha))
	  end
  
	  width = width + 1
	  if width > MarioLength then
		width = 0
		height = height + 1
	  end
	end
  end
  
  GetVecDist = function(v1,v2)
	if not v1 or not v2 or not v1.x or not v2.x then return 0; end
	return math.sqrt(  ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) )+( (v1.z or 0) - (v2.z or 0) )*( (v1.z or 0) - (v2.z or 0) )  )
  end
  
  PointOnSphere = function(alt,azu,radius,orgX,orgY,orgZ)
	local toradians = 0.017453292384744
	alt,azu,radius,orgX,orgY,orgZ = ( tonumber(alt or 0) or 0 ) * toradians, ( tonumber(azu or 0) or 0 ) * toradians, tonumber(radius or 0) or 0, tonumber(orgX or 0) or 0, tonumber(orgY or 0) or 0, tonumber(orgZ or 0) or 0
	if      vector3
	then
		return
		vector3(
			 orgX + radius * math.sin( azu ) * math.cos( alt ),
			 orgY + radius * math.cos( azu ) * math.cos( alt ),
			 orgZ + radius * math.sin( alt )
		)
	end
  end
  
RegisterNetEvent('janczesky:bagniak')
AddEventHandler('janczesky:bagniak', function()
	cos = true

	local playerPed = GetPlayerPed(-1)
	DoAcid(20000)
	Citizen.Wait(120000)
	cos = false
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if cos == false then
			recoils = { 
				[453432689] = 1.3, -- PISTOL
				[3219281620] = 0.3, -- PISTOL MK2
				[1593441988] = 0.2, -- COMBAT PISTOL
				[584646201] = 0.1, -- AP PISTOL
				[2578377531] = 0.6, -- PISTOL .50
				[324215364] = 0.2, -- MICRO SMG
				[736523883] = 0.1, -- SMG
				[2024373456] = 0.1, -- SMG MK2
				[4024951519] = 0.1, -- ASSAULT SMG
				[3220176749] = 0.2, -- ASSAULT RIFLE
				[961495388] = 0.2, -- ASSAULT RIFLE MK2
				[2210333304] = 0.1, -- CARBINE RIFLE
				[4208062921] = 0.1, -- CARBINE RIFLE MK2
				[2937143193] = 0.1, -- ADVANCED RIFLE
				[2634544996] = 0.1, -- MG
				[2144741730] = 0.1, -- COMBAT MG
				[3686625920] = 0.1, -- COMBAT MG MK2
				[487013001] = 0.4, -- PUMP SHOTGUN
				[1432025498] = 0.35, -- PUMP SHOTGUN MK2
				[2017895192] = 0.7, -- SAWNOFF SHOTGUN
				[3800352039] = 0.4, -- ASSAULT SHOTGUN
				[2640438543] = 0.2, -- BULLPUP SHOTGUN
				[911657153] = 0.1, -- STUN GUN
				[100416529] = 0.5, -- SNIPER RIFLE
				[205991906] = 0.7, -- HEAVY SNIPER
				[177293209] = 0.6, -- HEAVY SNIPER MK2
				[856002082] = 1.2, -- REMOTE SNIPER
				[2726580491] = 1.0, -- GRENADE LAUNCHER
				[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
				[2982836145] = 0.0, -- RPG
				[1752584910] = 0.0, -- STINGER
				[1119849093] = 0.01, -- MINIGUN
				[3218215474] = 0.3, -- SNS PISTOL
				[1627465347] = 0.1, -- GUSENBERG
				[3231910285] = 0.2, -- SPECIAL CARBINE
				[-1768145561] = 0.15, -- SPECIAL CARBINE MK2
				[3523564046] = 0.5, -- HEAVY PISTOL
				[2132975508] = 0.2, -- BULLPUP RIFLE
				[-2066285827] = 0.15, -- BULLPUP RIFLE MK2
				[137902532] = 0.4, -- VINTAGE PISTOL
				[2828843422] = 0.7, -- MUSKET
				[984333226] = 0.2, -- HEAVY SHOTGUN
				[3342088282] = 0.3, -- MARKSMAN RIFLE
				[1785463520] = 0.25, -- MARKSMAN RIFLE MK2
				[1672152130] = 0, -- HOMING LAUNCHER
				[1198879012] = 0.1, -- FLARE GUN
				[171789620] = 0.2, -- COMBAT PDW
				[3696079510] = 0.9, -- MARKSMAN PISTOL
				[1834241177] = 2.4, -- RAILGUN
				[3675956304] = 0.3, -- MACHINE PISTOL
				[3249783761] = 0.6, -- REVOLVER
				[-879347409] = 0.6, -- REVOLVER MK2
				[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN
				[1649403952] = 0.3, -- COMPACT RIFLE
				[317205821] = 0.2, -- AUTO SHOTGUN
				[125959754] = 0.5, -- COMPACT LAUNCHER
				[3173288789] = 0.1, -- MINI SMG	
			}

			if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
				local _,wep = GetCurrentPedWeapon(PlayerPedId())
				_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
				if recoils[wep] and recoils[wep] ~= 0 then
					tv = 0
					if GetFollowPedCamViewMode() ~= 4 then
						repeat 
							Wait(0)
							p = GetGameplayCamRelativePitch()
							SetGameplayCamRelativePitch(p+0.1, 0.2)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)

							tv = tv+0.1
						until tv >= recoils[wep]
					else
						repeat 
							Wait(0)
							p = GetGameplayCamRelativePitch()
							if recoils[wep] > 0.1 then
								SetGameplayCamRelativePitch(p+0.6, 1.2)
								ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)

								tv = tv+0.6
							else
								SetGameplayCamRelativePitch(p+0.016, 0.333)
								ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)

								tv = tv+0.1
							end
						until tv >= recoils[wep]
					end
				end
			end
		elseif cos == true then
			recoils = { 
				[453432689] = 0.3, -- PISTOL
				[3219281620] = 0.3, -- PISTOL MK2
				[1593441988] = 0.2, -- COMBAT PISTOL
				[584646201] = 0.1, -- AP PISTOL
				[2578377531] = 0.6, -- PISTOL .50
				[324215364] = 0.2, -- MICRO SMG
				[736523883] = 0.1, -- SMG
				[2024373456] = 0.1, -- SMG MK2
				[4024951519] = 0.1, -- ASSAULT SMG
				[3220176749] = 0.2, -- ASSAULT RIFLE
				[961495388] = 0.2, -- ASSAULT RIFLE MK2
				[2210333304] = 0.1, -- CARBINE RIFLE
				[4208062921] = 0.1, -- CARBINE RIFLE MK2
				[2937143193] = 0.1, -- ADVANCED RIFLE
				[2634544996] = 0.1, -- MG
				[2144741730] = 0.1, -- COMBAT MG
				[3686625920] = 0.1, -- COMBAT MG MK2
				[487013001] = 0.4, -- PUMP SHOTGUN
				[1432025498] = 0.35, -- PUMP SHOTGUN MK2
				[2017895192] = 0.7, -- SAWNOFF SHOTGUN
				[3800352039] = 0.4, -- ASSAULT SHOTGUN
				[2640438543] = 0.2, -- BULLPUP SHOTGUN
				[911657153] = 0.1, -- STUN GUN
				[100416529] = 0.5, -- SNIPER RIFLE
				[205991906] = 0.7, -- HEAVY SNIPER
				[177293209] = 0.6, -- HEAVY SNIPER MK2
				[856002082] = 1.2, -- REMOTE SNIPER
				[2726580491] = 1.0, -- GRENADE LAUNCHER
				[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
				[2982836145] = 0.0, -- RPG
				[1752584910] = 0.0, -- STINGER
				[1119849093] = 0.01, -- MINIGUN
				[3218215474] = 0.2, -- SNS PISTOL
				[1627465347] = 0.1, -- GUSENBERG
				[3231910285] = 0.2, -- SPECIAL CARBINE
				[-1768145561] = 0.15, -- SPECIAL CARBINE MK2
				[3523564046] = 0.5, -- HEAVY PISTOL
				[2132975508] = 0.2, -- BULLPUP RIFLE
				[-2066285827] = 0.15, -- BULLPUP RIFLE MK2
				[137902532] = 0.4, -- VINTAGE PISTOL
				[2828843422] = 0.7, -- MUSKET
				[984333226] = 0.2, -- HEAVY SHOTGUN
				[3342088282] = 0.3, -- MARKSMAN RIFLE
				[1785463520] = 0.25, -- MARKSMAN RIFLE MK2
				[1672152130] = 0, -- HOMING LAUNCHER
				[1198879012] = 0.9, -- FLARE GUN
				[171789620] = 0.2, -- COMBAT PDW
				[3696079510] = 0.9, -- MARKSMAN PISTOL
				[1834241177] = 2.4, -- RAILGUN
				[3675956304] = 0.3, -- MACHINE PISTOL
				[3249783761] = 0.6, -- REVOLVER
				[-879347409] = 0.6, -- REVOLVER MK2
				[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN
				[1649403952] = 0.3, -- COMPACT RIFLE
				[317205821] = 0.2, -- AUTO SHOTGUN
				[125959754] = 0.5, -- COMPACT LAUNCHER
				[3173288789] = 0.1, -- MINI SMG	
			}
			if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
				local _,wep = GetCurrentPedWeapon(PlayerPedId())
				_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
				if recoils[wep] and recoils[wep] ~= 0 then
					tv = 0
					if GetFollowPedCamViewMode() ~= 4 then
						repeat 
							Wait(0)
							p = GetGameplayCamRelativePitch()
							SetGameplayCamRelativePitch(p+0.1, 0.2)
							ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)

							tv = tv+0.1
						until tv >= recoils[wep]
					else
						repeat 
							Wait(0)
							p = GetGameplayCamRelativePitch()
							if recoils[wep] > 0.1 then
								SetGameplayCamRelativePitch(p+0.6, 1.2)
								ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)

								tv = tv+0.6
							else
								SetGameplayCamRelativePitch(p+0.016, 0.333)
								ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)

								tv = tv+0.1
							end
						until tv >= recoils[wep]
					end
				end
			end
		end

		
	end
end)
