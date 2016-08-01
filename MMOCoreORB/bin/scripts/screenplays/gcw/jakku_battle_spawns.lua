local ObjectManager = require("managers.object.object_manager")

JakkuBattleScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	turrets = {
    { template = "object/installation/turret/turret_tower_large.iff", x = -5767.9, z = 55.5, y = 5575.1 },
    { template = "object/installation/turret/turret_tower_large.iff", x = -5809.5, z = 55, y = 5513.6 },
    { template = "object/installation/turret/turret_tower_large.iff", x = -5778.3, z = 53, y = 5443.3 },
    { template = "object/installation/turret/turret_tower_large.iff", x = -5691.4, z = 44, y = 5599.2 },
    { template = "object/installation/turret/turret_tower_large.iff", x = -5629.3, z = 41, y = 5550.7 },
    { template = "object/installation/turret/turret_tower_large.iff", x = -5737.9, z = 50, y = 5620.0 },
  },

}

registerScreenPlay("JakkuBattleScreenPlay", true)

function JakkuBattleScreenPlay:start()
	if (isZoneEnabled("jakku")) then
		self:spawnMobiles()
		self:spawnSceneObjects()
	end
end

function JakkuBattleScreenPlay:spawnSceneObjects()
  for i = 1, 6, 1 do
    local turretData = self.turrets[i]
    local pTurret = spawnSceneObject("jakku", turretData.template, turretData.x, turretData.z, turretData.y, 0, 0.707107, 0, 0.707107, 0)

    if pTurret ~= nil then
      local turret = TangibleObject(pTurret)
      turret:setFaction(FACTIONREBEL)
      turret:setPvpStatusBitmask(1)
    end

    writeData(SceneObject(pTurret):getObjectID() .. ":rebel_hideout:turret_index", i)
    createObserver(OBJECTDESTRUCTION, "JakkuBattleScreenPlay", "notifyTurretDestroyed", pTurret)
  end
  
end

function JakkuBattleScreenPlay:notifyTurretDestroyed(pTurret, pPlayer)
  ObjectManager.withSceneObject(pTurret, function(turret)
    local turretData = self.turrets[readData(turret:getObjectID() .. ":rebel_hideout:turret_index")]
    turret:destroyObjectFromWorld()
    createEvent(1800000, "JakkuBattleScreenPlay", "respawnTurret", pTurret, "")
  end)
  CreatureObject(pPlayer):clearCombatState(1)
  return 0
end

function JakkuBattleScreenPlay:respawnTurret(pTurret)
  if pTurret == nil then return end

  TangibleObject(pTurret):setConditionDamage(0, false)
  local turretData = self.turrets[readData(SceneObject(pTurret):getObjectID() .. ":rebel_hideout:turret_index")]
  local pZone = getZoneByName("jakku")

  if pZone == nil then return end

  SceneObject(pZone):transferObject(pTurret, -1, true)
end

function JakkuBattleScreenPlay:spawnMobiles()
--gladiator arena
  spawnMobile("jakku", "punishment_acklay", 1, 4454, 7.0, -5171, -84, 0)
  
--  START:  PvP Zone
  -- Republic Encampment (exterior)
  local pMobile = spawnMobile("jakku", "at_xt", 60, -5763, 45, 5505, -116, 0)
        self:setMoodString(pMobile, "neutral")
        AiAgent(pMobile):setAiTemplate("idlewander")
        
  pMobile = spawnMobile("jakku", "at_xt", 60, -5764, 56, 5606, -40, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5755, 52, 5552, -60, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5790, 56, 5535, -40, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5750, 50, 5531, -60, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5709, 46, 5531, -43, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5725, 47, 5508, -54, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5715, 47, 5622, 13, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5660, 42, 5579, 39, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5591, 39.5, 5540, 24, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5746, 48.8, 5394, -95, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  pMobile = spawnMobile("jakku", "at_xt", 60, -5827.6, 54.4, 5493.1, -88, 0)
  self:setMoodString(pMobile, "neutral")
  AiAgent(pMobile):setAiTemplate("idlewander")
  
  spawnMobile("jakku", "fbase_rebel_heavy_trooper_extreme", 60, -5709.5, 48, 5503, -42, 0)
  spawnMobile("jakku", "fbase_rebel_heavy_trooper_extreme", 60, -5705, 48, 5507, -42, 0)
  spawnMobile("jakku", "fbase_rebel_commando_hard", 60, -5783, 58, 5549, -64, 0)
  
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5826, 56.3, 5501, -50, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5800, 55.8, 5530, -50, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5787.7, 54.7, 5544.8, -65, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5791.2, 55, 5555.6, -65, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5778, 56, 5567.7, -78, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5769, 56, 5588.5, -73, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5748.6, 54.1, 5621.7, -11, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5729.5, 50.1, 5625.1, 20, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5703.8, 45.2, 5615.5, 24, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5671.9, 42.3, 5593.6, 27, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5644.3, 41.3, 5567.9, 29, 0)
  spawnMobile("jakku", "fbase_rebel_soldier_hard", 60, -5606.3, 39.3, 5557.3, 39, 0)
  
  

end

