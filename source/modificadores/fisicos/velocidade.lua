--[[--------------------------------------------------------------------

	Modifica a velocidade, pode ser positivo ou negativo.
	Serve como base para venenos e magias.
	
--]]---------------------------------------------------------------------

class "Velocidade" (Modificador)

--[[-----------------------
	Atributos b�sicos
--]]-----------------------
Velocidade.nome = 'Altera��o de Velocidade'	-- nome
Velocidade.duration = nil		-- tempo de vida do modificador nil=eterno
Velocidade.efeito = nil		-- user data para efeito especial animado


--[[-----------------------
	Construtor
--]]-----------------------
function Velocidade:initialize( valor )
	super( valor )
end

--[[-----------------------
	Funcao virtual, aplica o modificador
	define crit�rios e etc
--]]-----------------------
function Velocidade:aplicar( ent )
	ent.velocidade = ent.velocidade + self.value
end
