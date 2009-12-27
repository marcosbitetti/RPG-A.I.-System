--[[--------------------------------------------------------------------

		GLOBALS
	Carrega todas as dependências e includes do projeto

--]]---------------------------------------------------------------------

--[[---------------------
	Nucleo e bibliotecas de terceiros
--]]---------------------
require('core/Json')
require('core/class')

--[[---------------------
	Atriutos
--]]---------------------
require('atributos/atributos')
require('atributos/charatributos')
require('atributos/monsteratributos')

--[[---------------------
	Modificadores
--]]---------------------
require('modificadores/modificador')
require('modificadores/fisicos/forca')
require('modificadores/fisicos/velocidade')

--[[---------------------
	Atores
--]]---------------------
require('actuators/actor')
require('actuators/char')


--[[---------------------
	Terreno
--]]---------------------
require('terreno/area')
require('terreno/mapa')
require('terreno/ambiente')
require('terreno/clima')

--[[---------------------
	Logica
--]]---------------------
require('logic/rule')


--[[---------------------	Personagens/Animais
--]]---------------------
require('runtime/personagens/animals/boid')




