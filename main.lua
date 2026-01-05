-- name: [CS] Saul
-- description: Saul is back for the one millionth time

local E_MODEL_SAUL = smlua_model_util_get_id("saul_geo")

local TEX_SAULICON = get_texture_info("saulicon")
local TEX_SAULGRAF = get_texture_info("saulgraf")

local TEXT_MOD_NAME = "Saul"

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

function SaulFunction(m)
    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_LEFT then
        m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    end

    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_CENTER then
        m.marioBodyState.eyeState = MARIO_EYES_OPEN
    end

    if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_IDLE_HEAD_RIGHT then
        m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
    end
end

if _G.charSelectExists then
    CT_SAUL =_G.charSelect.character_add("Saul", "New Saul Remodel #8", "Saul, Kaktus", {r = 178, g = 204, b = 102}, E_MODEL_SAUL, CT_MARIO, TEX_SAULICON, 1.2)

    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL, "Saul")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_CRAIG, "Craig")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_GOOD_SAUL, "Good")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_EVIL_SAUL, "Evil")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL_JER, "Jer")
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAULOTTE, "Charlotte")
    
    _G.charSelect.character_hook_moveset(CT_SAUL, HOOK_MARIO_UPDATE, SaulFunction)
    _G.charSelect.character_add_graffiti(CT_SAUL, TEX_SAULGRAF)
    _G.charSelect.character_set_category(CT_SAUL, "DXA", true)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nwhat the fuck? \n\nPlease turn off the Character Select Mod\nand Restart the Room!", 6)
end