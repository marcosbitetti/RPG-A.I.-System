--[[--------------------------------------------------------------------
	Classe Monster, define a classe base e funcional para um monstro.
	Ela cont�m os atributos b�sios de I.A. para um monstro interagir
	com o jogador e com o cen�rio.
--]]-------------------------------------------------------------------


class "Monster" (Actor)


--[[-----------------------
	Atributos
--]]-----------------------
Monster.sexo = 'hetero'


--[[-----------------------
	Construtor
--]]-----------------------
function Monster:initialize()
	self.att = MonsterAtt()
	super()
end

--[[-----------------------
	Retorna a informacao do objeto
	em formato string o opcional
	string retorna uma string amigavel
--]]-----------------------
function Monster:__tostring()
	--[[
	return '{ char: { nome: "' .. self.nome
				..	', idade:' .. self.idade
				..	', classe:' .. self.classe
				..	', raca:' .. self.raca
	]]--
	-- Alternativo: o objeto retorna uma fala
	return	'Oi, meu nome �' .. self.nome
		..	' tenho ' .. self.idade .. ' anos. '
		..	'Sou um ' .. self.raca
		..	' e minha profiss�o � ' .. self.classe
		..	'. E no momento estou me sentindo ' .. self:getStatusString()
end

--[[-----------------------
	Returna uma string amigavel,
	descrevendo o status de vida do personagem
--]]-----------------------
function Monster:getStatusString()
	if self.att.hp<20 then
		return 'muito mau! CHAME UM M�DICO!!!'
	elseif self.att.hp<50 then
		return ' precisando descan�ar!'
	elseif self.att.hp<80 then
		return ' acho que me machuquei, mas da p continuar.'
	else return ' bem disposto, vamos l�!'
	end
end

--[[-----------------------
-- FUNCOES P MANIPULAR CARACTERISTICAS
--	TODO: Acrescentar modificadores
--]]-----------------------

--[[-----------------------
	Subscreve metodo -
	Faz o personagem perder HP
--]]-----------------------
function Monster:__sub ( v )
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
function Monster:__add ( v )
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


