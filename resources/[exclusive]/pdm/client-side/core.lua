-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("pdm")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Mount = nil
local Camera = nil
local LastModel = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAMERAACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function CameraActive()
	if DoesCamExist(Camera) then
		ClearFocus()
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end
	Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	PointCamAtCoord(cam, 979.1, -3003.00, -40.50)
    SetCamCoord(Camera, 974.1, -2997.94, -39.00)
    SetCamRot(Camera, -15.0, 0.0, 237.44)
    SetFocusPosAndVel(974.1, -2997.94, -39.72, 0.0, 0.0, 0.0)
    RenderScriptCams(true, false, 0, 1, 0)
	SetCamActive(Camera,true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PDM:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("pdm:Open")
AddEventHandler("pdm:Open",function()	
	--TriggerServerEvent("vRP:BucketClient","Enter")
	if DoesEntityExist(Mount) then
		DeleteEntity(Mount)
	end
	local Ped = PlayerPedId()
	if not LocalPlayer["state"]["Buttons"] and not LocalPlayer["state"]["Commands"] and GetEntityHealth(Ped) > 100 then
		CameraActive()
		SetNuiFocus(true,true)
		SetCursorLocation(0.5,0.5)
		TriggerEvent("dynamic:closeSystem")
		SendNUIMessage({ name = "Open", payload = VehicleGlobal() })
	end
	TriggerEvent("hud:Active",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	local Ped = PlayerPedId()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	--TriggerServerEvent("vRP:BucketClient","Exit")
	
	if DoesEntityExist(Mount) then
		DeleteEntity(Mount)
	end

	if DoesCamExist(Camera) then
		ClearFocus()
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end
	TriggerEvent("hud:Active",true)	
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Mount",function(Data,Callback)
	if LoadModel(Data) and LastModel ~= Data then
		if DoesEntityExist(Mount) then
			DeleteEntity(Mount)
		end
		local _,GroundZ = GetGroundZFor_3dCoord(978.19, -3001.99, -40.62)
		Mount = CreateVehicle(Data,978.19, -3001.99, GroundZ, 89.5,false,false)
		SetVehicleModKit(Mount,0)
		ToggleVehicleMod(Mount,18,true)
		SetVehicleExtraColours(Mount,147,147)
		SetVehicleMod(Mount,11,GetNumVehicleMods(Mount,11) - 1,false)
		SetVehicleMod(Mount,12,GetNumVehicleMods(Mount,12) - 1,false)
		SetVehicleMod(Mount,13,GetNumVehicleMods(Mount,13) - 1,false)
		SetVehicleMod(Mount,15,GetNumVehicleMods(Mount,15) - 1,false)
		SetVehicleNumberPlateText(Mount,"PDMSPORT")
		SetEntityInvincible(Mount,true)
		SetModelAsNoLongerNeeded(Data)
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Buy",function(Data,Callback)
	vSERVER.Buy(Data)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Rotate",function(Data,Callback)
	if DoesEntityExist(Mount) then
		if Data == "Left" then
			SetEntityHeading(Mount,GetEntityHeading(Mount) - 5)
		else
			SetEntityHeading(Mount,GetEntityHeading(Mount) + 5)
		end
	end
	
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Drive",function(Data,Callback)
	if vSERVER.CheckDrive(Data) == true then

		SetNuiFocus(false,false)
		SetCursorLocation(0.5,0.5)
		
		if LoadModel(Data) then
			if DoesEntityExist(Mount) then
				DeleteEntity(Mount)
			end
			Mount = CreateVehicle(Data,105.09,-136.39,54.74,155.91,false,false)
			
			SetVehicleModKit(Mount,0)
			ToggleVehicleMod(Mount,18,true)
			SetVehicleExtraColours(Mount,147,147)
			SetVehicleMod(Mount,11,GetNumVehicleMods(Mount,11) - 1,false)
			SetVehicleMod(Mount,12,GetNumVehicleMods(Mount,12) - 1,false)
			SetVehicleMod(Mount,13,GetNumVehicleMods(Mount,13) - 1,false)
			SetVehicleMod(Mount,15,GetNumVehicleMods(Mount,15) - 1,false)
			
			SetVehicleNumberPlateText(Mount,"PDMSPORT")
			SetPedIntoVehicle(PlayerPedId(),Mount,-1)
			SetEntityInvincible(Mount,true)
			SetModelAsNoLongerNeeded(Data)
			
			LocalPlayer["state"]:set("Commands",true,true)
			LocalPlayer["state"]:set("TestDrive",true,false)
			
			while true do
				local Ped = PlayerPedId()
				if not IsPedInAnyVehicle(Ped) then
					SetEntityCoords(Ped,118.63,-141.99,54.8)
					LocalPlayer["state"]:set("Commands",false,true)
					LocalPlayer["state"]:set("TestDrive",false,false)
					if DoesEntityExist(Mount) then
						DeleteEntity(Mount)
					end
					vSERVER.RemoveDrive()
					break
				end
				Wait(1)
			end
			
		end
	end
	
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local localVeh = {}
local List = {
	{ Coords = {143.12,-164.65,54.21,206.93}, Vehicle = 'italirsx' },
	{ Coords = {137.2,-162.11,54.21,206.93}, Vehicle = 'komoda' },
	{ Coords = {131.69,-160.18,54.22,206.93}, Vehicle = 't20' },
	{ Coords = {126.1,-158.21,54.21,206.93}, Vehicle = 'virtue' },
	{ Coords = {120.6,-156.43,54.17,206.93}, Vehicle = 'flashgt' },
	{ Coords = {137.23,-149.94,54.22,104.89}, Vehicle = 'thrax' },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADLIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		for Number = 1,#List do
			local _,GroundZ = GetGroundZFor_3dCoord(List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3])
			local Distance = #(Coords - vec3(List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3]))
			if Distance <= 30 then
				if not localVeh[Number] and LocalPlayer["state"]["Route"] < 900000 then
					if LoadModel(List[Number]["Vehicle"]) then
						localVeh[Number] = CreateVehicle(List[Number]["Vehicle"],List[Number]["Coords"][1],List[Number]["Coords"][2],GroundZ,List[Number]["Coords"][4],false,false)
						if DoesEntityExist(localVeh[Number]) then
							FreezeEntityPosition(localVeh[Number],true)
							SetVehicleDoorsLocked(localVeh[Number],2)
							SetVehicleNumberPlateText(localVeh[Number],"PDMSPORT")
						end
					end
				end
			else
				if localVeh[Number] then
					if DoesEntityExist(localVeh[Number]) then
						DeleteEntity(localVeh[Number])
					end
					localVeh[Number] = nil
				end
			end
		end
		Wait(1000)
	end
end)



Citizen.CreateThread(function()
	LoadMpDlcMaps()
	EnableMpDlcMaps(true)
	RequestIpl("coronertrash")
	RequestIpl("Coroner_Int_On")
	RequestIpl("chop_props")
	RemoveIpl("hei_bi_hw1_13_door")
	RequestIpl("v_rockclub")
	
	RemoveIpl("rc12b_default")
	RemoveIpl("rc12b_hospitalinterior")
	RemoveIpl("rc12b_destroyed")

	RemoveIpl("v_carshowroom")
	RemoveIpl("shutter_open")
	RemoveIpl("shutter_closed")
	RemoveIpl("shr_int")
	RemoveIpl("csr_inMission")
	RequestIpl("v_carshowroom")
	RequestIpl("shr_int")
	RequestIpl("shutter_closed")
	RequestIpl("FINBANK")
	RemoveIpl("facelobbyfake")
	RequestIpl("facelobby")
	RemoveIpl("CS1_02_cf_offmission")
	RequestIpl("CS1_02_cf_onmission1")
	RequestIpl("CS1_02_cf_onmission2")
	RequestIpl("CS1_02_cf_onmission3")
	RequestIpl("CS1_02_cf_onmission4")
	-- RequestIpl("des_farmhouse")
	-- RequestIpl("des_farmhs_endimap")
	-- RequestIpl("des_farmhs_end_occl")
	-- RequestIpl("des_farmhs_startimap")
	-- RequestIpl("des_farmhs_start_occl")
	RequestIpl("farm")
	RequestIpl("farmint")
	RequestIpl("farm_props")
	RequestIpl("farmint_cap")
	RemoveIpl("farm_burnt")
	RemoveIpl("farm_burnt_props")
	RequestIpl("FIBlobby")
	RemoveIpl("FIBlobbyfake")
	RequestIpl("FBI_colPLUG")
	RequestIpl("FBI_repair")
	RemoveIpl("id2_14_during_door")
	RemoveIpl("id2_14_during2")
	RemoveIpl("id2_14_on_fire")
	RemoveIpl("id2_14_post_no_int")
	RemoveIpl("id2_14_pre_no_int")
	RequestIpl("id2_14_during1")
	RequestIpl("TrevorsMP")
	RequestIpl("TrevorsTrailer")
	RequestIpl("TrevorsTrailerTidy")
	RequestIpl("TrevorsTrailerTrash")
	RemoveIpl("DT1_03_Gr_Closed")
	RemoveIpl("DT1_03_Shutter")
	RequestIpl("yogagame")
	RequestIpl("v_tunnel_hole")
	RequestIpl("V_Michael")
	RequestIpl("V_Michael_Garage")
	RequestIpl("V_Michael_FameShame")
	RequestIpl("V_Michael_JewelHeist")
	RequestIpl("V_Michael_plane_ticket")
	RequestIpl("V_Michael_Scuba")
	RemoveIpl("smboat")
	RequestIpl("hei_yacht_heist")
	RequestIpl("hei_yacht_heist_Bar")
	RequestIpl("hei_yacht_heist_Bedrm")
	RequestIpl("hei_yacht_heist_Bridge")
	RequestIpl("hei_yacht_heist_DistantLights")
	RequestIpl("hei_yacht_heist_enginrm")
	RequestIpl("hei_yacht_heist_LODLights")
	RequestIpl("hei_yacht_heist_Lounge")
	RequestIpl("cargoship")
	RemoveIpl("sp1_10_fake_interior")
	RemoveIpl("sp1_10_fake_interior_lod")
	RequestIpl("railing_start")
	RequestIpl("railing_end")
	RequestIpl("SC1_01_NewBill")
	RequestIpl("hw1_02_newbill")
	RequestIpl("hw1_emissive_newbill")
	RequestIpl("sc1_14_newbill")
	RequestIpl("dt1_17_newbill")
	RequestIpl("SC1_01_OldBill")
	RequestIpl("SC1_30_Keep_Closed")
	RequestIpl("refit_unload")
	RequestIpl("post_hiest_unload")
	RequestIpl("occl_meth_grp1")
	RequestIpl("Michael_premier")
	RemoveIpl("DT1_05_HC_REMOVE")
	RequestIpl("DT1_05_HC_REQ")
	RequestIpl("DT1_05_REQUEST")
	RemoveIpl("jewel2fake")
	RemoveIpl("bh1_16_refurb")
	RemoveIpl("ch1_02_closed")
	RemoveIpl("scafstartimap")
	RequestIpl("scafendimap")
	RemoveIpl("bh1_16_doors_shut")
	RequestIpl("ferris_finale_Anim")
	RequestIpl("des_stilthouse_rebuild")
	RequestIpl("CS2_06_TriAf02")
	--RequestIpl("cs3_07_mpgates")
	RequestIpl("CS4_08_TriAf02")
	RequestIpl("CS4_04_TriAf03")
	RequestIpl("AP1_04_TriAf01")
	RequestIpl("gr_case0_bunkerclosed")
	RequestIpl("gr_case1_bunkerclosed")
	RequestIpl("gr_case2_bunkerclosed")
	RequestIpl("gr_case3_bunkerclosed")
	RequestIpl("gr_case4_bunkerclosed")
	RequestIpl("gr_case5_bunkerclosed")
	RequestIpl("gr_case6_bunkerclosed")
	RequestIpl("gr_case7_bunkerclosed")
	RequestIpl("gr_case9_bunkerclosed")
	RequestIpl("gr_case10_bunkerclosed")
	RequestIpl("gr_case11_bunkerclosed")
	RequestIpl("cs5_4_trains")
	RequestIpl("chophillskennel")
	RequestIpl("bnkheist_apt_dest")
	RequestIpl("bnkheist_apt_norm")
	RemoveIpl("redcarpet")
	RequestIpl("hei_sm_16_interior_v_bahama_milo_")
	RequestIpl("cs3_05_water_grp1")
	RequestIpl("cs3_05_water_grp1_lod")
	RequestIpl("cs3_05_water_grp2")
	RequestIpl("cs3_05_water_grp2_lod")
	RequestIpl("canyonriver01")
	RequestIpl("canyonriver01_lod")
	RequestIpl("bh1_47_joshhse_unburnt")
	RequestIpl("bh1_47_joshhse_unburnt_lod")
	RequestIpl("bkr_bi_hw1_13_int")
	RequestIpl("CanyonRvrShallow")
	RequestIpl("methtrailer_grp1")
	RequestIpl("lr_cs6_08_grave_closed")
	RequestIpl("bkr_bi_id1_23_door")
	RequestIpl("ch1_02_open")
	RequestIpl("sp1_10_real_interior")
	RequestIpl("sp1_10_real_interior_lod")
	RequestIpl("Carwash_with_spinners")
	RequestIpl("apa_v_mp_h_01_a")
	RequestIpl("apa_v_mp_h_06_b")
	RequestIpl("apa_v_mp_h_08_c")
	RequestIpl("ex_dt1_02_office_01c")
	RequestIpl("ex_dt1_11_office_01b")
	RequestIpl("ex_sm_13_office_01a")
	RequestIpl("ex_sm_15_office_02b")
	RequestIpl("bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
	RequestIpl("bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware03_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware04_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware05_milo")
	RequestIpl("bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo")
	RequestIpl("bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo")
	RequestIpl("bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo")
	RequestIpl("imp_impexp_interior_placement")
	RequestIpl("imp_impexp_interior_placement_interior_0_impexp_int_01_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_2_imptexp_mod_int_01_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_3_impexp_int_02_milo_")
	RequestIpl("gr_case0_bunkerclosed")
	RequestIpl("gr_case1_bunkerclosed")
	RequestIpl("gr_case2_bunkerclosed")
	RequestIpl("gr_case3_bunkerclosed")
	RequestIpl("gr_case4_bunkerclosed")
	RequestIpl("gr_case5_bunkerclosed")
	RequestIpl("gr_case6_bunkerclosed")
	RequestIpl("gr_case7_bunkerclosed")
	RequestIpl("gr_case9_bunkerclosed")
	RequestIpl("gr_case10_bunkerclosed")
	RequestIpl("gr_case11_bunkerclosed")
	RequestIpl("gr_entrance_placement")
	RequestIpl("gr_grdlc_interior_placement")
	RequestIpl("gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_")
	RequestIpl("gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_")
	RequestIpl("ch3_rd2_bishopschickengraffiti")
	RequestIpl("cs5_04_mazebillboardgraffiti")
	RequestIpl("cs5_roads_ronoilgraffiti")
	RequestIpl("ba_barriers_case0")
	RequestIpl("ba_case0_forsale")
	RequestIpl("ba_case0_dixon")
	RequestIpl("ba_case0_madonna")
	RequestIpl("ba_case0_solomun")
	RequestIpl("ba_case0_taleofus")
	RequestIpl("ba_barriers_case1")
	RequestIpl("ba_case1_forsale")
	RequestIpl("ba_case1_dixon")
	RequestIpl("ba_case1_madonna")
	RequestIpl("ba_case1_solomun")
	RequestIpl("ba_case1_taleofus")
	RequestIpl("ba_barriers_case2")
	RequestIpl("ba_case2_forsale")
	RequestIpl("ba_case2_dixon")
	RequestIpl("ba_case2_madonna")
	RequestIpl("ba_case2_solomun")
	RequestIpl("ba_case2_taleofus")
	RequestIpl("ba_barriers_case3")
	RequestIpl("ba_case3_forsale")
	RequestIpl("ba_case3_dixon")
	RequestIpl("ba_case3_madonna")
	RequestIpl("ba_case3_solomun")
	RequestIpl("ba_case3_taleofus")
	RequestIpl("ba_barriers_case4")
	RequestIpl("ba_case4_forsale")
	RequestIpl("ba_case4_dixon")
	RequestIpl("ba_case4_madonna")
	RequestIpl("ba_case4_solomun")
	RequestIpl("ba_case4_taleofus")
	RequestIpl("ba_barriers_case5")
	RequestIpl("ba_case5_forsale")
	RequestIpl("ba_case5_dixon")
	RequestIpl("ba_case5_madonna")
	RequestIpl("ba_case5_solomun")
	RequestIpl("ba_case5_taleofus")
	RequestIpl("ba_barriers_case6")
	RequestIpl("ba_case6_forsale")
	RequestIpl("ba_case6_dixon")
	RequestIpl("ba_case6_madonna")
	RequestIpl("ba_case6_solomun")
	RequestIpl("ba_case6_taleofus")
	RequestIpl("ba_barriers_case7")
	RequestIpl("ba_case7_forsale")
	RequestIpl("ba_case7_dixon")
	RequestIpl("ba_case7_madonna")
	RequestIpl("ba_case7_solomun")
	RequestIpl("ba_case7_taleofus")
	RequestIpl("ba_barriers_case8")
	RequestIpl("ba_case8_forsale")
	RequestIpl("ba_case8_dixon")
	RequestIpl("ba_case8_madonna")
	RequestIpl("ba_case8_solomun")
	RequestIpl("ba_case8_taleofus")
	RequestIpl("ba_barriers_case9")
	RequestIpl("ba_case9_forsale")
	RequestIpl("ba_case9_dixon")
	RequestIpl("ba_case9_madonna")
	RequestIpl("ba_case9_solomun")
	RequestIpl("ba_case9_taleofus")
	RequestIpl("gr_grdlc_yacht_lod")
	RequestIpl("gr_grdlc_yacht_placement")
	RequestIpl("gr_heist_yacht2")
	RequestIpl("gr_heist_yacht2_bar")
	RequestIpl("gr_heist_yacht2_bar_lod")
	RequestIpl("gr_heist_yacht2_bedrm")
	RequestIpl("gr_heist_yacht2_bedrm_lod")
	RequestIpl("gr_heist_yacht2_bridge")
	RequestIpl("gr_heist_yacht2_bridge_lod")
	RequestIpl("gr_heist_yacht2_enginrm")
	RequestIpl("gr_heist_yacht2_enginrm_lod")
	RequestIpl("gr_heist_yacht2_lod")
	RequestIpl("gr_heist_yacht2_lounge")
	RequestIpl("gr_heist_yacht2_lounge_lod")
	RequestIpl("gr_heist_yacht2_slod")
end)

Citizen.CreateThread(function()
	LoadInterior(GetInteriorAtCoords(440.84,-983.14,30.69))
	for _,ipl in pairs(allIpls) do
		loadInt(ipl.coords,ipl.interiorsProps)
	end
end)

function loadInt(coordsTable,table)
	for _,coords in pairs(coordsTable) do
		local interiorID = GetInteriorAtCoords(coords[1],coords[2],coords[3])
		LoadInterior(interiorID)
		for _,propName in pairs(table) do
			Citizen.Wait(10)
			EnableInteriorProp(interiorID,propName)
		end
		RefreshInterior(interiorID)
	end
end

allIpls = {
	{
		interiorsProps = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		coords = {{ -1150.7,-1520.7,10.6 }}
	},
	{
		interiorsProps = {
			"csr_beforeMission",
			"csr_inMission"
		},
		coords = {{ -47.1,-1115.3,26.5 }}
	},
	{
		interiorsProps = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		coords = {{ -802.3,175.0,72.8 }}
	},
	{
		interiorsProps = {
			"meth_lab_basic",
			"meth_lab_production",
			"meth_lab_setup"
		},
		coords = {{ 1009.5,-3196.6,-38.9 }} -- Metanfetamina
	},
	{
		interiorsProps = {
			"security_high",
			"equipment_basic",
			"equipment_upgrade",
			"production_upgrade",
			"table_equipment_upgrade",
			"coke_press_upgrade",
			"security_low",
			"set_up"
		},
		coords = {{ 1093.6,-3196.6,-38.9 }} -- Cocaina
	},
	{
		interiorsProps = {
			"counterfeit_cashpile100a",
			"counterfeit_cashpile100b",
			"counterfeit_cashpile100c",
			"counterfeit_cashpile100d",
			"counterfeit_security",
			"counterfeit_setup",
			"counterfeit_standard_equip",
			"money_cutter",
			"special_chairs",
			"dryera_on",
			"dryerb_on",
			"dryerc_on",
			"dryerd_on"
		},
		coords = {{ 1121.0,-3196.0,-40.4 }} -- Lavagem
	},
	{
		interiorsProps = {
			"coke_stash1",
			"coke_stash2",
			"coke_stash3",
			"decorative_02",
			"furnishings_02",
			"walls_01",
			"mural_02",
			"gun_locker",
			"mod_booth"
		},
		coords = {{ 1107.0,-3157.3,-37.5 }} -- Motoclub
	},
	{
		interiorsProps = {
			"coke_large",
			"decorative_01",
			"furnishings_01",
			"walls_01",
			"lower_walls_default",
			"gun_locker",
			"mod_booth"
		},
		coords = {{ 998.4,-3164.7,-38.9 }} -- Motoclub2
	},
	{
		interiorsProps = {
			"chair01",
			"equipment_basic",
			"interior_upgrade",
			"security_low",
			"set_up"
		},
		coords = {{ 1163.8,-3195.7,-39.0 }} -- Escritório
	},
	{
		interiorsProps = {
			"garage_decor_01",
			"garage_decor_02",
			"garage_decor_03",
			"garage_decor_04",
			"lighting_option01",
			"lighting_option02",
			"lighting_option03",
			"lighting_option04",
			"lighting_option05",
			"lighting_option06",
			"lighting_option07",
			"lighting_option08",
			"lighting_option09",
			"numbering_style01_n3",
			"numbering_style02_n3",
			"numbering_style03_n3",
			"numbering_style04_n3",
			"numbering_style05_n3",
			"numbering_style06_n3",
			"numbering_style07_n3",
			"numbering_style08_n3",
			"numbering_style09_n3",
			"urban_style_set",
			"car_floor_hatch",
			"door_blocker"
		},
		coords = {{ 994.59,-3002.59,-39.64 }} -- Mecanica
	},
	{
		interiorsProps = {
			"bunker_style_a",
			"upgrade_bunker_set",
			"security_upgrade",
			"office_upgrade_set",
			"gun_wall_blocker",
			"gun_range_lights",
			"gun_locker_upgrade",
			"Gun_schematic_set"
		},
		coords = {{ 899.55,-3246.03,-98.04 }} -- Bunker
	},
	{
		interiorsProps = {
			"Int01_ba_clubname_01",
	        "Int01_ba_Style03",
	        "Int01_ba_style03_podium",
	        "Int01_ba_equipment_setup",
	        "Int01_ba_equipment_upgrade",
	        "Int01_ba_security_upgrade",
	        "Int01_ba_dj04",
	        "DJ_01_Lights_01",
	        "DJ_02_Lights_01",
	        "DJ_03_Lights_01",
	        "DJ_04_Lights_01",
	        "Int01_ba_bar_content",
	        "Int01_ba_booze_03",
	        "Int01_ba_trophy01",
	        "Int01_ba_Clutter",
	        "Int01_ba_deliverytruck",
	        "Int01_ba_dry_ice",
	        "light_rigs_off",
	        "Int01_ba_lightgrid_01",
	        "Int01_ba_trad_lights",
	        "Int01_ba_trophy04",
	        "Int01_ba_trophy05",
	        "Int01_ba_trophy07",
	        "Int01_ba_trophy08",
	        "Int01_ba_trophy09",
	        "Int01_ba_trophy10",
	        "Int01_ba_trophy11",
	        "Int01_ba_booze_01",
			"Int01_ba_booze_02",
			"Int01_ba_booze_03",
			"int01_ba_lights_screen",
			"Int01_ba_bar_content"
        },
		coords = {{ -1604.664, -3012.583, -78.00 }} -- Galaxy
	}
}