-- name: [CS] Saul \\ [WIP] \\
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
    [CHAR_SOUND_ATTACKED] = 'saulhoo.ogg',
    [CHAR_SOUND_DOH] = 'Silent.ogg',
    [CHAR_SOUND_DROWNING] = 'Silent.ogg',
    [CHAR_SOUND_DYING] = 'Silent.ogg',
    [CHAR_SOUND_EEUH] = 'Silent.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'saulwah.ogg',
    [CHAR_SOUND_HAHA] = 'saulwah_2.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'saulwahoo.ogg',
    [CHAR_SOUND_HOOHOO] = 'saulhoo.ogg',
    [CHAR_SOUND_HRMM] = 'Silent.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'saulwahoo.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'Silent.ogg',
    [CHAR_SOUND_ON_FIRE] = 'saulscream.mp3',
    [CHAR_SOUND_OOOF] = 'saulhoo.ogg',
    [CHAR_SOUND_OOOF2] = 'saulhoo.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'saulwah.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'saulwah_2.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'saulwah_3.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'saulwahoo.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'saulwahoo.ogg',
    [CHAR_SOUND_UH] = 'saulwah.ogg',
    [CHAR_SOUND_UH2] = 'saulwah_2.ogg',
    [CHAR_SOUND_UH2_2] = 'saulwah_3.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'saulscream.mp3',
    [CHAR_SOUND_WAH2] = 'saulwah_2.ogg',
    [CHAR_SOUND_WHOA] = 'Silent.ogg',
    [CHAR_SOUND_YAH_WAH_HOO] = {'saulwah.ogg', 'saulwah_2.ogg', 'saulwah_3.ogg'},
    [CHAR_SOUND_YAHOO] = 'saulwahoo.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = 'saulwahoo.ogg',
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
        [SKIN]   = "ffcd4b",
        [CAP]    = "ce6d00",
    }

    local PALETTE_GOOD_SAUL = {
        [PANTS]  = "d3ebff", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "7d85ee",
        [GLOVES] = "d3ebff",
        [HAIR]   = "8E765A",
        [SKIN]   = "FFDDA3",
        [CAP]    = "7d85ee",
    }

    local PALETTE_EVIL_SAUL = {
        [PANTS]  = "ffe5e5", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "c33131",
        [GLOVES] = "ffe5e5",
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

    local PALETTE_SAUL_PLUMB = {
        [PANTS]  = "412F85", --dont delete this color cuz its used in cs's paintbucket
        [SHIRT]  = "B2CC66",
        [GLOVES] = "FFFFFF",
        [HAIR]   = "8E765A",
        [SKIN]   = "FFDDA3",
        [CAP]    = "B2CC66",
    }

    local PALETTE_ULTRA_SAUL = {
        [PANTS]  = "000079",
        [SHIRT]  = "bbff4d",
        [GLOVES] = "ffd793",
        [HAIR]   = "462c00",
        [SKIN]   = "ffd793",
        [CAP]    = "bbff4d",
    }

    local PALETTE_SAUL_MARCUS = {
        [PANTS]  = "3d5e52",
        [SHIRT]  = "ff3e00",
        [GLOVES] = "fea279",
        [HAIR]   = "6a1f0b",
        [SKIN]   = "fea279",
        [CAP]    = "ff3e00",
    }

    local PALETTE_EVIL_SAULD_UP = {
        [PANTS]  = "5e5afe",
        [SHIRT]  = "fe002a",
        [GLOVES] = "FF0003",
        [HAIR]   = "743F39",
        [SKIN]   = "fefe84",
        [CAP]    = "fe002a",
    }

    local PALETTE_SAUL_KRISTALL = {
        [PANTS] = { r = 0x33, g = 0x39, b = 0x4d },
        [SHIRT] = { r = 0x99, g = 0x75, b = 0xd4 },
        [GLOVES] = { r = 0x99, g = 0x75, b = 0xd4 },
        [HAIR] = { r = 0x09, g = 0x0c, b = 0x09 },
        [SKIN] = { r = 0xff, g = 0xdc, b = 0xa8 },
        [CAP] = { r = 0x99, g = 0x75, b = 0xd4 },
    }

    local PALETTE_SAUL_KAKTUS = {
        [PANTS]  = "313149",
        [SHIRT]  = "791E82",
        [GLOVES] = "FF0003",
        [HAIR]   = "743F39",
        [SKIN]   = "DB9C70",
        [CAP]    = "3E8948",
    }


    local ANIMTABLE_SAUL = {
        [_G.charSelect.CS_ANIM_MENU] = "saulmenu",
        [CHAR_ANIM_IDLE_HEAD_CENTER] = 'saulidle',
        [CHAR_ANIM_IDLE_HEAD_LEFT] = 'saulidle',
        [CHAR_ANIM_IDLE_HEAD_RIGHT] = 'saulidle',
        [CHAR_ANIM_FIRST_PERSON] = 'saulidle',
    }

-- MOVESET SHITS BELOW

-- ACTIONS
ACT_SAUL_TWIRL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR)
ACT_SAUL_POUND = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING)

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

function act_saul_pound(m)
    local e = gStateExtras[m.playerIndex]
    local stepResult = common_air_action_step(m, ACT_GROUND_POUND_LAND, CHAR_ANIM_GROUND_POUND, AIR_STEP_NONE)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN
        e.rotAngle = e.rotAngle + 5000
    m.marioObj.header.gfx.angle.y = e.rotAngle
    if m.actionTimer == 0 then
        m.vel.y = 45
    end
    m.vel.y = m.vel.y - 2
        --e.rotAngle = e.rotAngle + 5000
    --m.marioObj.header.gfx.angle.y = e.rotAngle

    if m.input & INPUT_B_PRESSED ~= 0 then
        m.faceAngle.y = m.intendedYaw
        set_mario_action(m, ACT_DIVE, 0)
        m.vel.y = 30
    end

    m.actionTimer = m.actionTimer + 1
    return false
end
hook_mario_action(ACT_SAUL_POUND, act_saul_pound)


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
    --[[
    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_LEFT then
        m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    end

    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_CENTER then
        m.marioBodyState.eyeState = MARIO_EYES_OPEN
    end

    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_RIGHT then
        m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
    end
    --]]
    if m.input & INPUT_A_PRESSED ~= 0 and e.HasSaultwirled == false and saultwirltable[m.action] == true and m.vel.y < 0 then
        set_mario_action(m, ACT_SAUL_TWIRL, 0)
        audio_sample_play(SAUL_TWIRL, m.pos, get_volume_sfx() / 76)
    end
    if m.pos.y == m.floorHeight then
        e.HasSaultwirled = false
    end
end
function before_set_saul_action(m, inc)
local e = gStateExtras[m.playerIndex]
if inc == ACT_DIVE and m.controller.buttonDown & A_BUTTON ~= 0 and m.action == ACT_WALKING then
    return ACT_JUMP_KICK
end
if inc == ACT_GROUND_POUND then
    return ACT_SAUL_POUND
end
end

if _G.charSelectExists then
    CT_SAUL =_G.charSelect.character_add("Saul", "New Saul Remodel #8", "Saul, Kaktus", {r = 178, g = 204, b = 102}, E_MODEL_SAUL, CT_MARIO, TEX_SAULICON, 1.2)
    _G.charSelect.character_add_costume(CT_SAUL, "Plumber Saul", "Saul but mildly more racist", "Saul, Kaktus", {r = 65, g = 47, b = 133}, E_MODEL_PLUMBSAUL, CT_MARIO, TEX_SAULPLUBBERICON, 1.2)
    
    _G.charSelect.character_add_animations(E_MODEL_SAUL, ANIMTABLE_SAUL)
    _G.charSelect.character_add_animations(E_MODEL_PLUMBSAUL, ANIMTABLE_SAUL)

    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL, "Saul")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_CRAIG, "Craig")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_GOOD_SAUL, "Good")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_EVIL_SAUL, "Evil")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL_JER, "Biker")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAULOTTE, "Chocolate Chip")

    _G.charSelect.character_add_palette_preset(E_MODEL_PLUMBSAUL, PALETTE_SAUL_PLUMB, "Plumber")
    _G.charSelect.character_add_palette_preset(E_MODEL_PLUMBSAUL, PALETTE_ULTRA_SAUL, "Ultra Saul '94")
    _G.charSelect.character_add_palette_preset(E_MODEL_PLUMBSAUL, PALETTE_SAUL_MARCUS, "Pretty Mad")
    _G.charSelect.character_add_palette_preset(E_MODEL_PLUMBSAUL, PALETTE_EVIL_SAULD_UP, "Evil Saul'd Up")
    _G.charSelect.character_add_palette_preset(E_MODEL_PLUMBSAUL, PALETTE_SAUL_KRISTALL, "Gemstone")
    _G.charSelect.character_add_palette_preset(E_MODEL_PLUMBSAUL, PALETTE_SAUL_KAKTUS, "Spiky")

    _G.charSelect.character_add_course_texture(CT_SAUL, COURSE_SAUL)
    _G.charSelect.character_add_voice(E_MODEL_SAUL, VOICETABLE_SAUL)
    _G.charSelect.character_add_voice(E_MODEL_PLUMBSAUL, VOICETABLE_SAUL)
    _G.charSelect.character_hook_moveset(CT_SAUL, HOOK_MARIO_UPDATE, SaulFunction)
    _G.charSelect.character_hook_moveset(CT_SAUL, HOOK_BEFORE_SET_MARIO_ACTION, before_set_saul_action)
    _G.charSelect.character_add_graffiti(CT_SAUL, TEX_SAULGRAF)
    _G.charSelect.character_set_category(CT_SAUL, "DXA", true)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nwhat the fuck? \n\nPlease turn off the Character Select Mod\nand Restart the Room!", 6)
end

