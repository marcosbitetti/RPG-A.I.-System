--[[--------------------------------------------------------------------

	Modifica a força, pode ser positivo ou negativo.
	Serve como base para venenos e magias.
	
--]]---------------------------------------------------------------------

class "Forca" (Modificador)

--[[-----------------------
	Atributos básicos
--]]-----------------------
Forca.nome = 'Alteração de força'	-- nome
Forca.duration = nil				-- tempo de vida do modificador nil=eterno
Forca.efeito = nil					-- user data para efeito especial animado


--[[-----------------------
	Construtor
--]]-----------------------
function Forca:initialize( valor )
	super( valor )
end

--[[-----------------------
	Funcao virtual, aplica o modificador
	define critérios e etc
--]]-----------------------
function Forca:aplicar( ent )
	ent.forca = ent.forca + self.value
end
