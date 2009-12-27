--[[--------------------------------------------------------------------
	Boid

	Classe base para passaros
	baseado no documento http://www.red3d.com/cwr/boids/
--]]---------------------------------------------------------------------

class "Boid" (Actor)


Boid.pares = {}
Boid.classe="npc"
Boid.raca="ave"

--[[-----------------------
	Construtor
--]]-----------------------
function Boid:initialize()
end

--[[-----------------------
	Passo de interação
--]]-----------------------
function Boid:tick()
	--print(self.raca)
end
