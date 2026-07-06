-- name: [CS] Saul \\ [WIP] \\
-- description: Saul is back for the one millionth time

local E_MODEL_SAUL = smlua_model_util_get_id("saul_geo")
local E_MODEL_PLUMBSAUL = smlua_model_util_get_id("saulplumb_geo")

local TEX_SAULICON = get_texture_info("saulicon")
local TEX_SAULPLUBBERICON = get_texture_info("plumbersaulicon")
local TEX_SAULGRAF = get_texture_info("saulgraf")
local TEX_SAULHEALTHICONS = get_texture_info("saulhudicons")

local TEXT_MOD_NAME = "Saul"

local SAUL_TWIRL = audio_sample_load("saulsfucklintworl.mp3") -- saul twirl sfx

local HEALTH_SAUL = {
    label = {
        left = get_texture_info("saulHMleft"),
        right = get_texture_info("saulHMright"),
    },
    pie = {
        [1] = get_texture_info("char_select_custom_meter_pie1"),
        [2] = get_texture_info("char_select_custom_meter_pie2"),
        [3] = get_texture_info("char_select_custom_meter_pie3"),
        [4] = get_texture_info("char_select_custom_meter_pie4"),
        [5] = get_texture_info("char_select_custom_meter_pie5"),
        [6] = get_texture_info("char_select_custom_meter_pie6"),
        [7] = get_texture_info("char_select_custom_meter_pie7"),
        [8] = get_texture_info("char_select_custom_meter_pie8"),
    }
}

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
    [CHAR_SOUND_WAAAOOOW] = 'saulscreamfall.mp3',
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
        [PANTS]  = "264A34",
        [SHIRT]  = "E13A00",
        [GLOVES] = "FFFFFF",
        [SHOES]  = "0A1419",
        [HAIR]   = "3E0F0C",
        [SKIN]   = "FFB184" ,
        [CAP]    = "E13A00",
        [EMBLEM] = "000000"
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
        [PANTS]  = "33394D",
        [SHIRT]  = "9975D4",
        [GLOVES] = "9975D4",
        [HAIR]   = "090C09",
        [SKIN]   = "FFDCA8",
        [CAP]    = "9975D4",
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
        [_G.charSelect.CS_ANIM_MENU]     = "saulmenu",
        [CHAR_ANIM_GROUND_POUND_LANDING] = "saulslamland",
        [CHAR_ANIM_IDLE_HEAD_CENTER]     = 'saulidle',
        [CHAR_ANIM_IDLE_HEAD_LEFT]       = 'saulidle',
        [CHAR_ANIM_IDLE_HEAD_RIGHT]      = 'saulidle',
        [CHAR_ANIM_FIRST_PERSON]         = 'saulidle',
        [CHAR_ANIM_SINGLE_JUMP]          = 'sauljump',
    }

-- MOVESET SHITS BELOW

-- ACTIONS
ACT_SAUL_TWIRL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR)
ACT_SAUL_POUND = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_DIVING)
ACT_SAUL_FLING = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_DIVING)
ACT_JARED_WALKING = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_ALLOW_FIRST_PERSON | ACT_FLAG_MOVING | ACT_FLAG_CUSTOM_ACTION) --stealing this from jaredfan lmfao

function act_jared_walking(m)
    if (should_begin_sliding(m)) ~= 0 then
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    end

    if (m.input & INPUT_A_PRESSED) ~= 0 then
        return set_jumping_action(m, ACT_JUMP, 0);
    end

    if (check_ground_dive_or_punch(m) ~= 0) then
        return 1;
    end

    if (m.input & INPUT_ZERO_MOVEMENT) ~= 0 then
        begin_braking_action(m);
    end

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        return drop_and_set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    end

    mario_drop_held_object(m);

    update_walking_speed(m);

    set_mario_animation(m, MARIO_ANIM_RUNNING)

    m.marioObj.header.gfx.animInfo.animAccel = (m.forwardVel * 20000)

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_FREEFALL, 0);
    end

    return false;
end

hook_mario_action(ACT_JARED_WALKING, { every_frame = act_jared_walking, gravity = nil } )

local function fix_interactions(m, obj, interactType)
    if (m.action == ACT_JARED_WALKING) then
        if (interactType == INTERACT_WARP_DOOR) then
            m.action = ACT_WALKING
            local interaction = interact_warp_door(m, INTERACT_WARP_DOOR, obj)
            if (interaction == 0 and m.action ~= ACT_READING_AUTOMATIC_DIALOG) then
                m.action = ACT_JARED_WALKING
            end
        end
        if (interactType == INTERACT_DOOR) then
            m.action = ACT_WALKING
            local interaction = interact_door(m, INTERACT_DOOR, obj)
            if (interaction == 0 and m.action ~= ACT_READING_AUTOMATIC_DIALOG) then
                m.action = ACT_JARED_WALKING
            end
        end
        if (interactType == INTERACT_KOOPA_SHELL) then
            m.action = ACT_WALKING
            local interaction = interact_koopa_shell(m, INTERACT_KOOPA_SHELL, obj)
            if (interaction == 0) then
                m.action = ACT_JARED_WALKING
            end
        end
    end
end

hook_event(HOOK_ALLOW_INTERACT, fix_interactions)

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
    local stepResult = common_air_action_step(m, ACT_GROUND_POUND_LAND, CHAR_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
    smlua_anim_util_set_animation(m.marioObj, 'saulslam')
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN
    if m.actionTimer == 0 then
        m.vel.y = 45
    end
    m.vel.y = m.vel.y - 2
        --e.rotAngle = e.rotAngle + 5000
    --m.marioObj.header.gfx.angle.y = e.rotAngle

    if m.input & INPUT_B_PRESSED ~= 0 then
        m.faceAngle.y = m.intendedYaw
        set_mario_action(m, ACT_VERTICAL_WIND, 0)
        m.vel.y = 30
    end

    m.actionTimer = m.actionTimer + 1
    return false
end
hook_mario_action(ACT_SAUL_POUND, act_saul_pound)

function act_saul_fling(m)
    local e = gStateExtras[m.playerIndex]
    local stepResult = common_air_action_step(m, ACT_DIVE_SLIDE, CHAR_ANIM_FLY_FROM_CANNON, AIR_STEP_NONE)
    e.rotAngle = e.rotAngle + 7500
    m.marioObj.header.gfx.angle.x = e.rotAngle
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN
    m.actionTimer = m.actionTimer + 1
    m.faceAngle.y = m.intendedYaw - approach_s32(math.s16(m.intendedYaw - m.faceAngle.y), 0, 0x040, 0x040)
    if m.actionTimer > 10 and (m.flags & MARIO_WING_CAP) ~= 0 then
        set_mario_action(m, ACT_FLYING_TRIPLE_JUMP, 0)
        m.vel.y = 0
    end
end
hook_mario_action(ACT_SAUL_FLING, act_saul_fling)


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
    --super saul fling!!!!!!!!!!!!!! - kaktus
    if m.input & INPUT_A_PRESSED ~= 0 and m.action == ACT_GROUND_POUND_LAND then
        play_sound(SOUND_GENERAL_BOING2, m.marioObj.header.gfx.cameraToObject)
        m.forwardVel = 65
        set_mario_action(m, ACT_SAUL_FLING, 0)
        m.vel.y = 60
        if (m.flags & MARIO_WING_CAP) == 0 then
            play_character_sound(m, CHAR_SOUND_YAHOO)
        end
    end
    if m.pos.y == m.floorHeight then
        e.HasSaultwirled = false
    end
    if m.action == ACT_GROUND_POUND_LAND then
        m.marioObj.header.gfx.scale.y = 0.9
        m.marioObj.header.gfx.scale.x = 1.2
        m.marioObj.header.gfx.scale.z = 1.2
    end
end

function before_set_saul_action(m, inc)
    local e = gStateExtras[m.playerIndex]

    if inc == ACT_WALKING then
        return ACT_JARED_WALKING
    end

    if inc == ACT_DIVE and m.controller.buttonDown & A_BUTTON ~= 0 and m.action == ACT_WALKING then

        return ACT_JUMP_KICK

    end
    if inc == ACT_BUTT_SLIDE_STOP then

        return ACT_IDLE

    end
    if inc == ACT_GROUND_POUND then
        
        play_character_sound(m, CHAR_SOUND_GROUND_POUND_WAH)
        return ACT_SAUL_POUND

    end
end

function on_set_saul_action(m)
    if m.action == ACT_GROUND_POUND_LAND then
       play_sound(SOUND_ACTION_METAL_BONK, m.marioObj.header.gfx.cameraToObject)
       spawn_mist_from_global()
       set_mario_particle_flags(m, PARTICLE_HORIZONTAL_STAR, 0)
    end
end

local curanimframe = 0
local curanimframeother = 0

function theSaulFunctionName(i)
    if math.floor(curanimframe + i) * 16 > 112 then
        return math.floor((curanimframe - 8) + i) * 16
    else
        return math.floor(curanimframe + i) * 16
    end
end

function theSaulFunctionNameForOtherPlayers(i)
    if math.floor(curanimframeother + i) * 16 > 112 then
        return math.floor((curanimframeother - 8) + i) * 16
    else
        return math.floor(curanimframeother + i) * 16
    end
end

function healthmeterfunc(localIndex, health, prevX, prevY, prevScaleX, prevScaleY, x, y, scaleX, scaleY)
    if localIndex == 0 then
        local squares = health >> 8
        curanimframe = curanimframe + 0.2

        if curanimframe > 7 then
            curanimframe = -1
        end

        djui_hud_render_texture_tile(TEX_SAULHEALTHICONS, 18, 180 + math.abs(y), 0.36, 1, 0, 16, 48, 16)
        
        for i = 1, squares do
            djui_hud_render_texture_tile(TEX_SAULHEALTHICONS, 22 + ((i - 1) * 17), 196 + (i - 1) + math.abs(y), 1, 1, theSaulFunctionName(i), 0, 16, 16)
        end
    else
        local squares = health >> 8
        curanimframeother = curanimframeother + 0.2

        if curanimframeother > 7 then
            curanimframeother = -1
        end

        djui_hud_render_texture_tile(TEX_SAULHEALTHICONS, prevX, prevY + ((8 / 32) * prevScaleY), (prevScaleX / 2.85) / 48, (prevScaleY) / 48, 0, 16, 48, 16)

        for i = 1, squares do
            djui_hud_render_texture_tile(TEX_SAULHEALTHICONS, (prevX + (((i * 12) / 32) * prevScaleX)) - ((42 / 32) * prevScaleX), prevY + ((20 / 32) * prevScaleY), prevScaleX / 48, prevScaleY / 48, theSaulFunctionNameForOtherPlayers(i), 0, 16, 16)
        end
    end
end

local TEXTURE_SAUL_ENDING = get_texture_info("saulendingscreen")
local AlphaVar = 255

function saulEndingScreen()
    if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then

        AlphaVar = AlphaVar - 1.5

        if AlphaVar < 1 then
            AlphaVar = 1
        end

        djui_hud_set_color(255, 255, 255, 255)
        djui_hud_render_texture(TEXTURE_SAUL_ENDING, 0, 0, djui_hud_get_screen_width() / 256, djui_hud_get_screen_height() / 256)

        djui_hud_set_color(0, 0, 0, AlphaVar)
        djui_hud_render_rect(-2, -2, djui_hud_get_screen_width() * 2, djui_hud_get_screen_height() * 2)
    else
        AlphaVar = 255
    end
end

--removed eye states because I fucking hate them they don't even sync

if _G.charSelectExists then
    CT_SAUL =_G.charSelect.character_add("Saul", "New Saul Remodel #8", "Saul, Kaktus", {r = 178, g = 204, b = 102}, E_MODEL_SAUL, CT_MARIO, TEX_SAULICON, 1.2)
    _G.charSelect.character_add_costume(CT_SAUL, "Plumber Saul", "Saul but mildly more racist", "Saul, Kaktus", {r = 65, g = 47, b = 133}, E_MODEL_PLUMBSAUL, CT_MARIO, TEX_SAULPLUBBERICON, 1.2)
    
    _G.charSelect.character_add_animations(E_MODEL_SAUL, ANIMTABLE_SAUL)
    _G.charSelect.character_add_animations(E_MODEL_PLUMBSAUL, ANIMTABLE_SAUL)

    CT_JARED =_G.charSelect.character_add("Jared Fan", "hey guys it's me jared fan", "Saul, ", {r = 0, g = 255, b = 0}, E_MODEL_JARED_FRIEND, CT_MARIO, "j", 1.2)
    _G.charSelect.character_set_locked(CT_JARED, false, false)

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
    _G.charSelect.character_hook_moveset(CT_SAUL, HOOK_ON_SET_MARIO_ACTION, on_set_saul_action)
    _G.charSelect.character_hook_moveset(CT_SAUL, HOOK_ON_HUD_RENDER, saulEndingScreen)
    _G.charSelect.character_add_graffiti(CT_SAUL, TEX_SAULGRAF)
    --_G.charSelect.character_add_health_meter(CT_SAUL, HEALTH_SAUL)
    _G.charSelect.character_add_health_meter(CT_SAUL, healthmeterfunc)
    _G.charSelect.character_set_category(CT_SAUL, "DXA", true)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nwhat the fuck? \n\nPlease turn off the Character Select Mod\nand Restart the Room!", 6)
end

local function jaredUnlock()
    if mod_storage_load_bool("jared") then
        return true
    else
        return false
    end
end

hook_event(HOOK_ON_MODS_LOADED, function()
    _G.charSelect.character_set_locked(CT_JARED, jaredUnlock, true)
end)