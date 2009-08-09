--[[--------------------------------------------------------------------
	Mapa
	
	Agregador de Area.
	Mapa emcapsula um ambiente de jogo completo. Com suas varias Areas.
	Mapa gerencia a interface entre a logica e o host.
--]]---------------------------------------------------------------------

class "Mapa" (Area)

--[[-----------------------
	Atributos básicos
--]]-----------------------
Mapa.nome = 'mapa'
Mapa.tipo = 'genérico'
Mapa.ambiente = nil
Mapa.hostData = nil -- userdata para a posicao 


function Mapa:initialize()
	self.ambiente = Ambiente()
end
