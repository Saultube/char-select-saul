-- name: [CS] Saul
-- description: Saul is back for the one millionth time

local E_MODEL_SAUL = smlua_model_util_get_id("saul_geo")
local E_MODEL_PLUMBSAUL = smlua_model_util_get_id("saulplumb_geo")

local TEX_SAULICON = get_texture_info("saulicon")
local TEX_SAULPLUBBERICON = get_texture_info("plumbersaulicon")
local TEX_SAULGRAF = get_texture_info("saulgraf")

local TEXT_MOD_NAME = "Saul"

local SAUL_TWIRL = audio_sample_load("saulsfucklintworl.mp3") -- saul twirl sfx

local gStateExtras = {}
for i = 0, MAX_PLAYERS - 1 do
    gStateExtras[i] = {}
    local m = gMarioStates[i]
    local e = gStateExtras[i]
    e.rotAngle = 0
    e.HasSaultwirled = false
end

local COURSE_SAUL = {
    top = get_texture_info("saulcoursetop"),
    bottom = get_texture_info("saulcoursebottom"),
}

local VOICETABLE_SAUL = {
    [CHAR_SOUND_ATTACKED] = 'SAUL_SOUND_ATTACKED.ogg',
    [CHAR_SOUND_DOH] = 'SAUL_SOUND_DOH.ogg',
    [CHAR_SOUND_DROWNING] = 'SAUL_SOUND_DROWNING.ogg',
    [CHAR_SOUND_DYING] = 'SAUL_SOUND_DYING.ogg',
    [CHAR_SOUND_EEUH] = 'SAUL_SOUND_EEUH.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'SAUL_SOUND_GROUND_POUND_WAH.ogg',
    [CHAR_SOUND_HAHA] = 'SAUL_SOUND_HAHA.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'SAUL_SOUND_HERE_WE_GO.ogg',
    [CHAR_SOUND_HOOHOO] = 'SAUL_SOUND_HOOHOO.ogg',
    [CHAR_SOUND_HRMM] = 'SAUL_SOUND_HRMM.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'SAUL_SOUND_LETS_A_GO.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'SAUL_SOUND_MAMA_MIA.ogg',
    [CHAR_SOUND_ON_FIRE] = 'SAUL_SOUND_ON_FIRE.ogg',
    [CHAR_SOUND_OOOF] = 'SAUL_SOUND_OOOF.ogg',
    [CHAR_SOUND_OOOF2] = 'SAUL_SOUND_OOOF2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'SAUL_SOUND_PUNCH_HOO.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'SAUL_SOUND_PUNCH_WAH.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'SAUL_SOUND_PUNCH_YAH.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'SAUL_SOUND_SO_LONGA_BOWSER.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'SAUL_SOUND_TWIRL_BOUNCE.ogg',
    [CHAR_SOUND_UH] = 'SAUL_SOUND_UH.ogg',
    [CHAR_SOUND_UH2] = 'SAUL_SOUND_UH2.ogg',
    [CHAR_SOUND_UH2_2] = 'SAUL_SOUND_UH2_2.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'SAUL_SOUND_WAAAOOOW.ogg',
    [CHAR_SOUND_WAH2] = 'SAUL_SOUND_WAH2.ogg',
    [CHAR_SOUND_WHOA] = 'SAUL_SOUND_WHOA.ogg',
    [CHAR_SOUND_YAH_WAH_HOO] = 'SAUL_SOUND_YAH_WAH_HOO.ogg',
    [CHAR_SOUND_YAHOO] = 'SAUL_SOUND_YAHOO.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = 'SAUL_SOUND_YAHOO_WAHA_YIPPEE.ogg',
}

local PALETTE_SAUL = {
        [PANTS]  = "FFFFFF", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "B2CC66",
        [GLOVES] = "FFFFFF",
        [HAIR]   = "8E765A",
        [SKIN]   = "FFDDA3",
        [CAP]    = "B2CC66",
    }

    local PALETTE_CRAIG = {
        [PANTS]  = "ffffb2", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "ce6d00",
        [GLOVES] = "ffffb2",
        [HAIR]   = "745200",
        [SKIN]   = "ecbf2c",
        [CAP]    = "ce6d00",
    }

    local PALETTE_SAUL = {
        [PANTS]  = "FFFFFF", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "B2CC66",
        [GLOVES] = "FFFFFF",
        [HAIR]   = "8E765A",
        [SKIN]   = "FFDDA3",
        [CAP]    = "B2CC66",
    }

    local PALETTE_GOOD_SAUL = {
        [PANTS]  = "FFFFFF", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "7d85ee",
        [GLOVES] = "FFFFFF",
        [HAIR]   = "8E765A",
        [SKIN]   = "FFDDA3",
        [CAP]    = "7d85ee",
    }

    local PALETTE_EVIL_SAUL = {
        [PANTS]  = "FFFFFF", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "c33131",
        [GLOVES] = "FFFFFF",
        [HAIR]   = "8E765A",
        [SKIN]   = "FFDDA3",
        [CAP]    = "c33131",
    }

    local PALETTE_SAUL_JER = {
        [PANTS]  = "4f4f4f", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "008040",
        [GLOVES] = "4f4f4f",
        [HAIR]   = "462C1E",
        [SKIN]   = "ffba90",
        [CAP]    = "00ff00",
    }

    local PALETTE_SAULOTTE = {
        [PANTS]  = "103374", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "B814A6",
        [GLOVES] = "103374",
        [HAIR]   = "7B4116",
        [SKIN]   = "FFAA6B",
        [CAP]    = "B814A6",
    }

-- MOVESET SHITS BELOW

-- ACTIONS
ACT_SAUL_TWIRL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR)

function act_saul_twirl(m)
    local e = gStateExtras[m.playerIndex]
    common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_TWIRL, AIR_STEP_CHECK_LEDGE_GRAB)
    set_character_animation(m, CHAR_ANIM_TWIRL)
    e.rotAngle = e.rotAngle + 6500
    m.marioObj.header.gfx.angle.y = e.rotAngle
    m.actionTimer = m.actionTimer + 1
    m.vel.y = m.vel.y / 1.8
    if m.actionTimer > 7 then
    m.action = ACT_FREEFALL
    e.HasSaultwirled = true
    end
end
hook_mario_action(ACT_SAUL_TWIRL, act_saul_twirl)

saultwirltable = { -- saul twirl table
    [ACT_JUMP] = true,
    [ACT_DOUBLE_JUMP] = true,
    [ACT_TRIPLE_JUMP] = true,
    [ACT_FREEFALL] = true,
    [ACT_SIDE_FLIP] = true,
    [ACT_BACKFLIP] = true,
    [ACT_WALL_KICK_AIR] = true,
}

--ACTUAL MOVESET

function SaulFunction(m)
local e = gStateExtras[m.playerIndex]
    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_LEFT then
        m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    end

    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_CENTER then
        m.marioBodyState.eyeState = MARIO_EYES_OPEN
    end

    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_RIGHT then
        m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
    end
    if m.input & INPUT_A_PRESSED ~= 0 and e.HasSaultwirled == false and saultwirltable[m.action] == true and m.vel.y < 0 then
        set_mario_action(m, ACT_SAUL_TWIRL, 0)
        audio_sample_play(SAUL_TWIRL, m.pos, get_volume_sfx() / 76)
    end
    if m.pos.y == m.floorHeight then
        e.HasSaultwirled = false
    end
end

if _G.charSelectExists then
    CT_SAUL =_G.charSelect.character_add("Saul", "New Saul Remodel #8", "Saul, Kaktus", {r = 178, g = 204, b = 102}, E_MODEL_SAUL, CT_MARIO, TEX_SAULICON, 1.2)
    _G.charSelect.character_add_costume(CT_SAUL, "Plumber Saul", "Saul but mildly more racist", "Saul, Kaktus", {r = 65, g = 47, b = 133}, E_MODEL_PLUMBSAUL, CT_MARIO, TEX_SAULPLUBBERICON, 1.2)

    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL, "Saul")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_CRAIG, "Craig")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_GOOD_SAUL, "Good")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_EVIL_SAUL, "Evil")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL_JER, "Jer")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAULOTTE, "Charlotte")
    _G.charSelect.character_add_course_texture(CT_SAUL, COURSE_SAUL)
    _G.charSelect.character_add_voice(E_MODEL_SAUL, VOICETABLE_SAUL)
    _G.charSelect.character_hook_moveset(CT_SAUL, HOOK_MARIO_UPDATE, SaulFunction)
    _G.charSelect.character_add_graffiti(CT_SAUL, TEX_SAULGRAF)
    _G.charSelect.character_set_category(CT_SAUL, "DXA", true)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nwhat the fuck? \n\nPlease turn off the Character Select Mod\nand Restart the Room!", 6)
end

