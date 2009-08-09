--[[--------------------------------------------------------------------

	Exemplo de inicialização do sistema.
	
	Requer globals.lua que chama todas as dependências.
	
	Esta implantação é apenas um exemplo, e esta sugeita a
	mudanças conforma evolução do projeto
--]]---------------------------------------------------------------------

require("globals")

-- Exemplo de uso

-- Cria um char ( personagem jogador)
c = Char()

-- causa 21 de dano!!! ( recurso em teste, n sei se ira ser usado realmente)
c = c - 21

-- exibe atributos
--print( c.att )

-- cria modificadores de atributos
af = Forca(10)
c.att:addModificador( af )
av = Velocidade(-5)
c.att:addModificador( av )

--exibe atributos
--print ( c.att )

class "AEIOU"

function AEIOU:initialize()

end

function AEIOU:nada()
	print ("AEIOU")
end

a = 19
mapa = {
	{1,1,1,1},
	{1,2,1,2},
	{1,1,3,1},
	{1,2,1,2}
}

areas = {
	Area(),
	Area(),
	Area()
}

--print ( areas[mapa[1][1]] )

clima = Clima()

print( clima )
