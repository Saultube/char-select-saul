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