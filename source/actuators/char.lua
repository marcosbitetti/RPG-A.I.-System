--[[--------------------------------------------------------------------

--]]-------------------------------------------------------------------

class "Char" (Actor)


--[[-----------------------
	Atributos
--]]-----------------------
Char.sexo = 'hetero'
Char.historia = 'desconhecida'


--[[-----------------------
	Construtor
--]]-----------------------
function Char:initialize()
	self.att = CharAtt()
	super( )
end

--[[-----------------------
	Retorna a informacao do objeto em formato string
	o opcional string retorna uma string amigavel
--]]-----------------------
function Char:__tostring()
	--[[
	return '{ char: { nome: "' .. self.nome
				..	', idade:' .. self.idade
				..	', classe:' .. self.classe
				..	', raca:' .. self.raca
	]]--
	-- Alternativo: o objeto retorna uma fala
	return	'Oi, meu nome é' .. self.nome
		..	' tenho ' .. self.idade .. ' anos. '
		..	'Sou um ' .. self.raca
		..	' e minha profissão é ' .. self.classe
		..	'. E no momento estou me sentindo ' .. self:getStatusString()
end

--[[-----------------------
	Returna uma string amigavel,
	descrevendo o status de vida do personagem
--]]-----------------------
function Char:getStatusString()
	if self.att.hp<20 then
		return 'muito mau! CHAME UM MÉDICO!!!'
	elseif self.att.hp<50 then
		return ' precisando descançar!'
	elseif self.att.hp<80 then
		return ' acho que me machuquei, mas da p continuar.'
	else return ' bem disposto, vamos lá!'
	end
end

--[[-----------------------
	FUNCOES P MANIPULAR CARACTERISTICAS
	TODO: Acrescentar modificadores
--]]-----------------------

--[[-----------------------
	Subscreve metodo -
	Faz o personagem perder HP
--]]-----------------------
function Char:__sub ( v )
	self.att.hp = self.att.hp - v
	if self.att.hp < 0 then -- morre
		self.vivo = false
	elseif self.att.hp < 10 then --incosciente
		self.consciente = false
	end
	return self
end

--[[-----------------------
	Subscreve metodo +
	Faz o personagem aumentar HP (healin / cura)
--]]-----------------------
function Char:__add ( v )
	if self.att.hp >= 0 then --recupera o desacordado, mas n rescucita o morto. Regra baseada em AD&D
		self.att.hp = self.att.hp + v
		if self.att.hp > 100 then -- apenas 100%
			self.att.hp = 100
		end
		if self.att.hp >= 10 then
			self.consciente = true
		end
	end
	return self
end

