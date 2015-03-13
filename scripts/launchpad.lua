launchpad =
{
	Properties = 
	{
		object_Model = "GameSDK/myfiles/objects/walls/jp_2m/jp_2m.cgf"; --lägg till en modell
		iImpulsePower = 500, --kraften som man skjuts iväg med
		
		
		Physics = {
			bRigidBody = 1,
			bRigidBodyActive = 0,
			bResting = 0,
			Density = 0,
			Mass = 0,
			
		},
		
	},

};

function launchpad:IsUsable(user)
	return 2;
end



function launchpad:OnCollision(hitData)
	ColliderPlayer = System.GetEntityByName("Dude");
	--Log("message1");
	--local ColliderAI = System.GetEntityByName("AI");
	--local LocAngles = collider:GetLocalAngels();
	angleOut = ColliderPlayer:GetAngles();
	z = 100;
	y = math.cos(angleOut.z);
	x = math.sin(angleOut.z);
	
	
	
	if(hitData.target == ColliderPlayer) then
			ColliderPlayer:AddImpulse(-1, ColliderPlayer:GetCenterOfMassPos(), {-1*x,y,z},self.Properties.iImpulsePower,1);
	end
	
	
end


function launchpad:OnInit()
	self:OnReset();
end

function launchpad:OnReset()
	self:SetName("MyLaunchpad");
	if(self.Properties.object_Model ~= "") then	
		self:LoadObject(0, self.Properties.object_Model);
	end
	self:SetMaterial("GameSDK/myfiles/objects/walls/jp_2m/jp_2m.mtl"); --  byt till rätt
	self:PhysicalizeThis();
end

function launchpad:OnPropertyChange()
	self:OnReset();
end

function launchpad:PhysicalizeThis()
	
	EntityCommon.PhysicalizeRigid( self, 0 ,self.Properties.Physics, 1);
end


