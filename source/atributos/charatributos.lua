--[[--------------------------------------------------------------------
	CharAtt -> Att
	
	Classe de manuseio de atributos de personagem.
	Seu sistema interno permite gerenciamento do personagem,
	por exemplo: Se a HP for menor q zero, ela cria automaticamente
	um Modificador de suspensção de movimentos!
--]]---------------------------------------------------------------------


class "CharAtt" (Att)


--[[-----------------------
	Atributos básicos
--]]-----------------------
CharAtt.xp = 0
CharAtt.hp = 100
CharAtt.ar = 100

--[[-----------------------
	Construtor
--]]-----------------------
function CharAtt:initialize()
	super()
end


