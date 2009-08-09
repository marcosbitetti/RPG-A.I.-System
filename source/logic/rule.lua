--[[--------------------------------------------------------------------
	Rule
	
	Rule é um objeto de conexão entre um ou + sensores ou rules a uma action.
	Rule tem uma saida binária:
		trueFunc
		falseFunc
	
--]]---------------------------------------------------------------------

class "Rule"

--[[-----------------------
	Atributos básicos
--]]-----------------------
Rule.nome = 'regra'

--[[-----------------------
	Atributos estaticos
--]]-----------------------
Rule.OR = 1
Rule.AND = 2
Rule.XOR = 3
Rule.NOT = 4

function Rule:initialize()
	
end
