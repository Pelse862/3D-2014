Wall1 = {
	Properties = {
		object_MyModel = "GameSDK/Objects/props/furniture/beds/bed_wooden.cgf",	-- byt till rätt
	},
};

function Wall1:OnInit()
	self:OnReset();
end
 
function Wall1:OnReset()
	if (self.Properties.object_MyModel ~= "") then
		self:LoadObject(0, self.Properties.object_MyModel);
	end
	self:SetMaterial("Materials/generic/wood/plywood_dark.mtl"); --  byt till rätt
end
 
function Wall1:OnPropertyChange()
	self:OnReset();
end
 
function Wall1:OnUsed(user, idx)
	
	-- pelles walljump
end