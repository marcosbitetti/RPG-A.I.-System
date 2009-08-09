--[[--------------------------------------------------------------------

	Classe base para modificadores de atributos
	
--]]---------------------------------------------------------------------

class "Modificador"

--[[-----------------------
	Atributos básicos
--]]-----------------------
Modificador.id = 0				-- identificador
Modificador.nome = 'generico'	-- nome
Modificador.value = 0			-- valor da modificacao
Modificador.duration = nil		-- tempo de vida do modificador nil=eterno
Modificador.apicado = 0			-- hora em q foi apllicado
Modificador.efeito = nil		-- user data para efeito especial animado


--[[-----------------------
	Construtor
--]]-----------------------
function Modificador:initialize( valor )
	self.value = valor
	if valor == nil then self.value = 0 end
end

--[[-----------------------
	Funcao virtual, aplica o modificador
	define critérios e etc
--]]-----------------------
function Modificador:aplicar( ent )
	-- modelo
end

--[[-----------------------
	Retorna uma string
--]]-----------------------
function Modificador:__tostring()
	local str = self.nome .. ' ('
	if tonumber(self.value) >= 0 then
		str = str .. '+'
	end
	str = str .. self.value .. ')'
	return str
end
