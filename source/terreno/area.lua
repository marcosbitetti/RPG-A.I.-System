--[[--------------------------------------------------------------------
	Area
	
	Area é o menor fragmento de mapa.
	Ah ele se aplicam condicionais, modificadores, rules, danos e magias.

	Um ex.:
	Condicional: Sensor.<Distância> == 1 -- em cima do tile
		então
			chamar armadilha:
		fimentão
	Armadilha é um agregador de dano

	Este componente é  qualquer área q possa ser atribuida num mapa qualquer,
	independente do seu tipo
--]]---------------------------------------------------------------------

class "Area"

--[[-----------------------
	Atributos básicos
--]]-----------------------

Area.childs = {} -- areas filhas
Area.sensors = {} -- lista sensores
Area.objects = {} -- lista objetos
Area.actors = {} -- lista de atores na area


function Area:initialize()

end

