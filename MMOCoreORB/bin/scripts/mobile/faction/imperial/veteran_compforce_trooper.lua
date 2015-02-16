veteran_compforce_trooper = Creature:new {
	objectName = "@mob/creature_names:veteran_compforce_trooper",
	socialGroup = "imperial",
	faction = "imperial",
	level = 25,
	chanceHit = 0.35,
	damageMin = 230,
	damageMax = 240,
	baseXp = 2637,
	baseHAM = 6800,
	baseHAMmax = 8300,
	armor = 0,
	resists = {20,20,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_stormtrooper_groupleader_m.iff"},
	lootGroups = {},
	weapons = {"imperial_weapons_heavy"},
	reactionStf = "@npc_reaction/military",
	attacks = merge(riflemanmaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(veteran_compforce_trooper, "veteran_compforce_trooper")
