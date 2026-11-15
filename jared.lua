local function lugiin(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.oAction = 0
    o.oTimer = 0

    o.hitboxRadius = 80
    o.hitboxHeight = 120

    o.oInteractType = INTERACT_TEXT
    o.oInteractionSubtype = INT_SUBTYPE_NPC

    o.oGraphYOffset = 38
end

local DIALOG_Jared = smlua_text_utils_allocate_dialog()
smlua_text_utils_dialog_replace(DIALOG_Jared, 11, 2, 95, 200, "You can play as me bro!.")

function lugioop(o)
    cur_obj_update_floor_height()
    object_step()
    o.oPosY = o.oFloorHeight

    local m = gMarioStates[0]

    o.header.gfx.animInfo.curAnim = get_mario_vanilla_animation(CHAR_ANIM_FIRST_PERSON)
    o.oFaceAngleYaw = approach_s16_symmetric(o.oFaceAngleYaw, obj_angle_to_object(m.marioObj, o) - 32768, 2000)

    if o.oAction == 0 then
        if (dist_between_objects(o, m.marioObj)) < 300 then
            mod_storage_save("jared", "heishere")
            _G.charSelect.character_set_locked(CT_JARED, true, true)

            cutscene_object_with_dialog(CUTSCENE_DIALOG, o, DIALOG_Jared)
            o.oAction = 1
        end
    elseif o.oAction == 1 then
        if (dist_between_objects(o, m.marioObj)) > 800 then
            o.oAction = 0
        end
    end
end

id_bhvDIALOG_Jared = hook_behavior(id_bhvDIALOG_Jared, OBJ_LIST_GENACTOR, true, lugiin, lugioop)

E_MODEL_JARED_FRIEND = smlua_model_util_get_id("jared_geo")
function checkcourtyard()
    if gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
        if gMarioStates[0].numStars >= 24 then
            spawn_non_sync_object(id_bhvDIALOG_Jared, E_MODEL_JARED_FRIEND, 14, 102, -1039, function(o)
                o.oBehParams2ndByte = DIALOG_Jared
            end)
        end
    end
end

hook_event(HOOK_ON_LEVEL_INIT, checkcourtyard)

ACT_JARED_BAD_SIDEFLIP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR)
function act_bad_sideflip(m)
    local stepresult = common_air_action_step(m, ACT_SIDE_FLIP_LAND, CHAR_ANIM_FORWARD_FLIP, AIR_STEP_CHECK_LEDGE_GRAB)
    m.actionTimer = m.actionTimer + 1
    m.marioObj.header.gfx.angle.y = m.marioObj.header.gfx.angle.y + 32768

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    end
end
hook_mario_action(ACT_JARED_BAD_SIDEFLIP, act_bad_sideflip)

function before_set_jared_action(m, inc)
    if inc == ACT_SIDE_FLIP then

        play_character_sound(m, CHAR_SOUND_WAH2)
        m.pos.y = m.pos.y + 2
        m.vel.y = 30
        m.faceAngle.y = m.intendedYaw
        return ACT_JARED_BAD_SIDEFLIP

    end
end