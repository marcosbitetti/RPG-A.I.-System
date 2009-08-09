--[[--------------------------------------------------------------------
	Clima
	
	Define condições climaticas
--]]---------------------------------------------------------------------

class "Clima" (Area)

--[[-----------------------
	Atributos básicos
--]]-----------------------
Clima.nome = 'clima'
Clima.tipo = 'genérico'
Clima.hora = {0,0} --sol como hora
Clima.temperatura = 6
Clima.condicaoAtmosferica = 1

--[[----------------------
	TABELAS
	Estas tabelas controlam as definições de estados
--]]----------------------
Clima.atmosferas = {
		'normal',
		'ensolarado',
		'nublado',
		'neblina',
		'chuvoso',
		'nevando',
		'nao_aplicavel'
	}
Clima.temperaturas = {
	{-50,"frio mortal"},
	{-10,"frio demais"},
	{0, "congelando" },
	{5, "frio" },
	{15, "fresco" },
	{23, "normal" },
	{30, "quente" },
	{38, "muito quente" },
	{47, "quente demais" },
	{85, "calor insuportavel" },
	{120, "infernal" }
	}
Clima.horarios = {
	{ {0,11}, "manhã" },
	{ {12,18}, "tarde" },
	{ {19,23}, "noite" }
	}

--[[-----------------------
	Metodos da classe
--]]-----------------------
function Clima:initialize()
	--self.ambiente = Ambiente()
end

--Retorna a condição geral do clima em formato string
function Clima:__tostring()
	return "São " .. self:getHora() .. ", " ..  self:getDescricao()
end

function Clima:getDescricao()
	return	"o tempo esta " .. self:getAtmosfera() ..
			" com temperatura " .. self:getTemperatura().descricao .. " (" .. self:getTemperatura().value .. "°)"
end

function Clima:getHora()
	strH = "horas"
	for i,v in ipairs(self.horarios) do
		if self.hora[1] >= v[1][1] and self.hora[1]<=v[1][2] then strH = v[2] end
	end
	return self.hora[1] .. " e " .. self.hora[2] .. " da " .. strH
end

function Clima:getAtmosfera()
	return self.atmosferas[self.condicaoAtmosferica]
end

function Clima:getTemperatura()
	return {
		descricao = self.temperaturas[self.temperatura][2],
		value = self.temperaturas[self.temperatura][1]
	}
end