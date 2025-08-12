-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
Use = {

	["megaphone"] = function(source, Passport, Amount, Slot, Full, Item, Split)
		TriggerClientEvent("player:Megaphone", source)
		TriggerClientEvent("pma-voice:Megaphone", source, true)
		TriggerEvent("pma-voice:Megaserver", source, true)
		TriggerClientEvent("emotes", source, "megaphone")
	end,

	["notepad"] = function(source,Passport,Amount,Slot,Full,Item,Split)
        if vRP.TakeItem(Passport,Full,1,false,Slot) then
            TriggerClientEvent("inventory:Close", source)
            TriggerClientEvent("notepad:createNotepad",source)
        end
    end,
	
	["pager"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed and Player(ClosestPed)["state"]["Handcuff"] then
			local OtherPassport = vRP.Passport(ClosestPed)
			if OtherPassport then

				local Groups = vRP.Groups()
				for key,Value in pairs(Groups) do
					if Value["Type"] == "Policia" then
						if vRP.HasService(OtherPassport,key) then
							TriggerEvent("Wanted",source,Passport,600)
							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								vRP.ServiceLeave(ClosestPed,OtherPassport,key,true)
								TriggerClientEvent("Notify",source,"verde","Todas as comunicações foram retiradas.",5000,"Sucesso")
							end
						end
					end
				end

				if vRP.HasService(OtherPassport,"Hospital") then
					TriggerEvent("Wanted",source,Passport,600)
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.ServiceLeave(ClosestPed,OtherPassport,"Hospital",true)
						TriggerClientEvent("Notify",source,"verde","Todas as comunicações foram retiradas.",5000,"Sucesso")
					end
				end
			end
		end
	end,

	["bsdrink"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["softdrink"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,
	["bsmoneyshot"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bsbleederburger"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bsheartstopper"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,
	["bsfries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,
	["bsnuggets"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,
	["bsrings"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,
	["bscoffee"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,
	["geode"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"WEAPON_HAMMER",1) then
			local Geodes = {
				{ ["item"] = "emerald", ["min"] = 1, ["max"] = 1 },
				{ ["item"] = "diamond", ["min"] = 2, ["max"] = 2 },
				{ ["item"] = "ruby", ["min"] = 1, ["max"] = 2 },
				--[[ { ["item"] = "sapphire", ["min"] = 1, ["max"] = 3 },
				{ ["item"] = "amethyst", ["min"] = 1, ["max"] = 3 },
				{ ["item"] = "amber", ["min"] = 1, ["max"] = 3 },
				{ ["item"] = "turquoise", ["min"] = 1, ["max"] = 3 },
				{ ["item"] = "aluminum", ["min"] = 1, ["max"] = 2 },
				{ ["item"] = "copper", ["min"] = 1, ["max"] = 2 } ]]
			}
			local Selected = math.random(#Geodes)
			local Rand = math.random(Geodes[Selected]["min"],Geodes[Selected]["max"])
			if (vRP.InventoryWeight(Passport) + (itemWeight(Geodes[Selected]["item"]) * Rand)) <= vRP.GetWeight(Passport) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,Geodes[Selected]["item"],Rand,false)
					TriggerClientEvent("inventory:Update",source,"Backpack")
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","<b>Martelo</b> não encontrado.",5000)
		end
	end,

	["adrenaline"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Service,Total = vRP.NumPermission("Hospital")
		if Total <= 0 then
			local ClosestPed = vRPC.ClosestPed(source,3)
			if ClosestPed then
				local OtherPassport = vRP.Passport(ClosestPed)
				if OtherPassport and vRP.GetHealth(ClosestPed) <= 100 then
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						Player(source)["state"]["Cancel"] = true
						TriggerClientEvent("Progress",source,10000)
						vRPC.playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
						SetTimeout(10000,function()
							vRP.Revive(ClosestPed,101)
							vRPC.removeObjects(source)
							vRP.UpgradeThirst(OtherPassport,10)
							vRP.UpgradeHunger(OtherPassport,10)
							Player(source)["state"]["Cancel"] = false
						end)
					end
				end
			end
		end
    end,

	["jackham"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local mineCoords = { 2952.91,2791.51,41.03 }
		local Coordinates = {}
		local minutes = os.date("*t",  os.time()).min

		for i = 1,2 do
			local angle = (2 * math.pi * i / 2) + (minutes / 60 * math.pi / 5)
			local x = mineCoords[1] + 7 * math.cos(angle)+3
			local y = mineCoords[2] + 7 * math.sin(angle)+3
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "sapphireore" or "ironore", amount = (i%2~=0) and 4 or 8})
		end

		for i = 1,4  do
			local angle = (2 * math.pi * i / 4) + (minutes / 60 * math.pi / 4 )
			local x = mineCoords[1] + 14 * math.cos(angle)+3
			local y = mineCoords[2] + 14 * math.sin(angle)+3
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "rubyore" or "diamondore", amount = (minutes%2~=0) and 8 or 10})
		end

		for i = 1,8 do
			local angle = (2 * math.pi * i / 8) + (minutes / 60 * math.pi / 3)
			local x = mineCoords[1] + 21 * math.cos(angle)+3
			local y = mineCoords[2] + 21 * math.sin(angle)+3
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "goldore" or "copperore", amount = (i%2~=0) and 3 or 5})
		end
		
		for i = 1, 12 do
			local angle = (2 * math.pi * i / 12) + (minutes / 60 * math.pi / 2)
			local x = mineCoords[1] + 28 * math.cos(angle)+1
			local y = mineCoords[2] + 28 * math.sin(angle)+1
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "leadore" or "emeraldore", amount = (minutes%2~=0) and 5 or 7})
		end

		if #(Coords - vec3(mineCoords[1],mineCoords[2],mineCoords[3])) <= 30 then
			if vRP.ConsultItem(Passport,"drillbit",1) then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				Player(source)["state"]["Cancel"] = true
				TriggerClientEvent("inventory:Close", source)
				TriggerClientEvent("Progress", source,4000)
				vRPC.createObjects(source,"amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil

						if math.random(100) <= 30 then
							vRP.RemoveItem(Passport, "drillbit",1,true)
						end

						for _,Value in ipairs(Coordinates) do
							if #(Coords - vec3(Value.x, Value.y, Coords.z)) <= 3 then
								
								local Amount = math.random(Value.amount)
								local Experience = vRP.GetExperience(Passport,"Minerman")
								local Level = ClassCategory(Experience)
								if Level == 2 or Level == 3 or Level == 5 then
									Amount = Amount + 1
								elseif Level == 6 or Level == 7 or Level == 8 then
									Amount = Amount + 2
								elseif Level == 9 or Level == 10 then
									Amount = Amount + 3
								end
								vRP.PutExperience(Passport,"Minerman",1)
								
								if (vRP.InventoryWeight(Passport) + itemWeight(Value.item) * Amount) <= vRP.GetWeight(Passport) then
									vRP.GenerateItem(Passport,Value.item,Amount,true)
								end
							end
						end
						local Item = "stone"
						local Amount = math.random(2)
						for _,Value in pairs({
							vec3(2952.07,2819.73,42.58),
							vec3(2923.9,2809.09,43.35), 
							vec3(2921.64,2793.9,40.61), 
							vec3(2934.44,2779.35,39.07),
							vec3(2949.26,2770.88,39.02),
							vec3(2959.64,2775.72,39.92),
							vec3(2972.0,2779.34,38.64), 
							vec3(2976.44,2787.3,39.9), 	
							vec3(2968.12,2796.86,40.94),
							vec3(2952.52,2847.42,47.11),
							vec3(2967.8,2840.11,45.41), 
							vec3(2979.78,2821.56,44.74),
							vec3(2991.88,2802.39,43.93),
							vec3(3003.04,2780.11,43.41),
							vec3(3001.14,2763.14,42.97),
							vec3(2992.83,2756.31,42.82),
							vec3(2968.98,2738.39,43.74),
							vec3(2939.29,2751.12,43.39),
							vec3(2967.54,2758.4,43.08), 
							vec3(2989.76,2770.21,42.87),
							vec3(2937.02,2799.51,41.01),
							vec3(2954.26,2802.48,41.74),
							vec3(2964.23,2786.72,39.75),
							vec3(2947.96,2783.56,39.93),
						}) do
							if #(Coords - vec3(Value.x, Value.y, Value.z)) <= 3 then
								Amount = math.random(16)
							end
						end
						if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
							vRP.GenerateItem(Passport,Item,Amount,true)
						end
						vRP.UpgradeStress(Passport,1)
						vRPC.removeObjects(source)
						Player(source)["state"]["Buttons"] = false
						Player(source)["state"]["Cancel"] = false
					end
					Wait(1000)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("drillbit").."</b>.",5000)
			end
		elseif #(Coords - vec3(-520.73,1988.47,122.79)) <= 120 and Coords["z"] <= 140 then
			if vRP.ConsultItem(Passport,"drillbit",1) then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				Player(source)["state"]["Cancel"] = true
				TriggerClientEvent("inventory:Close", source)
				TriggerClientEvent("Progress", source,4000)
				vRPC.createObjects(source,"amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						local Item = "coal"
						local Amount = math.random(3)
						local Experience = vRP.GetExperience(Passport,"Minerman")
						local Level = ClassCategory(Experience)
						if Level == 2 or Level == 3 or Level == 5 then
							Amount = Amount + 1
						elseif Level == 6 or Level == 7 or Level == 8 then
							Amount = Amount + 2
						elseif Level == 9 or Level == 10 then
							Amount = Amount + 3
						end
						vRP.PutExperience(Passport,"Minerman",1)

						if math.random(100) <= 30 then
							vRP.RemoveItem(Passport, "drillbit",1,true)
						end

						if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
							vRP.GenerateItem(Passport,Item,Amount,true)
						end

						if math.random(100) <= 30 then
							if (vRP.InventoryWeight(Passport) + itemWeight("geode") * 1) <= vRP.GetWeight(Passport) then
								vRP.GenerateItem(Passport,"geode",1,true)
							end
						end
						
						vRP.UpgradeStress(Passport,1)
						vRPC.removeObjects(source)
						Player(source)["state"]["Buttons"] = false
						Player(source)["state"]["Cancel"] = false
					end
					Wait(1000)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("drillbit").."</b>.",5000)
			end
		end
	end,
	["pickaxe"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local mineCoords = { 2952.91,2791.51,41.03 }
		local Coordinates = {}
		local minutes = os.date("*t",  os.time()).min

		for i = 1,2 do
			local angle = (2 * math.pi * i / 2) + (minutes / 60 * math.pi / 5)
			local x = mineCoords[1] + 7 * math.cos(angle)+3
			local y = mineCoords[2] + 7 * math.sin(angle)+3
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "sapphireore" or "ironore", amount = (i%2~=0) and 4 or 3})
		end

		for i = 1,4  do
			local angle = (2 * math.pi * i / 4) + (minutes / 60 * math.pi / 4 )
			local x = mineCoords[1] + 14 * math.cos(angle)+3
			local y = mineCoords[2] + 14 * math.sin(angle)+3
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "rubyore" or "diamondore", amount = (minutes%2~=0) and 3 or 2})
		end

		for i = 1,8 do
			local angle = (2 * math.pi * i / 8) + (minutes / 60 * math.pi / 3)
			local x = mineCoords[1] + 21 * math.cos(angle)+3
			local y = mineCoords[2] + 21 * math.sin(angle)+3
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "goldore" or "copperore", amount = (i%2~=0) and 5 or 3})
		end
		
		for i = 1, 12 do
			local angle = (2 * math.pi * i / 12) + (minutes / 60 * math.pi / 2)
			local x = mineCoords[1] + 28 * math.cos(angle)+1
			local y = mineCoords[2] + 28 * math.sin(angle)+1
			table.insert(Coordinates, {x = x, y = y, item = (i%2~=0) and "leadore" or "emeraldore", amount = (minutes%2~=0) and 1 or 2})
		end

		if #(Coords - vec3(mineCoords[1],mineCoords[2],mineCoords[3])) <= 30 then
			Active[Passport] = os.time() + 16
			Player(source)["state"]["Buttons"] = true
			Player(source)["state"]["Cancel"] = true
			TriggerClientEvent("inventory:Close", source)
			TriggerClientEvent("Progress", source,15000)
			TriggerClientEvent("sounds:Private",source,"pickaxe",0.1)
			vRPC.createObjects(source,"melee@large_wpn@streamed_core","ground_attack_on_spot","prop_tool_pickaxe",1,18905,0.10,-0.1,0.0,-92.0,260.0,5.0)
			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					for _,Value in ipairs(Coordinates) do
						if #(Coords - vec3(Value.x, Value.y, Coords.z)) <= 3 then
							local Amount = math.random(Value.amount)
							local Experience = vRP.GetExperience(Passport,"Minerman")
							local Level = ClassCategory(Experience)
							if Level == 2 or Level == 3 or Level == 5 then
								Amount = Amount + 1
							elseif Level == 6 or Level == 7 or Level == 8 then
								Amount = Amount + 2
							elseif Level == 9 or Level == 10 then
								Amount = Amount + 3
							end
							vRP.PutExperience(Passport,"Minerman",1)
							if (vRP.InventoryWeight(Passport) + itemWeight(Value.item) * Amount) <= vRP.GetWeight(Passport) then
								vRP.GenerateItem(Passport,Value.item,Amount,true)
							end
						end
					end
					local Item = "stone"
					local Amount = math.random(2)
					for _,Value in pairs({
						vec3(2952.07,2819.73,42.58),
						vec3(2923.9,2809.09,43.35), 
						vec3(2921.64,2793.9,40.61), 
						vec3(2934.44,2779.35,39.07),
						vec3(2949.26,2770.88,39.02),
						vec3(2959.64,2775.72,39.92),
						vec3(2972.0,2779.34,38.64), 
						vec3(2976.44,2787.3,39.9), 	
						vec3(2968.12,2796.86,40.94),
						vec3(2952.52,2847.42,47.11),
						vec3(2967.8,2840.11,45.41), 
						vec3(2979.78,2821.56,44.74),
						vec3(2991.88,2802.39,43.93),
						vec3(3003.04,2780.11,43.41),
						vec3(3001.14,2763.14,42.97),
						vec3(2992.83,2756.31,42.82),
						vec3(2968.98,2738.39,43.74),
						vec3(2939.29,2751.12,43.39),
						vec3(2967.54,2758.4,43.08), 
						vec3(2989.76,2770.21,42.87),
						vec3(2937.02,2799.51,41.01),
						vec3(2954.26,2802.48,41.74),
						vec3(2964.23,2786.72,39.75),
						vec3(2947.96,2783.56,39.93),
					}) do
						if #(Coords - vec3(Value.x, Value.y, Value.z)) <= 3 then
							Amount = math.random(8)
						end
					end
					if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
						vRP.GenerateItem(Passport,Item,Amount,true)
					end
					vRP.UpgradeStress(Passport,1)
					vRPC.removeObjects(source)
					Player(source)["state"]["Buttons"] = false
					Player(source)["state"]["Cancel"] = false
				end
				Wait(1000)
			until not Active[Passport]
		elseif #(Coords - vec3(-520.73,1988.47,122.79)) <= 120 and Coords["z"] <= 140 then
			Active[Passport] = os.time() + 16
			Player(source)["state"]["Buttons"] = true
			Player(source)["state"]["Cancel"] = true
			TriggerClientEvent("inventory:Close", source)
			TriggerClientEvent("Progress", source,16000)
			TriggerClientEvent("sounds:Private",source,"pickaxe",0.1)
			vRPC.createObjects(source,"melee@large_wpn@streamed_core","ground_attack_on_spot","prop_tool_pickaxe",1,18905,0.10,-0.1,0.0,-92.0,260.0,5.0)
			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					local Item = "coal"
					local Amount = math.random(2)
					local Experience = vRP.GetExperience(Passport,"Minerman")
					local Level = ClassCategory(Experience)
					if Level == 2 or Level == 3 or Level == 5 then
						Amount = Amount + 1
					elseif Level == 6 or Level == 7 or Level == 8 then
						Amount = Amount + 2
					elseif Level == 9 or Level == 10 then
						Amount = Amount + 3
					end
					vRP.PutExperience(Passport,"Minerman",1)
					if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
						vRP.GenerateItem(Passport,Item,Amount,true)
					end
					if math.random(100) <= 30 then
						if (vRP.InventoryWeight(Passport) + itemWeight("geode") * 1) <= vRP.GetWeight(Passport) then
							vRP.GenerateItem(Passport,"geode",1,true)
						end
					end
					vRP.UpgradeStress(Passport,1)
					vRPC.removeObjects(source)
					Player(source)["state"]["Buttons"] = false
					Player(source)["state"]["Cancel"] = false
				end
				Wait(1000)
			until not Active[Passport]
		end
	end,
	["bandage"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,5000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.removeObjects(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("sounds:Private",source,"bandage",0.5)
							Healths[Passport] = os.time() + 30
							vRP.UpgradeStress(Passport,5)
							vRPC.UpgradeHealth(source,30)
						end
					end

					Wait(1000)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia.",5000,"Atenção")
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.",5000,"Atenção")
		end
	end,

	["sulfuric"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRPC.DowngradeHealth(source,100)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["chip"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		local Keyboard = vKEYBOARD.Secondary(source,"Três primeiros digitos","Três ultimos digitos")
		if Keyboard then
			local Primary = sanitizeString(Keyboard[1],"0123456789",true)
			local Secondary = sanitizeString(Keyboard[2],"0123456789",true)
			if string.len(Primary) == 3 and string.len(Secondary) == 3 then
				if not vRP.UserPhone(Primary.."-"..Secondary) then
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.UpgradePhone(Passport, Primary.."-"..Secondary)
						TriggerClientEvent("Notify",source,"verde","Número atualizado.",5000,"Sucesso")
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","Número existente.",5000,"Aviso")
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Necessário possuir 6 números.",5000,"Aviso")
			end
		end
	end,

	["analgesic"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.removeObjects(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 15
							vRP.UpgradeStress(Passport,3)
							vRPC.UpgradeHealth(source,8)
						end
					end

					Wait(1000)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia.",5000,"Aviso")
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.",5000,"Atenção")
		end
	end,

	["oxy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vPARAMEDIC.Oxycontin(source)
					TriggerClientEvent("Oxycontin",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["vehkey"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Vehicle,Network,Plate = vRPC.VehicleList(source,5)
		if Vehicle then
			if Plate == Split[2] then
				TriggerEvent("garages:LockVehicle",source,Network)
			end
		end
	end,

	["camera"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Camera"] then
			local Ped = GetPlayerPed(source)
			if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
				return
			end
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("inventory:Camera",source,false)
			vRPC.createObjects(source,"amb@world_human_paparazzi@male@base","base","prop_pap_camera_01",49,28422)
		end
	end,

	["camera2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Camera"] then
			local Ped = GetPlayerPed(source)
			if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
				return
			end
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("inventory:Camera",source,false)
			if math.random(100) <= 50 then
				vRPC.createObjects(source,"chocoholic@single110a","single110a_clip","prop_ing_camera_01",49, 28422, 0.0710,  0.0150, -0.0420,-68.3220, 99.6144,  2.9027)
			elseif math.random(100) <= 50 then
				vRPC.createObjects(source,"cellphone@female","cellphone_text_read_base_cover_low","prop_ing_camera_01",49, 28422, 0.0100, -0.0300, 0.0520, -172.0487, -163.9389, -29.0221)
			else
				vRPC.createObjects(source,"chocoholic@single110b","single110b_clip","prop_ing_camera_01",49, 60309, 0.0980, 0.0560, 0.1330, -15.8221, 107.0825, -16.0159)
			end
		end
	end,

	["binoculars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Camera"] then
			local Ped = GetPlayerPed(source)
			if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
				return
			end
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("inventory:Camera",source,true)
			vRPC.createObjects(source,"amb@world_human_binoculars@male@enter","enter","prop_binoc_01",49,28422)
		end
	end,

	["backpackp"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Data = vRP.UserData(Passport,"Backpack")
		if Data[Item] then
			TriggerClientEvent("Notify",source,"amarelo","Você ja possui essa mochila equipada.",5000,"Aviso")
		else
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.SetWeight(Passport,15)
				Data[Item] = os.time() + 2592000
				vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Backpack", dvalue = json.encode(Data) })
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		end
	end,

	["backpackm"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Data = vRP.UserData(Passport,"Backpack")
		if Data[Item] then
			TriggerClientEvent("Notify",source,"amarelo","Você ja possui essa mochila equipada.",5000,"Aviso")
		else
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.SetWeight(Passport,25)
				Data[Item] = os.time() + 2592000
				vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Backpack", dvalue = json.encode(Data) })
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		end
	end,

	["backpackg"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Data = vRP.UserData(Passport,"Backpack")
		if Data[Item] then
			TriggerClientEvent("Notify",source,"amarelo","Você ja possui essa mochila equipada.",5000,"Aviso")
		else
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.SetWeight(Passport,30)
				Data[Item] = os.time() + 2592000
				vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Backpack", dvalue = json.encode(Data) })
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		end
	end,

	["newchars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			vRP.UpgradeChars(source)
			TriggerClientEvent("inventory:Update",source,"Backpack")
			TriggerClientEvent("Notify",source,"verde","Personagem liberado.",5000,"Sucesso")
		end
	end,

	["gemstone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,Amount,false,Slot) then
			TriggerClientEvent("inventory:Update",source,"Backpack")
			vRP.UpgradeGemstone(Passport,Amount,false)
		end
	end,

	["badge01"] = function(source, Passport, Amount, Slot, Full, Item, Split)
		local Consult = exports["oxmysql"]:query_async("SELECT * FROM smartphone_instagram WHERE user_id = @Passport;",{ Passport = Passport })
		local Groups = vRP.Groups()
		for k, v in pairs(Groups) do
			if Groups[k].Type and Groups[k].Type == "Policia" then
				local Datatable = vRP.GetSrvData("Permissions:" .. k)
				if Datatable[tostring(Passport)] then
					TriggerClientEvent("inventory:Close", source)
					vRPC.createObjects(source, "paper_1_rcm_alt1-8", "player_one_dual-8", "denis3d_policebadge_01", 49, 28422, 0.13, 0.05, -0.05, 40.0, 55.0, -267.0)
					local Identity = vRP.Identity(Passport)
					local Avatar = Consult[1] and Consult[1]["avatarURL"] or ""
					local Rank = v.Hierarchy[Datatable[tostring(Passport)]]
					local ClosestPeds = vRPC.ClosestPeds(source, 3)
					for _, OtherSource in pairs(ClosestPeds) do
						TriggerClientEvent("badge:Show", OtherSource, Rank, Identity["name"] .. " " .. Identity["name2"],Passport, Avatar, k)
					end
					return
				end
			end
		end
	end,

	["badge02"] = function(source, Passport, Amount, Slot, Full, Item, Split)
		TriggerClientEvent("inventory:Close", source)
		vRPC.createObjects(source, "paper_1_rcm_alt1-8", "player_one_dual-8", "prop_medic_badge", 49, 28422, 0.065, 0.029,
			-0.035, 80.0, -1.90, 75.0)
	end,

	["namechange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		local Keyboard = vKEYBOARD.Secondary(source,"Nome","Sobrenome")
		if Keyboard then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("Notify",source,"verde","Passaporte atualizado.",5000,"Sucesso")
				TriggerClientEvent("inventory:Update",source,"Backpack")
				vRP.UpgradeNames(Passport,Keyboard[1],Keyboard[2])
			end
		end
	end,

	["facechange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRP.Query("playerdata/SetData", { Passport = Passport, dkey = "Creator", dvalue = json.encode(0) })
		vRP.Kick(source,"Mudança de Rosto.")
	end,

	["soap"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPLAYER.checkSoap(source) ~= nil then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,10000)
			vRPC.playAnim(source,false,{"amb@world_human_bum_wash@male@high@base","base"},true)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.removeObjects(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("player:Residuals",source)
					end
				end

				Wait(1000)
			until not Active[Passport]
		end
	end,

	["joint"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,10000)
			vRPC.createObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.removeObjects(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.WeedTimer(Passport,120)
						vRP.DowngradeThirst(Passport,40)
						vRP.DowngradeHunger(Passport,40)
						vRP.DowngradeStress(Passport,20)
						TriggerClientEvent("Joint",source)
					end
				end

				Wait(1000)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("lighter").."</b>.",5000,"Atenção")
		end
	end,

	["weedclone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		local Hash = "bkr_prop_weed_med_01a"
		local Application,Coords = vRPC.objectCoords(source,Hash)
		if Application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				Active[Passport] = os.time() + 3
				TriggerClientEvent("Progress",source,3000)
				vRPC.playAnim(source,false,{"amb@prop_human_bum_bin@base","base"},true)
				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.removeObjects(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Points = 0
							local Route = GetPlayerRoutingBucket(source)
							if Split[2] ~= nil then
								Points = parseInt(Split[2])
							end
							exports["plants"]:Plants(Coords,Route,Points)
						end
					end
					Wait(1000)
				until not Active[Passport]
			end
		end
		Player(source)["state"]["Buttons"] = false
	end,

	["tablecoke"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		local Hash = "bkr_prop_coke_table01a"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0
					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]
					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = heading, object = Hash, item = Full, Distance = 50, mode = "1" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end
		Player(source)["state"]["Buttons"] = false
	end,

	["tablemeth"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		local Hash = "bkr_prop_meth_table01a"
		local Application,Coords,heading = vRPC.objectCoords(source,Hash)
		if Application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0
					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]
					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 50, mode = "1" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["tableweed"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		local Hash = "bkr_prop_weed_table_01a"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0
					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]
					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 50, mode = "1" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end
		Player(source)["state"]["Buttons"] = false
	end,

	["metadone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					TriggerClientEvent("Metadone",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["heroin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,15000)
		vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					TriggerClientEvent("Heroin",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["crack"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,15000)
		vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					TriggerClientEvent("Crack",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["cocaine"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					vRP.DowngradeStress(Passport,20)
					TriggerClientEvent("Cocaine",source)
					TriggerClientEvent("Energetic",source,15,1.25)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["meth"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] and os.time() < Armors[Passport] then
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Armors[Passport] - os.time().."</b> segundos.",5000,"Aviso")
			return
		end
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,15000)
		vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Methamphetamine",source)
					Armors[Passport] = os.time() + 90
					vRP.ChemicalTimer(Passport,120)
					vRP.SetArmour(source,10)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["cigar"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,10000)
			vRP.createObjects(source,"amb@world_human_smoking@male@male_a@enter","enter","prop_cigar_01", 48, 28422, 0.0, 0.01, 0.0, -10.0, -10.0, 0.0)
			SetTimeout(2000,function()
				vRP.createObjects(source,"","","prop_cigar_01", 1, 47419, 0.010, 0.0, 0.0, 50.0, 0.0, -80.0)
				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.DowngradeStress(Passport,30)
						end
					end
					Wait(1000)
				until not Active[Passport]
			end)
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("lighter").."</b>.",5000,"Atenção")
		end
	end,


	["cigarette"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,10000)
			vRPC.createObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.removeObjects(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.DowngradeStress(Passport,10)
					end
				end

				Wait(1000)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("lighter").."</b>.",5000,"Atenção")
		end
	end,

	["rottweiler"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_rottweiler")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["husky"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_husky")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["shepherd"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_shepherd")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["retriever"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_retriever")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["poodle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_poodle")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pug"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_pug")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["westy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_westy")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cat"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 2
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Assobiando",2000)
		vRPC.playAnim(source,true,{"rcmnigel1c","hailing_whistle_waive_a"},false)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("dynamic:animalSpawn",source,"a_c_cat_01")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["vape"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 20
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,20000)
		vRPC.createObjects(source,"amb@world_human_smoking@male@male_b@base","base","xm3_prop_xm3_vape_01a",49,28422,-0.02,-0.02,0.02,58.0,110.0,10.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				vRP.DowngradeStress(Passport,20)
				Player(source)["state"]["Buttons"] = false
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["medkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)
				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.removeObjects(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 60
							vRPC.UpgradeHealth(source,100)
							vPARAMEDIC.Bandage(source)
						end
					end
					Wait(1000)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia.",5000,"Aviso")
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.",5000,"Atenção")
		end
	end,

	["gauze"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		--[[ if vPARAMEDIC.Bleeding(source) > 0 then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,3000)
			vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)
			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.removeObjects(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vPARAMEDIC.Bandage(source)
					end
				end
				Wait(1000)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Nenhum ferimento encontrado.",5000,"Aviso")
		end ]]

		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)
				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.removeObjects(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 60
							vRPC.UpgradeHealth(source,60)
							vPARAMEDIC.Bandage(source)
						end
					end
					Wait(1000)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia.",5000,"Aviso")
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.",5000,"Atenção")
		end
	end,

	["teddy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.createObjects(source,"impexp_int-0","mp_m_waremech_01_dual-0","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
	end,

	["rose"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.createObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","prop_single_rose",49,18905,0.13,0.15,0.0,-100.0,0.0,-20.0)
	end,

	["gsrkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			Active[Passport] = os.time() + 5
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,5000)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Informations = vPLAYER.checkSoap(ClosestPed)
						if Informations then
							local Number = 0
							local Message = ""

							for Value,v in pairs(Informations) do
								Number = Number + 1
								Message = Message.."<b>"..Number.."</b>: "..Value.."<br>"
							end

							TriggerClientEvent("Notify",source,"verde","Informações",Message,10000,"Sucesso")
						else
							TriggerClientEvent("Notify",source,"amarelo","Nenhum resultado encontrado.",5000,"Aviso")
						end
					end
				end

				Wait(1000)
			until not Active[Passport]
		end
	end,

	["gdtkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			local OtherPassport = vRP.Passport(ClosestPed)
			local Identity = vRP.Identity(OtherPassport)
			if OtherPassport and Identity then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,5000)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local weed = vRP.WeedReturn(OtherPassport)
							local chemical = vRP.ChemicalReturn(OtherPassport)
							local alcohol = vRP.AlcoholReturn(OtherPassport)

							local chemStr = ""
							local alcoholStr = ""
							local weedStr = ""

							if chemical == 0 then
								chemStr = "Nenhum"
							elseif chemical == 1 then
								chemStr = "Baixo"
							elseif chemical == 2 then
								chemStr = "Médio"
							elseif chemical >= 3 then
								chemStr = "Alto"
							end

							if alcohol == 0 then
								alcoholStr = "Nenhum"
							elseif alcohol == 1 then
								alcoholStr = "Baixo"
							elseif alcohol == 2 then
								alcoholStr = "Médio"
							elseif alcohol >= 3 then
								alcoholStr = "Alto"
							end

							if weed == 0 then
								weedStr = "Nenhum"
							elseif weed == 1 then
								weedStr = "Baixo"
							elseif weed == 2 then
								weedStr = "Médio"
							elseif weed >= 3 then
								weedStr = "Alto"
							end

							TriggerClientEvent("Notify",source,"azul","Informações","<b>Químicos:</b> "..chemStr.."<br><b>Álcool:</b> "..alcoholStr.."<br><b>Drogas:</b> "..weedStr,8000)
						end
					end

					Wait(1000)
				until not Active[Passport]
			end
		end
	end,

	["nitro"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.removeObjects(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Vehicle = NetworkGetEntityFromNetworkId(Network)
							Entity(Vehicle)["state"]:set("Nitro",2000,true)
							
							local Nitro = GlobalState["Nitro"]
							Nitro[Plate] = 2000
							GlobalState:set("Nitro",Nitro,true)
						end
					end

					Wait(1000)
				until not Active[Passport]

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end
			end
		end
	end,

	["vest"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] and os.time() < Armors[Passport] then
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Armors[Passport] - os.time().."</b> segundos.",5000,"Aviso")
			return
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					Armors[Passport] = os.time() + 1800
					vRP.SetArmour(source,100)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["camera"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
			return
		end

		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("freecam:Active", source)
	end,

	["GADGET_PARACHUTE"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,3000)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vCLIENT.Parachute(source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["advtoolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				if vTASKBAR.Task(source,5,10000) then
					Active[Passport] = os.time() + 15
					TriggerClientEvent("Progress",source,15000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:RepairBoosts",v,Network,Plate)
									end)
								end

								local Number = parseInt(Split[2]) - 1

								if Number >= 1 then
									vRP.GiveItem(Passport,"advtoolbox-"..Number,1,false)
								end
							end
						end

						Wait(1000)
					until not Active[Passport]
				end

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.removeObjects(source)
			end
		end
	end,

	["toolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				if vTASKBAR.Task(source,5,10000) then
					Active[Passport] = os.time() + 15
					TriggerClientEvent("Progress",source,15000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:RepairBoosts",v,Network,Plate)
									end)
								end
							end
						end

						Wait(1000)
					until not Active[Passport]
				end

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.removeObjects(source)
			end
		end
	end,

	["drift"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,Model,Class = vRPC.VehicleList(source,4)
			if Vehicle and (Class <= 7 or Class == 9) then
				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				if vTASKBAR.Task(source,5,50000) then
					Active[Passport] = os.time() + 15
					TriggerClientEvent("Progress",source,15000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Networked = NetworkGetEntityFromNetworkId(Network)
								Entity(Networked)["state"]:set("Drift",true,true)

								if vRP.PassportPlate(Plate) then
									vRP.Query("vehicles/Drift",{ Plate = Plate })
								end
							end
						end

						Wait(1000)
					until not Active[Passport]
				end

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.removeObjects(source)
			end
		end
	end,

	["homekey"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Coords = GetEntityCoords(GetPlayerPed(source))
		local Number = exports["propertys"]:Proximity(Coords) or (exports["propertys"]:Exit(Coords) and parseInt(GetPlayerRoutingBucket(source)-100000))
		if Number then
			vRPC.createObjects(source,"anim@heists@keycard@","exit","h4_prop_h4_key_desk_01",48,57005, 0.15, 0.05, -0.01, 30.0, 60.0, -90.0)
			if Number == tonumber(Split[3]) then
				if vRP.Query("propertys/Key",{ Key = tonumber(Split[2]) })[1] then
					TriggerEvent("propertys:Lock",source,Number)
				else
					TriggerClientEvent("Notify",source,"amarelo","A fechadura foi trocada.",5000,"Atenção")
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Chave incompatível com a fechadura.",5000,"Atenção")
			end
			Wait(400)
			vRPC.removeObjects(source)
		end
	end,

	["lockcore"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Coords = GetEntityCoords(GetPlayerPed(source))
		local Number = exports["propertys"]:Proximity(Coords) or (exports["propertys"]:Exit(Coords) and parseInt(GetPlayerRoutingBucket(source)-100000))
		if Number then
			local Consult = vRP.Query("propertys/Check",{ Number = Number, Passport = Passport })
			if Consult[1] then
				if vRP.ConsultItem(Passport,"screwdriver",1) then
					vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)
					if vTASKBAR.Task(source,3,10000) then
						if vRP.TakeItem(Passport,Full,1,true) then
							local Key = vRP.GenerateString("DDDDDD")
							repeat
								Key = vRP.GenerateString("DDDDDD") 
							until not vRP.Query("propertys/Key",{ Key = Key })[1]
							vRP.Query("propertys/Credentials",{ Number = Number, Key = Key })
							vRP.GiveItem(Passport,"homekey-"..Key.."-"..Number,2,true)
							TriggerClientEvent("Notify",source,"amarelo","Substituição da fechadura concluída.",5000,"Atenção")
						end
					end
					vRPC.removeObjects(source)
				else
					TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("screwdriver").."</b>.",5000,"Atenção")
				end
			end
		end
	end,

	["lockpick"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate,Model,Class = vRPC.VehicleList(source,4)
			if Vehicle then
				if Plate == "PDMSPORT" and Model == "stockade" or Class == 15 or Class == 16 or Class == 19 then
					return
				end
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				local Networked = NetworkGetEntityFromNetworkId(Network)
				if vRP.InsideVehicle(source) then
					vGARAGE.StartHotwired(source)
					if vTASKBAR.Task(source,10,10000) then
						SetVehicleDoorsLocked(Networked,1)
						TriggerEvent("plateEveryone",Plate)
						TriggerEvent("platePlayers",Plate,Passport)
						TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)
						if math.random(100) >= 25 then
							TriggerEvent("Wanted",source,Passport,300)
							local Coords = GetEntityCoords(GetPlayerPed(source))
							local Groups = vRP.Groups()
							for key,Value in pairs(Groups) do
								if Value["Type"] == "Policia" then
									local Service,Amount = vRP.NumPermission(key)
									for Passports,Sources in pairs(Service) do
										async(function()
											vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
											TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(Model).." - "..Plate, color = 44 })
										end)
									end
								end
							end
						end
					end
					vGARAGE.StopHotwired(source,Vehicle)
				else
					vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)
					if Dismantle[Plate] then
						if vTASKBAR.Task(source,10,10000) then
							Active[Passport] = os.time() + 15
							if math.random(100) <= 30 then
								TriggerClientEvent("dismantle:Dispatch",source)
							end
							TriggerClientEvent("Progress",source,15000)
							repeat
								if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
									Active[Passport] = nil
									SetVehicleDoorsLocked(Networked,1)
									TriggerClientEvent("target:Dismantle",source,Model)
									--[[ Entity(Networked)["state"]:set("Lockpick",Passport,true) ]]
									TriggerEvent("plateEveryone",Plate)
									TriggerEvent("platePlayers",Plate,Passport)	
								end
								Wait(1000)
							until not Active[Passport]
						end
					else
						if vTASKBAR.Task(source,10,10000) then
							SetVehicleDoorsLocked(Networked,1)
							TriggerEvent("plateEveryone",Plate)
							TriggerEvent("platePlayers",Plate,Passport)
							TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)
							if math.random(100) >= 25 then
								TriggerEvent("Wanted",source,Passport,300)
								local Coords = GetEntityCoords(GetPlayerPed(source))
								local Groups = vRP.Groups()
								for key,Value in pairs(Groups) do
									if Value["Type"] == "Policia" then
										local Service,Amount = vRP.NumPermission(key)
										for Passports,Sources in pairs(Service) do
											async(function()
												vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
												TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(Model).." - "..Plate, color = 44 })
											end)
										end
									end
								end
				
							end
						end
					end
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.removeObjects(source)


				if math.random(1000) >= 900 then
					if vRP.TakeItem(Passport,Full,1,false) then
						vRP.GiveItem(Passport,"lockpick-0",1,false)
						TriggerClientEvent("NotifyItens",source,{ "-","lockpick",1,"Lockpick de Alumínio" })
					end
				end

			else
				local Coords = GetEntityCoords(GetPlayerPed(source))
				local Number = exports["doors"]:Proximity(Coords)
				if Number then
					TriggerClientEvent("inventory:Close",source)
					local Doors = GlobalState["Doors"]
					
					if not vTASKBAR.Task(source,10,10000) then
						if math.random(1000) >= 900 then
							if vRP.TakeItem(Passport,Full,1,false) then
								vRP.GiveItem(Passport,"lockpick-0",1,false)
								TriggerClientEvent("NotifyItens",source,{ "-","lockpick",1,"Lockpick de Alumínio" })
							end
						end
						return
					end
	
					local Coords = GetEntityCoords(GetPlayerPed(source))

					local Groups = vRP.Groups()
					for key,Value in pairs(Groups) do
						if Value["Type"] == "Policia" then
							local Service,Amount = vRP.NumPermission(key)
							for Passports,Sources in pairs(Service) do
								async(function()
									vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
									TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = "Tranca de Porta Violada", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
								end)
							end
						end
					end
					
					Doors[Number]["Lock"] = false
					if Doors[Number]["Other"] then
						Doors[Doors[Number]["Other"]]["Lock"] = false
					end
					GlobalState:set("Doors",Doors,true)
					vRPC.playAnim(source,true,Doors[Number]["Other"] and {"veh@mower@base","start_engine"} or {"anim@heists@keycard@","exit"},false)
					TriggerClientEvent("sounds:Private",source,"houses_door_unlock",0.5)
				else
					local Number = exports["propertys"]:Proximity(Coords)
					if Number then
						TriggerClientEvent("inventory:Close",source)		
						local Consult = vRP.Query("propertys/Exist",{ Number = Number })
						if not (Consult[1] and Consult[1]["Passport"] == Passport) then
							TriggerEvent("propertys:Lockpick",source,Number,(Consult[1] and Consult[1].Interior) or 1)
							if math.random(1000) >= 900 then
								vRP.RemoveItem(Passport,Full,1,true)
							end
						end
					end
				end
			end
		else
			if vTASKBAR.Task(source,5,10000) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					Player(source)["state"]["Handcuff"] = false
					Player(source)["state"]["Commands"] = false
					TriggerClientEvent("sounds:Private",source,"uncuff",0.5)
					vRPC.removeObjects(source)
				end
			end
		end
	end,

	["blocksignal"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle and vRP.InsideVehicle(source) then
				if not exports["garages"]:Signal(Plate) then
					vRPC.AnimActive(source)
					vGARAGE.StartHotwired(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)

					if vTASKBAR.Task(source,3,10000) then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("Notify",source,"verde","<b>Bloqueador de Sinal</b> instalado.",5000,"Sucesso")
							TriggerEvent("SignalRemove",Plate)
						end
					end

					Player(source)["state"]["Buttons"] = false
					vGARAGE.StopHotwired(source)
					Active[Passport] = nil
				else
					TriggerClientEvent("Notify",source,"amarelo","<b>Bloqueador de Sinal</b> já instalado.",5000,"Aviso")
				end
			end
		end
	end,

	["postit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("postit:initPostit",source)
	end,

	["absolut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["hennessy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["chandon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["dewars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["orangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["passionjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.DowngradeStress(Passport,20)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["tangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["grapejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["strawberryjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bananajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["acerolajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"plasticbottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["water"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"plasticbottle",1)
					vRP.UpgradeThirst(Passport,35)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["coffee"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,10,1.05)
					vRP.UpgradeThirst(Passport,7)
					vRP.UpgradeStress(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["guarananatural"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,10000)
		vRPC.createObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_food_bs_juice02",49,28422,0.0,-0.01,-0.15,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,10,1.10)
					vRP.UpgradeThirst(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["sinkalmy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
					vRP.DowngradeStress(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["ritmoneury"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
					vRP.DowngradeStress(Passport,50)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["cola"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["energetic"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,15000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,30,1.20)
					vRP.UpgradeThirst(Passport,10)
					vRP.UpgradeStress(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["soda"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","ng_proc_sodacan_01b",49,60309,0.0,0.0,-0.04,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,7)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["miningpan"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.IsInWater(source) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			Player(source)["state"]["Cancel"] = true
			TriggerClientEvent("inventory:Close", source)
			TriggerClientEvent("Progress", source,10000)
			if not vRPC.PlayingAnim(source,"amb@world_human_bum_wash@male@high@base","base") then
				vRPC.AnimActive(source)
				vRPC.playAnim(source,false,{"amb@world_human_bum_wash@male@high@base","base"},true)
			end
			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					local Item = "gravel"
					local Amount = math.random(2)
					local Experience = vRP.GetExperience(Passport,"Minerman")
					local Level = ClassCategory(Experience)
					if Level == 2 or Level == 3 or Level == 5 then
						Amount = Amount + 1
					elseif Level == 6 or Level == 7 or Level == 8 then
						Amount = Amount + 2
					elseif Level == 9 or Level == 10 then
						Amount = Amount + 3
					end
					vRP.PutExperience(Passport,"Minerman",1)
					if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
						vRP.GenerateItem(Passport,Item,Amount,true)
					end
					if math.random(100) <= 40 then
						if (vRP.InventoryWeight(Passport) + itemWeight("goldnugget") * 1) <= vRP.GetWeight(Passport) then
							vRP.GenerateItem(Passport,"goldnugget",1,true)
						end
					else
						if math.random(100) <= 20 then
							if (vRP.InventoryWeight(Passport) + itemWeight("jadeite") * 1) <= vRP.GetWeight(Passport) then
								vRP.GenerateItem(Passport,"jadeite",1,true)
							end
						end
					end
					vRP.UpgradeStress(Passport,1)
					vRPC.removeObjects(source)
					Player(source)["state"]["Buttons"] = false
					Player(source)["state"]["Cancel"] = false
				end
				Wait(1000)
			until not Active[Passport]
		end
	end,

	["fishingrod"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.IsInWater(source) then
			if vRP.TakeItem(Passport,"bait",1,true) then
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				
				if not vRPC.PlayingAnim(source,"amb@world_human_stand_fishing@idle_a","idle_c") then
					vRPC.AnimActive(source)
					vRPC.createObjects(source,"amb@world_human_stand_fishing@idle_a","idle_c","prop_fishing_rod_01",49,60309)
				end
	
				local Experience = vRP.GetExperience(Passport,"Fisherman")
				local Level = ClassCategory(Experience)
				local Velocity = 100000
				local AmountTasks = 5
	
				if Level == 2 then
					AmountTasks = 5
					Velocity = 90000
				elseif Level == 3 then
					AmountTasks = 5
					Velocity = 85000
				elseif Level == 4 then
					AmountTasks = 4
					Velocity = 80000
				elseif Level == 5 then
					AmountTasks = 4
					Velocity = 75000
				elseif Level == 6 then
					AmountTasks = 4
					Velocity = 70000
				elseif Level == 7 then
					AmountTasks = 3
					Velocity = 65000
				elseif Level == 8 then
					AmountTasks = 3
					Velocity = 60000
				elseif Level == 9 then
					AmountTasks = 3
					Velocity = 55000
				elseif Level == 10 then
					AmountTasks = 2
					Velocity = 50000
				end
			
				if vTASKBAR.Task(source,AmountTasks,Velocity) then
					local List = { "octopus","shrimp","carp","horsefish","tilapia","codfish","catfish","goldenfish","pirarucu","pacu","tambaqui" }--[[ { "anchovy","catfish","herring","orangeroughy","salmon","sardine","smalltrout","yellowperch" } ]]
					local Random = math.random(#List)
					local Rand = math.random(1000)
					local Selected = List[Random]
					if Rand >= 985 then
						Selected = "treasurebox"
					elseif Rand >= 925 and Rand <= 984 then
						Selected = "smallshark"
					end
					if (vRP.InventoryWeight(Passport) + itemWeight(Selected)) <= vRP.GetWeight(Passport) then
						vRP.PutExperience(Passport,"Fisherman",1)
						vRP.GenerateItem(Passport,Selected,1,true)
					end
				end
	
				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil	
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("bait").."</b>.",5000,"Atenção")
			end
		end
	end,

	["coffeemilk"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,10,1.10)
					vRP.UpgradeThirst(Passport,20)
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["pizzamozzarella"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","knjgh_pizzaslice1",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["pizzabanana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","knjgh_pizzaslice2",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["pizzachocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","knjgh_pizzaslice3",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["sushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["nigirizushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["calzone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["chickenfries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["cookies"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["onionrings"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["apple"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","sf_prop_sf_apple_01b",49,60309, 0.0,0.0150,-0.0200,-124.6964,-166.5760,8.4572)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,


	["bsmoneyshot"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bsbleederburger"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,


	["bsheartstopper"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["hamburger2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["hamburger3"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["ollyrancher"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)
		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,1)
					vRP.DowngradeStress(Passport,5)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["hamburger"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)
		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,15)
				end
			end
			Wait(100)
		until not Active[Passport]
	end,

	["cannedsoup"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"canopener",1) then
			vRPC.AnimActive(source)
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			if vRP.ConsultItem(Passport,"spoon",1) then
				Active[Passport] = os.time() + 10
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,true,{"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1","base_idle"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),60309, -0.03, 0.015, 0.06, -20.0, 30.0, 180.0)
				local Spoon = CreateObject(GetHashKey("h4_prop_h4_caviar_spoon_01a"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Spoon) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Spoon),NetworkGetNetworkIdFromEntity(Ped),28422,  0.0, 0.01, 0.0, -10.0, -10.0, 0.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						while DoesEntityExist(Spoon) do
							DeleteEntity(Spoon)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,70)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			else
				Active[Passport] = os.time() + 20
				TriggerClientEvent("Progress",source,20000)
				vRPC.playAnim(source,true,{"fractalcanfood@animation","canfood_clip"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),57005, 0.13, 0.05,-0.02, -90.0, -72.0,-23.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,40)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("canopener").."</b>.",5000,"Atenção")
		end
	end,

	["canofcorn"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"canopener",1) then
			vRPC.AnimActive(source)
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			if vRP.ConsultItem(Passport,"spoon",1) then
				Active[Passport] = os.time() + 10
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,true,{"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1","base_idle"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),60309, -0.03, 0.015, 0.06, -20.0, 30.0, 180.0)
				local Spoon = CreateObject(GetHashKey("h4_prop_h4_caviar_spoon_01a"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Spoon) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Spoon),NetworkGetNetworkIdFromEntity(Ped),28422,  0.0, 0.01, 0.0, -10.0, -10.0, 0.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						while DoesEntityExist(Spoon) do
							DeleteEntity(Spoon)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,70)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			else
				Active[Passport] = os.time() + 20
				TriggerClientEvent("Progress",source,20000)
				vRPC.playAnim(source,true,{"fractalcanfood@animation","canfood_clip"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),57005, 0.13, 0.05,-0.02, -90.0, -72.0,-23.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,40)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("canopener").."</b>.",5000,"Atenção")
		end
	end,

	["canofbeans"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"canopener",1) then
			vRPC.AnimActive(source)
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			if vRP.ConsultItem(Passport,"spoon",1) then
				Active[Passport] = os.time() + 10
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,true,{"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1","base_idle"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),60309, -0.03, 0.015, 0.06, -20.0, 30.0, 180.0)
				local Spoon = CreateObject(GetHashKey("h4_prop_h4_caviar_spoon_01a"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Spoon) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Spoon),NetworkGetNetworkIdFromEntity(Ped),28422,  0.0, 0.01, 0.0, -10.0, -10.0, 0.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						while DoesEntityExist(Spoon) do
							DeleteEntity(Spoon)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,70)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			else
				Active[Passport] = os.time() + 20
				TriggerClientEvent("Progress",source,20000)
				vRPC.playAnim(source,true,{"fractalcanfood@animation","canfood_clip"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),57005, 0.13, 0.05,-0.02, -90.0, -72.0,-23.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,40)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("canopener").."</b>.",5000,"Atenção")
		end
	end,

	["spaghetti"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"canopener",1) then
			vRPC.AnimActive(source)
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			if vRP.ConsultItem(Passport,"spoon",1) then
				Active[Passport] = os.time() + 10
				TriggerClientEvent("Progress",source,10000)
				vRPC.playAnim(source,true,{"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1","base_idle"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),60309, -0.03, 0.015, 0.06, -20.0, 30.0, 180.0)
				local Spoon = CreateObject(GetHashKey("h4_prop_h4_caviar_spoon_01a"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Spoon) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Spoon),NetworkGetNetworkIdFromEntity(Ped),28422,  0.0, 0.01, 0.0, -10.0, -10.0, 0.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						while DoesEntityExist(Spoon) do
							DeleteEntity(Spoon)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,70)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			else
				Active[Passport] = os.time() + 20
				TriggerClientEvent("Progress",source,20000)
				vRPC.playAnim(source,true,{"fractalcanfood@animation","canfood_clip"},true)
				local Ped = GetPlayerPed(source)
				local Can = CreateObject(GetHashKey("fractal_food_beanscan"),GetEntityCoords(Ped), true, true, false)
				while not DoesEntityExist(Can) do Wait(0) end
				TriggerClientEvent("AttachEntityToEntity",source,NetworkGetNetworkIdFromEntity(Can),NetworkGetNetworkIdFromEntity(Ped),57005, 0.13, 0.05,-0.02, -90.0, -72.0,-23.0)
				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						while DoesEntityExist(Can) do
							DeleteEntity(Can)
							Wait(1)
						end
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.UpgradeHunger(Passport,40)
						end
					end
		
					Wait(1000)
				until not Active[Passport]
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("canopener").."</b>.",5000,"Atenção")
		end
	end,

	["jailfood"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)
		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,100)
				end
			end
			Wait(1000)
		until not Active[Passport]
	end,

	["deerration"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) and not vCLIENT.CheckRation(source) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,10000)
			vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.removeObjects(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("inventory:Ration",source)
					end
				end
				Wait(1000)
			until not Active[Passport]
		end
	end,

	["oilbarrel"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		local Hash = "prop_barrel_exp_01a"
		local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
		if Application and not vCLIENT.objectExist(source,Coords,Hash) and vRP.TakeItem(Passport,Full,1,true,Slot) then
			local Number = 0
			repeat
				Number = Number + 1
			until not Objects[tostring(Number)]
			Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100, mode = "Oil" }
			TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
		end
		Player(source)["state"]["Buttons"] = false
	end,

	["barrier"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vCLIENT.CheckInterior(source) then
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)

			local Hash = "prop_mp_barrier_02b"
			local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
			if Application and not vCLIENT.objectExist(source,Coords,Hash) and vRP.TakeItem(Passport,Full,1,true,Slot) then
				local Number = 0

				repeat
					Number = Number + 1
				until not Objects[tostring(Number)]

				Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100, mode = "1" }
				TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
			end

			Player(source)["state"]["Buttons"] = false
		end
	end,

	["medicbag"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vCLIENT.CheckInterior(source) then
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)

			local Hash = "xm_prop_x17_bag_med_01a"
			local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
			if Application and not vCLIENT.objectExist(source,Coords,Hash) and vRP.TakeItem(Passport,Full,1,true,Slot) then
				local Number = 0

				repeat
					Number = Number + 1
				until not Objects[tostring(Number)]

				Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 50, mode = "4" }
				TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
			end

			Player(source)["state"]["Buttons"] = false
		end
	end,

	["hotdog"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_cs_hotdog_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["sandwich"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_sandwich_01",49,18905,0.13,0.05,0.02,-50.0,16.0,60.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["tacos"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_taco_01",49,18905,0.16,0.06,0.02,-50.0,220.0,60.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["fries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bsfries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bsrings"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["bsnuggets"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["friesbacon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["milkshake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["milkshakepeanut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["cappuccino"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["applelove"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,20)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["cupcake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["chocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
					vRP.DowngradeStress(Passport,3)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["donut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_amb_donut",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(1000)
		until not Active[Passport]
	end,

	["dismantle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.Dismantle(source) and vRP.TakeItem(Passport,Full,1,true,Slot) then
			TriggerClientEvent("inventory:Update",source,"Backpack")
		end
	end,

	["tyres"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if not vCLIENT.CheckWeapon(source,"WEAPON_WRENCH") then
				TriggerClientEvent("Notify",source,"amarelo","<b>Chave Inglesa</b> não encontrada.",5000,"Aviso")
				return
			end

			local Vehicle,Tyre,Network,Plate = vCLIENT.Tyres(source)
			if Vehicle then
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"amb@medic@standing@kneel@idle_a","idle_a"},true)
				vRPC.createObjects(source,"anim@heists@box_carry@","idle","imp_prop_impexp_tyre_01a",49,28422,-0.02,-0.1,0.2,10.0,0.0,0.0)

				if vTASKBAR.Task(source,3,7500) then
					Active[Passport] = os.time() + 10
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("Progress",source,10000)
					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil
							Player(source)["state"]["Buttons"] = false

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:RepairTyres",v,Network,Tyre,Plate)
									end)
								end
							end
						end

						Wait(1000)
					until not Active[Passport]
				end

				vRPC.removeObjects(source)
			end
		end
	end,

	["platepremium"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Vehicle,Network,Plate,Model = vRPC.VehicleList(source,5)
		if Vehicle and Network and Plate and Model then
			TriggerClientEvent("inventory:Close",source)	
			if vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Model })[1] then
				local Keyboard = vKEYBOARD.Primary(source,"Placa")
				if Keyboard then
					local plate = sanitizeString(Keyboard[1],"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",true)
					if string.len(plate) ~= 8 then
						TriggerClientEvent("Notify",source,"amarelo","Nome de definição inválido.",5000,"Aviso")
						return
					else
						if vRP.PassportPlate(plate) then
							TriggerClientEvent("Notify",source,"amarelo","Placa escolhida já existe no sistema.",5000,"Aviso")
							return
						else
							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								SetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(Network),string.upper(plate))
								vRP.Query("vehicles/plateVehiclesUpdate",{ Passport = Passport, vehicle = Model, plate = string.upper(plate) })
								TriggerClientEvent("Notify",source,"verde","Placa atualizada.",5000,"Sucesso")
								local Plates = GlobalState["Plates"]
								Plates[string.upper(plate)], Plates[string.upper(Plate)] = Passport, nil
								GlobalState:set("Plates",Plates,true)
							end
						end
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Modelo de veículo não encontrado.",5000,"Aviso")
			end
		end
	end,

	["laptop"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("creative:Browser",source)
	end,

	["radio"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("radio:Open",source)
		vRPC.AnimActive(source)
	end,

	
	["laptop"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("police:Mdt", source)
	end,

	["drone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		if vRP.ConsultItem(Passport,"dronecontrol",1) then
			if vRP.TakeItem(Passport, Full, 1, true, Slot) then

				TriggerClientEvent("Drones:UseDrone", source, {
					label = "Basit Drone 1",                      
					name = "drone",                               
					public = true,                                
					price = 10000,                                
					model = GetHashKey('ch_prop_casino_drone_02a'),       
					stats = {                        
						  speed   = 1.0,            
						  agility = 1.0,            
						  range   = 100.0,          
						  maxSpeed    = 2,             
						  maxAgility  = 2,
						  maxRange    = 200,
					},
					abilities = {
						infared     = true,  -- infared/heat-vision
						nightvision = true,  -- nightvision
						boost       = false,  -- boost
						tazer       = false,  -- tazer 
						explosive   = false,  -- explosion
					},
					restrictions = {}, 
				})
	
			end	
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa do <b>"..itemName("dronecontrol").."</b>.",5000,"Atenção")
		end
	end,

	["paymentterminal"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.AnimActive(source)
		vRPC.createObjects(source,'cellphone@', 'cellphone_text_read_base',"bzzz_prop_payment_terminal",49,57005,0.18, 0.01, 0.0, -54.0, 220.0, 43.0, false, false, false, false, 1, true)
	end,

	["creditcard"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local OtherSource = vRPC.ClosestPed(source,2)
		local OtherPassport = vRP.Passport(OtherSource)
		if vRPC.PlayingAnim(OtherSource,'cellphone@', 'cellphone_text_read_base') and vRP.ConsultItem(OtherPassport,"paymentterminal",1) then
			local Keyboard = vKEYBOARD.Secondary(OtherSource,"Valor","Descrição")
			if Keyboard then
				if vRP.Request(source,"Pagamento","Por favor, confirme se autoriza a transação de <b>R$"..parseFormat(Keyboard[1]).."</b> reais em seu cartão de crédito.") then 
					if vRP.PaymentCredit(Passport,parseInt(Keyboard[1]),Keyboard[2]) then
						vRP.GiveBank(OtherSource, parseInt(Keyboard[1]))
						vRP.GiveItem(Passport,"receipt-"..Passport.."-"..os.time().."-"..Keyboard[1].."-"..Keyboard[2],1,true)
						TriggerClientEvent("Notify",OtherSource,"verde","Compra aprovado.",5000)
					else
						TriggerClientEvent("Notify",source,"vermelho","<b>Cartão</b> recusado.",5000,"Liso")
						TriggerClientEvent("Notify",OtherSource,"vermelho","<b>Cartão</b> recusado.",5000,"Liso")
					end
				end
			end
		end
	end,

	["debitcard"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local OtherSource = vRPC.ClosestPed(source,2)
		local OtherPassport = vRP.Passport(OtherSource)
		if vRPC.PlayingAnim(OtherSource,'cellphone@', 'cellphone_text_read_base') and vRP.ConsultItem(OtherPassport,"paymentterminal",1) then
			local Keyboard = vKEYBOARD.Secondary(OtherSource,"Valor","Descrição")
			if Keyboard then
				if vRP.Request(source,"Pagamento","Por favor, confirme se autoriza a transação de <b>R$"..parseFormat(Keyboard[1]).."</b> reais em seu cartão de débito.") then 
					if vRP.PaymentBank(Passport,parseInt(Keyboard[1]),Keyboard[2]) then
						vRP.GiveBank(OtherSource, parseInt(Keyboard[1]))
						vRP.GiveItem(Passport,"receipt-"..Passport.."-"..os.time().."-"..Keyboard[1].."-"..Keyboard[2],1,true)
						TriggerClientEvent("Notify",OtherSource,"verde","Compra aprovado.",5000)
					else
						TriggerClientEvent("Notify",source,"vermelho","<b>Cartão</b> recusado.",5000,"Liso")
						TriggerClientEvent("Notify",OtherSource,"vermelho","<b>Cartão</b> recusado.",5000,"Liso")
					end
				end
			end
		end
	end,

	["scuba"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("hud:Scuba",source)
	end,

	["handcuff"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local ClosestPed = vRPC.ClosestPed(source,2)
			if ClosestPed and not vRP.IsEntityVisible(ClosestPed) then
				Player(source)["state"]["Cancel"] = true
				Player(source)["state"]["Buttons"] = true

				if Player(ClosestPed)["state"]["Handcuff"] then
					Player(ClosestPed)["state"]["Handcuff"] = false
					Player(ClosestPed)["state"]["Commands"] = false
					TriggerClientEvent("sounds:Private",source,"uncuff",0.5)
					TriggerClientEvent("sounds:Private",ClosestPed,"uncuff",0.5)

					vRPC.removeObjects(ClosestPed)
					vRPC.removeObjects(source)
				else
					if vRP.GetHealth(ClosestPed) > 100 then
						TriggerEvent("inventory:ServerCarry",source,Passport,ClosestPed,true)
						vRPC.playAnim(source,false,{"mp_arrest_paired","cop_p2_back_left"},false)
						vRPC.playAnim(ClosestPed,false,{"mp_arrest_paired","crook_p2_back_left"},false)

						SetTimeout(3500,function()
							TriggerEvent("inventory:ServerCarry",source,Passport)
							TriggerClientEvent("sounds:Private",source,"cuff",0.5)
							TriggerClientEvent("sounds:Private",ClosestPed,"cuff",0.5)

							vRPC.removeObjects(ClosestPed)
							vRPC.removeObjects(source)
						end)
					else
						TriggerClientEvent("sounds:Private",source,"cuff",0.5)
						TriggerClientEvent("sounds:Private",ClosestPed,"cuff",0.5)
					end

					Player(ClosestPed)["state"]["Handcuff"] = true
					Player(ClosestPed)["state"]["Commands"] = true
					TriggerClientEvent("inventory:Close",ClosestPed)
					TriggerClientEvent("radio:RadioClean",ClosestPed)
				end

				Player(source)["state"]["Cancel"] = false
				Player(source)["state"]["Buttons"] = false
			end
		end
	end,

	["hood"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local OtherSource = vRPC.ClosestPed(source,2)
		if OtherSource and Player(OtherSource)["state"]["Handcuff"] then
			TriggerClientEvent("hud:Hood",OtherSource)
			TriggerClientEvent("inventory:Close",OtherSource)
		end
	end,

	["skateboard"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport, Full, 1, true, Slot) then
			TriggerClientEvent('longboard:start', source)
		end
	end,

	["nintendo"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent('useNintendo', source)
	end,

	["rope"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if not Carry[Passport] then
				local OtherSource = vRPC.ClosestPed(source,2)
				local OtherPassport = vRP.Passport(OtherSource)
				if OtherSource and not Carry[OtherPassport] and vRP.GetHealth(OtherSource) <= 100 and not vRP.IsEntityVisible(OtherSource) then
					Carry[Passport] = OtherSource
					Player(source)["state"]["Carry"] = true
					Player(OtherSource)["state"]["Carry"] = true
					TriggerClientEvent("inventory:Carry",OtherSource,source,"Attach")
				end
			else
				if DoesPlayerExist(Carry[Passport]) then
					TriggerClientEvent("inventory:Carry",Carry[Passport],source,"Detach")
					Player(Carry[Passport])["state"]["Carry"] = false
				end

				Player(source)["state"]["Carry"] = false
				Carry[Passport] = nil
			end
		end
	end,

	["gift"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport, Full, 1, true, Slot) then
			TriggerClientEvent("inventory:Close", source)
			vINITIAL.Open(source)
		end
	end,

	["pager"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed and Player(ClosestPed)["state"]["Handcuff"] then
			local OtherPassport = vRP.Passport(ClosestPed)
			if OtherPassport then
				if vRP.HasService(OtherPassport,"Policia") then
					TriggerEvent("Wanted",source,Passport,600)
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.ServiceLeave(ClosestPed,OtherPassport,"Policia",true)
						TriggerClientEvent("Notify",source,"verde","Todas as comunicações foram retiradas.",5000,"Sucesso")
					end
				end
				if vRP.HasService(OtherPassport,"Hospital") then
					TriggerEvent("Wanted",source,Passport,600)
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.ServiceLeave(ClosestPed,OtherPassport,"Hospital",true)
						TriggerClientEvent("Notify",source,"verde","Todas as comunicações foram retiradas.",5000,"Sucesso")
					end
				end
			end
		end
	end
}