-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
	-- Staff
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { 
			[1] = "Administrador",
			[2] = "Moderador",
			[3] = "Suporte" 
		},
		["Service"] = {}
	},
	-- Buff Org
	["Buff"] = {
		["Parent"] = {
			["Buff"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Salary"] = { 2250 },
		["Service"] = {}
	},
	-- Vip
	["Premium"] = {
		["Parent"] = {
			["Bronze"] = true,
			["Prata"] = true,
			["Ouro"] = true,
			["Diamante"] = true,
			["Patrocinador"] = true,
		},
		["Hierarchy"] = {},
		["Salary"] = {},
		["Service"] = {}
	},
	["Bronze"] = {
		["Parent"] = {
			["Bronze"] = true
		},
		["Hierarchy"] = { "Bronze" },
		["Salary"] = { 500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Prata"] = {
		["Parent"] = {
			["Prata"] = true
		},
		["Hierarchy"] = { "Prata" },
		["Salary"] = { 1000 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Ouro"] = {
		["Parent"] = {
			["Ouro"] = true
		},
		["Hierarchy"] = { "Ouro" },
		["Salary"] = { 1500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Diamante"] = {
		["Parent"] = {
			["Diamante"] = true
		},
		["Hierarchy"] = { "Diamante" },
		["Salary"] = { 2000 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	["Patrocinador"] = {
		["Parent"] = {
			["Patrocinador"] = true
		},
		["Hierarchy"] = { "Patrocinador" },
		["Salary"] = { 2500 },
		["Service"] = {},
		["Type"] = "Premium",
	},
	-- Policia
	["Policia"] = {
		["Parent"] = {
			["Pcesp"] = true,
			["Pmesp"] = true,
			["1BPChq"] = true,
			["Prf"] = true,
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	},
	["Pcesp"] = {
		["Name"] = "Policia Civil",
		["Parent"] = {
			["Pcesp"] = true,
		},
		["Hierarchy"] = {  
			[1] = "Delegado", 
			[2] = "Investigador", 
			[3] = "Escrivão", 
			[4] = "Perito Criminal", 
			[5] = "Médico Legista", 
			[6] = "Auxiliar de Papiloscopista",
		},
		["Salary"] = { 
			[1] = 13000, 
			[2] = 10500, 
			[3] = 8000, 
			[4] = 7800, 
			[5] = 7000, 
			[6] = 6750, 
		},
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["Pmesp"] = {
		["Name"] = "Policia Militar",
		["Parent"] = {
			["Pmesp"] = true,
		},
		["Hierarchy"] = { [1] = "Comandante Geral", [2] = "Coronel", [3] = "Tenente Coronel", [4] = "Major", "Capitão", [5] = "Primeiro Tenente", [6] = "Segundo Tenente", [7] = "Aspirante a Oficial", [8] = "Terceiro Aluno", [9] = "Segundo Aluno", [10] = "Primeiro Aluno", [11] = "Aluno Csta", [12] = "Subtenente", [13] = "Primeiro Sargento", [14] = "Segundo Sargento", [15] = "Terceiro Sargento", [16] = "Aluno Sargento", [17] = "Cabo", [19] = "Soldado" },
		["Salary"] = { [1] = 9900, [2] = 8200, [3] = 7600, [4] = 7200, [5] = 6800, [6] = 6300, [7] = 4300, [8] = 4300, [9] = 3500, [10] = 4300, [11] = 4150, [12] = 3500, [13] = 3000, [14] = 2700,[15] = 2500, [16] = 2350, [17] = 2250, [18] = 2200, [19] = 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["1BPChq"] = {
		["Name"] = "Batalhão Rota",
		["Parent"] = {
			["1BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { [1] = 9900, [2] = 8200, [3] = 7600, [4] = 7200, [5] = 6800, [6] = 6300, [7] = 4300, [8] = 4300, [9] = 3500, [10] = 4300, [11] = 4150, [12] = 3500, [13] = 3000, [14] = 2700,[15] = 2500, [16] = 2350, [17] = 2250, [18] = 2200, [19] = 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["2BPChq"] = {
		["Name"] = "Batalhão Anchieta",
		["Parent"] = {
			["2BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 13000, 10500, 8000, 7800, 7000, 6750, 6000, 5680, 5000, 4300, 4150, 3500, 2800, 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["3BPChq"] = {
		["Name"] = "Batalhão Humaitá",
		["Parent"] = {
			["3BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 13000, 10500, 8000, 7800, 7000, 6750, 6000, 5680, 5000, 4300, 4150, 3500, 2800, 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["4BPChq"] = {
		["Name"] = "Batalhão de Operações Especiais",
		["Parent"] = {
			["4BPChq"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 13000, 10500, 8000, 7800, 7000, 6750, 6000, 5680, 5000, 4300, 4150, 3500, 2800, 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true,
		["Pmesp"] = true
	},
	["Baep"] = {
		["Name"] = "Batalhão de Ações Especiais de Polícia",
		["Parent"] = {
			["Baep"] = true,
		},
		["Hierarchy"] = { "Coronel", "Tenente Coronel", "Major", "Capitão", "Primeiro Tenente", "Segundo Tenente", "Subtenente", "Primeiro Sargento", "Segundo Sargento", "Terceiro Sargento", "Cabo", "Soldado" },
		["Salary"] = { 13000, 10500, 8000, 7800, 7000, 6750, 6000, 5680, 5000, 4300, 4150, 3500, 2800, 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true,
		["Pmesp"] = true
	},







	["Prf"] = {
		["Name"] = "Policia Rodoviaria Federal",
		["Parent"] = {
			["Prf"] = true,
		},
		["Hierarchy"] = { [1] = "Comandante Geral", [2] = "Coronel", [3] = "Tenente Coronel", [4] = "Major", "Capitão", [5] = "Primeiro Tenente", [6] = "Segundo Tenente", [7] = "Aspirante a Oficial", [8] = "Terceiro Aluno", [9] = "Segundo Aluno", [10] = "Primeiro Aluno", [11] = "Aluno Csta", [12] = "Subtenente", [13] = "Primeiro Sargento", [14] = "Segundo Sargento", [15] = "Terceiro Sargento", [16] = "Aluno Sargento", [17] = "Cabo", [19] = "Soldado" },
		["Salary"] = { [1] = 9900, [2] = 8200, [3] = 7600, [4] = 7200, [5] = 6800, [6] = 6300, [7] = 4300, [8] = 4300, [9] = 3500, [10] = 4300, [11] = 4150, [12] = 3500, [13] = 3000, [14] = 2700,[15] = 2500, [16] = 2350, [17] = 2250, [18] = 2200, [19] = 2000 },
		["Service"] = {},
		["Type"] = "Policia",
		["Client"] = true
	},
	["Exercito"] = {
		["Name"] = "Forças Armadas",
		["Parent"] = {
			["Exercito"] = true,
		},
		["Hierarchy"] = { 
			"General de Exército",
			"General de Divisão",
			"General de Brigada",
			"Coronel",
			"Tenente Coronel",
			"Major",
			"Capitão",
			"Primeiro Tenente",
			"Segundo Tenente",
			"Aspirante à Oficial",
			"Sub Tenente",
			"Primeiro Sargento",
			"Segundo Sargento",
			"Terceiro Sargento",
			"Cabo",
			"Soldado",
			"Recruta"	
		},
		["Salary"] = {  13471, 12912, 12490, 11451, 11250, 11088, 9135, 8245, 7490, 6993, 6169, 5483, 4770, 3825, 2627, 1852, 956 },
		["Service"] = {},
		["Type"] = "Gov",
		["Client"] = true
	},
	-- Hospital
	["Hospital"] = {
		["Parent"] = {
			["Hospital"] = true
		},
		["Hierarchy"] = { "Diretor","Medico","Paramedico","Enfermeiro" },
		["Salary"] = { 2500,2250,2000 },
		["Service"] = {},
		["Type"] = "Hospital"
	},
	-- Mecanica
	["AutoSport"] = {
		["Parent"] = {
			["AutoSport"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Mecanica"
	},
	["EastCustoms"] = {
		["Parent"] = {
			["EastCustoms"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Mecanica"
	},
	-- FastFood
	["McDonalds"] = {
		["Parent"] = {
			["McDonalds"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Funcionário" },
		["Service"] = {},
		["Type"] = "FastFood"
	},
	-- Armamento
	["Hotel"] = {
		["Parent"] = {
			["Hotel"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Armamento"
	},
	["Fazenda"] = {
		["Parent"] = {
			["Fazenda"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Armamento"
	},
	-- Municao
	["Vinhedo"] = {
		["Parent"] = {
			["Vinhedo"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Municao"
	},
	["Playboy"] = {
		["Parent"] = {
			["Playboy"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Municao"
	},
	-- Contrabando
	["Motoclub"] = {
		["Parent"] = {
			["Motoclub"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Contrabando"
	},
	["Porto"] = {
		["Parent"] = {
			["Porto"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Contrabando"
	},
	-- Lavagem
	["Vanilla"] = {
		["Parent"] = {
			["Vanilla"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Lavagem"
	},
	["Bahamas"] = {
		["Parent"] = {
			["Bahamas"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Lavagem"
	},
	-- Desmanche
	["Harmony"] = {
		["Parent"] = {
			["Harmony"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Desmanche"
	},
	["Beekers"] = {
		["Parent"] = {
			["Beekers"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Desmanche"
	},

	-- Desmanche
	["China"] = {
		["Parent"] = {
			["China"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Escocia"] = {
		["Parent"] = {
			["ESCOCIA"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Turquia"] = {
		["Parent"] = {
			["Turquia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Croacia"] = {
		["Parent"] = {
			["Croacia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Franca"] = {
		["Parent"] = {
			["Franca"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Israel"] = {
		["Parent"] = {
			["Israel"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Brasilandia"] = {
		["Parent"] = {
			["Brasilandia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Suecia"] = {
		["Parent"] = {
			["Suecia"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
	["Pcc"] = {
		["Parent"] = {
			["Pcc"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Service"] = {},
		["Type"] = "Favela"
	},
}