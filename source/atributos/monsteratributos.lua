--[[--------------------------------------------------------------------
	CharAtt -> Att
	
	Classe de manuseio de atributos de personagem.
	Seu sistema interno permite gerenciamento do personagem,
	por exemplo: Se a HP for menor q zero, ela cria automaticamente
	um Modificador de suspensção de movimentos!
--]]---------------------------------------------------------------------


class "MonsterAtt" (Att)

--[[-----------------------
	Atributos
--]]-----------------------
MonsterAtt.xp = 0
MonsterAtt.hp = 100
MonsterAtt.ar = 100

--[[-----------------------
	Construtor
--]]-----------------------
function MonsterAtt:initialize()
	super()
end


