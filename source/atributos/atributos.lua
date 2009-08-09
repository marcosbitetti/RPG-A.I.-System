--[[--------------------------------------------------------------------
	Att
	
	Classe de atributos básicos, para jogabilidade.
	Comtém, a funcionalidade de um sistema de RPG genérico.
	As regras foram pensadas para atender um mundo fisico dentro
	de um ambiente computacional, mas limitando-se a trabalhar
	com os valores de forma a abstrair a meio, e manter uma relação
	mais próxima ao entendimento humano de um RPG de mesa.
	
	A capacidade de receber uma metatabela (array) de modificadores
	e a interagir com classes Rules é o ponto principal que vai permitir
	as ações. (espero)
--]]---------------------------------------------------------------------

class "Att"

--[[-----------------------
	Atributos básicos
--]]-----------------------

Att.forca = 15
Att.inteligencia = 20
Att.psy = 1
Att.velocidade = 10
Att.carisma = 15
Att.pressenca = 1
Att.ataque = 2
Att.defesa = 4


--[[-----------------------
	privadas
	Lista de variaveis internas
--]]-----------------------

Att.modId = 0
Att.modificadores = nil

--[[-----------------------
	privadas, estas armazemam
	os valores reais dos atributos
--]]-----------------------

Att.__forca = 15
Att.__inteligencia = 20
Att.__psy = 1
Att.__velocidade = 10
Att.__carisma = 15
Att.__pressenca = 1
Att.__ataque = 2
Att.__defesa = 4

--[[-----------------------
	Construtor
--]]-----------------------
function Att:initialize()
	--inicializa valores
	self.modificadores  = {}
end

--[[-----------------------
	Retorna uma string jSon
	sobre os atributos
--]]-----------------------
function Att:__tostring()
	return "{ atributos: [ forca: " .. self.forca
					..	", inteligencia: " .. self.inteligencia
					..	", velocidade: " .. self.velocidade
					..	", carisma: " .. self.carisma
					..	", pressenca: " .. self.pressenca
					..	", ataque: " .. self.ataque
					..	", defesa: " .. self.defesa
					..	", psy: " .. self.psy
					..	" ] }"
end

--[[-----------------------
	GERENCIA MODIFICADORES
--]]-----------------------

-- Adiciona modificador à pilha
function Att:addModificador( md )
	self.modificadores[ self.modId ] = md
	md.id = self.modId
	self.modId = self.modId + 1
	
	self:calculaModificadores()
end

-- Remove modificador da pilha
function Att:removeModificador( md )
	self:calculaModificadores()
end

-- retorma uma table com a lista corrente
function Att:getModificadorList()
	local list = '{list:['
	table.foreach( self.modificadores,
		function ( i, md )
			--md:aplicar( md )
			list = list .. "'" .. md .. "',"
		end
	)
	list = list .. "'']}"
	return list
end

--[[-----------------------
	Calcula valores de atributos
	aplicando os modificadores
--]]-----------------------

function Att:calculaModificadores()
	-- reseta atributos
	self.forca = self.__forca
	self.inteligencia = self.__inteligencia
	self.psy = self.__psy
	self.velocidade = self.__velocidade
	self.carisma = self.__carisma
	self.pressenca = self.__pressenca
	self.ataque = self.__ataque
	self.defesa = self.__defesa
	table.foreach( self.modificadores,
		function ( i, md )
			md:aplicar( self )
		end
	)
end

--[[-----------------------
	Gerencia Atributos
--]]-----------------------

-- retorna um atributo apartir do nome
function Att:getAtributo( nome )
	return self[ nome ]
end

-- seta um atributo apartir do nome
function Att:setAtributo( nome, valor )
	if not (self[ "__"..nome ] == nil) then
		self[ "__"..nome ] = valor
	end
	self:calculaModificadores()
end

-- gets de atributos locais
function Att:getForca()
	return self.forca
end


--[[ sets de atributos locais ]]--
