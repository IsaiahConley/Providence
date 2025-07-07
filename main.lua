-- Providence - Character Mod

local PATH = modloader.getModPath("MyShadowNinja")

-- Unique namespace identifier (you can rename "MyShadowNinja" if you'd like to match Providence)
local BULUUARK = "MyShadowNinja"

-- === Load Core Sprites ===
local sprites = {
    idle        = Resources.sprite_load(BULUUARK, "providence_idle", path.combine(PATH, "Sprites", "IdleSheet.png"), 0, 0, 48),
    walk        = Resources.sprite_load(BULUUARK, "providence_walk", path.combine(PATH, "Sprites", "WalkSheet.png"), 0, 0, 66),
    jump        = Resources.sprite_load(BULUUARK, "providence_jump", path.combine(PATH, "Sprites", "Jumprise.png"), 0, 0, 69),
    jump_peak   = Resources.sprite_load(BULUUARK, "providence_jump_peak", path.combine(PATH, "Sprites", "JumpPeak.png"), 0, 0, 0),
    fall        = Resources.sprite_load(BULUUARK, "providence_fall", path.combine(PATH, "Sprites", "JumpFall.png"), 0, 0, 69),
    climb       = Resources.sprite_load(BULUUARK, "providence_climb", path.combine(PATH, "Sprites", "Climbsheet.png"), 0, 0, 47),
    climb_hurt  = Resources.sprite_load(BULUUARK, "providence_climb_hurt", path.combine(PATH, "Sprites", "Climbsheet.png"), 0, 0, 47),
    death       = Resources.sprite_load(BULUUARK, "providence_death", path.combine(PATH, "Sprites", "DieSheet.png"), 0, 0, 60),
    decoy       = Resources.sprite_load(BULUUARK, "providence_decoy", path.combine(PATH, "Sprites", "IdleSheet.png"), 0, 0, 48),
}

-- === Load Attack + Skill Sprites ===
local spr_atk1        = Resources.sprite_load(BULUUARK, "providence_atk1", path.combine(PATH, "Sprites", "Primary1.png"), 5, 48, 69)
local spr_atk2        = Resources.sprite_load(BULUUARK, "providence_atk2", path.combine(PATH, "Sprites", "Primary2.png"), 5, 48, 69)
local spr_atk3        = Resources.sprite_load(BULUUARK, "providence_atk3", path.combine(PATH, "Sprites", "Primary3.png"), 5, 48, 69)
local spr_float       = Resources.sprite_load(BULUUARK, "providence_float", path.combine(PATH, "Sprites", "Utility.png"), 6, 48, 69)
local spr_throw       = Resources.sprite_load(BULUUARK, "providence_throw", path.combine(PATH, "Sprites", "Secondary.png"), 7, 48, 69)
local spr_orb         = Resources.sprite_load(BULUUARK, "providence_orb", path.combine(PATH, "Sprites", "SecondaryProjectile.png"), 3, 6, 6, 0.25, 2, 2, 9, 9)
local spr_slam        = Resources.sprite_load(BULUUARK, "providence_slam", path.combine(PATH, "Sprites", "Utility2.png"), 4, 6, 6, 0.25, 2, 2, 9, 9)
local spr_shadowf     = Resources.sprite_load(BULUUARK, "providence_shadowf", path.combine(PATH, "Sprites", "Shadow.png"), 15, 48, 69)
local spr_shadows     = Resources.sprite_load(BULUUARK, "providence_shadows", path.combine(PATH, "Sprites", "Shadow2.png"), 15, 48, 69)
local spr_conjour     = Resources.sprite_load(BULUUARK, "providence_conjour", path.combine(PATH, "Sprites", "Special.png"), 15, 48, 69)
local spr_target      = Resources.sprite_load(BULUUARK, "providence_target", path.combine(PATH, "Sprites", "SpecialProjectile.png"), 15, 48, 69)

-- === Worm Alt Sprites ===
local spr_wormhead    = Resources.sprite_load(BULUUARK, "providence_wormhead", path.combine(PATH, "Sprites", "wormhead.png"), 15, 48, 69)
local spr_wormarmour  = Resources.sprite_load(BULUUARK, "providence_wormarmour", path.combine(PATH, "Sprites", "wormarmour.png"), 15, 48, 69)
local spr_wormbelt    = Resources.sprite_load(BULUUARK, "providence_wormbelt", path.combine(PATH, "Sprites", "wormbelt.png"), 15, 48, 69)
local spr_wormnaked   = Resources.sprite_load(BULUUARK, "providence_wormnaked", path.combine(PATH, "Sprites", "wormnaked.png"), 15, 48, 69)
local spr_wormtail    = Resources.sprite_load(BULUUARK, "providence_wormtail", path.combine(PATH, "Sprites", "wormtail.png"), 15, 48, 69)

-- === Portraits and UI ===
local spr_skills          = Resources.sprite_load(BULUUARK, "providence_skills", path.combine(PATH, "Sprites", "Abilities.png"), 4, 0, 0)
local spr_portrait        = Resources.sprite_load(BULUUARK, "providence_portrait", path.combine(PATH, "Sprites", "Portrait.png"))
local spr_portrait_cropped= Resources.sprite_load(BULUUARK, "providence_portrait_cropped", path.combine(PATH, "Sprites", "PortraitCropped.png"))
local spr_portrait_small  = Resources.sprite_load(BULUUARK, "providence_portrait_small", path.combine(PATH, "Sprites", "SmallPortrait.png"))
local spr_loadout         = Resources.sprite_load(BULUUARK, "providence_loadout", path.combine(PATH, "Sprites", "loadout.png"), 4, 28, 0)
local spr_palette         = Resources.spritel_load(BULUUARK, "providence_palette", path.combine(PATH, "Sprites", "palette.png"))
local sprSelectPalette    = Resources.sprite_load(BULUUARK, "select_providence_palette", path.combine(PATH, "Sprites", "selectpalette.png"))

-- === Survivor Declaration ===
local providence = Survivor.new("Providence", BULUUARK)
providence.loadoutSprite = spr_portrait_small
providence.idleSprite = sprites.idle
providence.title = "The Guardian of the End"
providence.description = "The final arbiter of fate.\nHarnesses celestial power to destroy or preserve."

-- === Loadout Info ===
providence:loadoutAddDescription("A powerful guardian wielding divine and shadow force. Providence uses versatile skills to control the battlefield and punish foes.")
providence.loadoutColor = Color.fromHex(0xAA3333)

-- === Skills ===
providence:addSkill("Divine Slash", "Strike with heavenly force for 120% damage.", spr_skills, 1)
providence:addSkill("Judgment Phase", "Vanish briefly and reappear with invincibility.", spr_skills, 2)

providence:createSkillset()

-- === Init Stats ===
providence:addCallback("init", function(player)
    player:set("pHmax", 1.3)
    player:set("hp", 160)
    player:set("maxhp", 160)
    player:set("armor", 10)
end)

-- === Level Up Stats ===
providence:addCallback("levelUp", function(player)
    player:set("maxhp", player:get("maxhp") + 25)
end)



-- Track combo state
local combo_state = {}
local combo_reset_time = 20 -- frames (~0.33 sec)

-- Callback to reset combo if needed
callback.register("onPlayerStep", function(player)
    local id = player:get("id")
    if combo_state[id] then
        combo_state[id].timer = combo_state[id].timer - 1
        if combo_state[id].timer <= 0 then
            combo_state[id] = nil
        end
    end
end)

-- Combo attack
local function doComboAttack(player)
    local id = player:get("id")
    local phase = 1

    -- Determine current combo phase
    if combo_state[id] then
        phase = combo_state[id].phase + 1
        if phase > 3 then phase = 1 end
    end

    -- Damage, animation, and sprite logic
    if phase == 1 then
        player:activateSkillCooldown(1) -- delay before next input
        player:setAnimation("attack1", spr_atk1)
        misc.fireBullet(player.x, player.y, 0, 0, 0.8 * player:get("damage"), "player", DAMAGER_BULLET_PIERCE)
    elseif phase == 2 then
        player:setAnimation("attack1", spr_atk2)
        misc.fireBullet(player.x, player.y, 0, 0, 0.8 * player:get("damage"), "player", DAMAGER_BULLET_PIERCE)
    elseif phase == 3 then
        player:setAnimation("attack1", spr_atk3)
        misc.fireBullet(player.x, player.y, 0, 0, 0.8 * player:get("damage"), "player", DAMAGER_BULLET_PIERCE)
    end

    -- Save state
    combo_state[id] = { phase = phase, timer = combo_reset_time }
end

-- Register skill
providence:addCallback("useSkill", function(player, skillIndex)
    if skillIndex == 1 then
        doComboAttack(player)
    end
end)



-- Projectile object definition
local objProvidenceOrb = Object.new("ProvidenceOrb")

objProvidenceOrb:addCallback("create", function(self)
    local selfData = self:getData()
    selfData.team = "player"
    self.sprite = spr_orb
    self.speed = 5
    self.direction = 0
    self.damage = 1
end)

objProvidenceOrb:addCallback("step", function(self)
    local selfData = self:getData()
    self.x = self.x + math.cos(selfData.direction) * selfData.speed
    self.y = self.y + math.sin(selfData.direction) * selfData.speed

    -- Damage enemies
    for _, actor in ipairs(pobj.enemies:findAllRectangle(self.x - 5, self.y - 5, self.x + 5, self.y + 5)) do
        if actor:isValid() and actor:get("team") ~= selfData.team then
            actor:takeDamage(selfData.damage, self:get("parent"))
        end
    end
end)

-- Skill 2: Heaven's Cascade
local function useCascade(player)
    player:setAnimation("attack2", spr_throw)
    sfx.Cast:play(1.2)

    for i = -1.5, 1.5 do
        local orb = objProvidenceOrb:create(player.x, player.y)
        orb:getData().direction = math.rad(player:getFacingDirection() + i * 10) -- spread
        orb:getData().speed = 6
        orb:getData().damage = 1.2 * player:get("damage")
        orb:set("parent", player.id)
    end
end

-- Register skill
providence:addCallback("useSkill", function(player, skillIndex)
    if skillIndex == 2 then
        useCascade(player)
    end
end)

-- Object for shadow slam effect
local objProvidenceShadow = Object.new("ProvidenceShadow")

objProvidenceShadow:addCallback("create", function(self)
    self.sprite = spr_shadowf
    self:set("life", 90) -- 1.5 seconds at 60fps
    self:set("slamTimer", 90)
end)

objProvidenceShadow:addCallback("step", function(self)
    local timer = self:get("slamTimer")
    self:set("slamTimer", timer - 1)

    if timer == 1 then
        -- Slam effect (duplicate damage)
        misc.fireExplosion(self.x, self.y, 30 / 19, 30 / 4, 2.0, "player")
        local fx = particles.explosion:burst("middle", self.x, self.y, 10)
        sfx.Impact:play(1.5)
    end

    self:set("life", self:get("life") - 1)
    if self:get("life") <= 0 then
        self:destroy()
    end
end)

-- Skill 3 Logic
local function activateShadowDescent(player)
    -- Start flying
    player:set("state", "flying")
    player:set("pVspeed", 0)
    player:set("gravity", 0)
    player:set("fly_timer", 180) -- 3 seconds
    player:setAnimation("jump", spr_jump_peak)
end

-- Handle flying state
callback.register("onPlayerStep", function(player)
    if player:get("state") == "flying" then
        player:set("pHmax", 4.5)
        player:set("fly_timer", player:get("fly_timer") - 1)

        -- Move freely
        if input.checkControl("left", player) then player.x = player.x - 2 end
        if input.checkControl("right", player) then player.x = player.x + 2 end
        if input.checkControl("up", player) then player.y = player.y - 2 end
        if input.checkControl("down", player) then player.y = player.y + 2 end

        if player:get("fly_timer") <= 0 or input.pressed("skill3") then
            -- Slam down!
            player:set("state", "normal")
            player:set("gravity", 0.15)
            player:set("pVspeed", 12)
            player:setAnimation("attack3", spr_slam)

            -- Damage at slam point
            misc.fireExplosion(player.x, player.y, 30 / 19, 30 / 4, 2.0, player:get("team"))
            sfx.Impact:play(1.5)

            -- Create shadow slam
            objProvidenceShadow:create(player.x, player.y)
        end
    end
end)

-- Register the skill activation
providence:addCallback("useSkill", function(player, skillIndex)
    if skillIndex == 3 then
        activateShadowDescent(player)
    end
end)
-- Conjured glyph object
local objProvidenceGlyph = Object.new("ProvidenceGlyph")

objProvidenceGlyph:addCallback("create", function(self)
    self.sprite = spr_target
    self:set("life", 30) -- stays ~0.5 seconds
    self:set("damaged", 0)
    self:set("team", "player")
end)

objProvidenceGlyph:addCallback("step", function(self)
    self:set("life", self:get("life") - 1)

    -- Only damage once
    if self:get("damaged") == 0 then
        misc.fireExplosion(self.x, self.y, 20 / 19, 20 / 4, 2.2, self:get("team"))
        self:set("damaged", 1)
        sfx.BossSkill2:play(1.0)
    end

    if self:get("life") <= 0 then
        self:destroy()
    end
end)

-- Skill 4 activation
local function useCelestialConjury(player)
    player:setAnimation("attack4", spr_conjour)
    sfx.Spawn:play(1.3)

    local spacing = 5
    local x = player.x
    local y = player.y
    local facing = player:getFacingDirection()

    for i = 1, 4 do
        local offset = spacing * i
        local glyphX = x + (facing * offset)
        local glyph = objProvidenceGlyph:create(glyphX, y)
        glyph:set("team", player:get("team"))
    end
end

-- Register skill 4
providence:addCallback("useSkill", function(player, skillIndex)
    if skillIndex == 4 then
        useCelestialConjury(player)
    end
end)



-- === Register ===
Survivor.register(providence)
