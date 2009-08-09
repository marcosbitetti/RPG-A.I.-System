--[[--------------------------------------------------------------------
	Actor
	
	Actor pode ser qualquer coisa na cena. Desde um personagem � um objeto
	Cont�m atributos gen�ricos que podem pertencer tanto a personagens, NPCs,
	monstros e itens.
--]]-------------------------------------------------------------------


class "Actor"


--[[-----------------------
	Atributos para caracterizar
	um ser vivo inteligente.
	TODO: Algumas dessas propriedades
	dever�o ser substituidas, de
	strings para uma Classe pr�pria
	que afete os modificadores.
	Ex.: raca -> Classe Raca:
		Modifica atributos e
		propriedades da propria
		classe. Como forca p Orcs
		ou auzencia de genero p
		construtos
--]]-----------------------
Actor.nome = 'noname'
Actor.genero = 'Masculino'
Actor.idade = 16
Actor.classe = 'desocupado'
Actor.raca = 'humana'
Actor.vivo = true
Actor.historia = 'desconhecida'

--atributos
Actor.att = nil --modificado din�micamente

--[[-----------------------
	Construtor
--]]-----------------------
function Actor:initialize()
	if self.att == nil then self.att = Att() end
end
