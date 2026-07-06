local function lugiin(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.oAction = 0
    o.oTimer = 0

    o.oGraphYOffset = 38
end

local DIALOG_Jared = smlua_text_utils_allocate_dialog()
smlua_text_utils_dialog_replace(DIALOG_Jared, 11, 2, 95, 200, "You can play as me bro!.")

function lugioop(o)
    cur_obj_update_floor_height()
    load_object_collision_model()
    object_step()
    o.oPosY = o.oFloorHeight

    local m = gMarioStates[0]

    o.header.gfx.animInfo.curAnim = get_mario_vanilla_animation(CHAR_ANIM_FIRST_PERSON)
    o.oFaceAngleYaw = obj_angle_to_object(m.marioObj, o) - 32768

    if o.oAction == 0 then
        if (dist_between_objects(o, m.marioObj)) < 300 then
            mod_storage_save_bool("jared", true)
            _G.charSelect.character_set_locked(CT_JARED, function() return true end, true)

            cutscene_object_with_dialog(CUTSCENE_DIALOG, o, DIALOG_Jared)
            o.oAction = 1
        end
    end
end

id_bhvDIALOG_Jared = hook_behavior(id_bhvDIALOG_Jared, OBJ_LIST_GENACTOR, true, lugiin, lugioop)

E_MODEL_JARED_FRIEND = smlua_model_util_get_id("jared_geo")
function checkcourtyard()
    if gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
        if gMarioStates[0].numStars >= 24 then
            spawn_non_sync_object(id_bhvDIALOG_Jared, E_MODEL_JARED_FRIEND, 14, 102, -1039, nil)
        end
    end
end

hook_event(HOOK_ON_LEVEL_INIT, checkcourtyard)