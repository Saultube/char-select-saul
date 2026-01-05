-- name: [CS] Saul
-- description: Saul is back for the one millionth time

local E_MODEL_SAUL = smlua_model_util_get_id("saul_geo")

local TEX_SAULICON = get_texture_info("saulicon")
local TEX_SAULGRAF = get_texture_info("saulgraf")

local TEXT_MOD_NAME = "Saul"

function SaulUpdate(m)
    local m = network_player_from_global_index
end

if _G.charSelectExists then
    CT_SAUL =_G.charSelect.character_add("Saul", "New Saul Remodel #8", "Saul, Kaktus", {r = 178, g = 204, b = 102}, E_MODEL_SAUL, CT_MARIO, TEX_SAULICON, 1.2)
    _G.charSelect.character_add_palette_preset(E_MODEL_SAUL, PALETTE_SAUL)
    _G.charSelect.character_add_graffiti(CT_SAUL, TEX_SAULGRAF)
    _G.charSelect.character_set_category(CT_SAUL, "DXA", true)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nwhat the fuck? \n\nPlease turn off the Character Select Mod\nand Restart the Room!", 6)
end