include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*5)
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply	
	self.Sounds=table.Copy(sndt)
	ent:SetBodygroup(1,1)
	ent:SetBodygroup(2,1)
	return ent
end

function ENT:PhysicsUpdate(ph)
	self:base("wac_hc_base").PhysicsUpdate(self,ph)
	
	if IsValid(ph) and not self.disabled then
		if ph:GetVelocity():Length() > 700 then
			self:SetBodygroup(1,0)
			self:SetBodygroup(2,0)
			self:SetBodygroup(3,1)
			self:SetBodygroup(4,1)
			self:SetBodygroup(5,1)
		else
			self:SetBodygroup(1,1)
			self:SetBodygroup(2,1)
			self:SetBodygroup(3,0)
			self:SetBodygroup(4,0)
			self:SetBodygroup(5,0)
		end
	end
end
