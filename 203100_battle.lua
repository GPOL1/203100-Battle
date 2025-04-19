RegisterTableGoal(GOAL_ProlificRenala203100_Battle, "ProlificRenala203100_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_ProlificRenala203100_Battle, true)

Goal.Initialize = function (_, arg1, _, _)
    arg1:GetStringIndexedNumber("MoonPosibleFlg")
    arg1:GetStringIndexedNumber("Warp_Cnt")
    arg1:SetStringIndexedNumber("BackStepFlg", 0)
    arg1:SetStringIndexedNumber("MoonPosibleFlg", 0)
    arg1:SetStringIndexedNumber("Warp_Cnt", 0)
end

Goal.Activate = function (_, actor, goals)
    Init_Pseudo_Global(actor, goals)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 14586)
    actor:SetStringIndexedNumber("Dist_SideStep", 5)
    actor:SetStringIndexedNumber("Dist_BackStep", 5)
    local probabilities = {}
    local acts = {}
    local f2_local0 = {}
    Common_Clear_Param(probabilities, acts, f2_local0)
    local distance = actor:GetDist(TARGET_ENE_0)
    local random = actor:GetRandam_Int(1, 100)
    actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    actor:GetEventRequest()
    actor:SetStringIndexedNumber("MoonPosibleFlg", 0)
    if actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_F, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_L, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_R, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_FL, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_FR, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_BL, 2) == true and actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_BR, 2) == true then
        actor:SetStringIndexedNumber("MoonPosibleFlg", 1)
    end
    if actor:GetStringIndexedNumber("BackStepFlg") == 1 and actor:HasSpecialEffectId(TARGET_SELF, 14590) == false then
        actor:SetStringIndexedNumber("BackStepFlg", 0)
    end
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5040)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5104)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5105)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5131)
    --probabilities[34] = 100
    if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, -1, 999) then
        if distance > 20 then
            if actor:GetStringIndexedNumber("MoonPosibleFlg") == 1 then
                probabilities[1] = 30
                probabilities[2] = 20
                probabilities[3] = 20
                probabilities[4] = 20
                probabilities[16] = 10
            else
                probabilities[1] = 30
                probabilities[2] = 20
                probabilities[3] = 20
                probabilities[4] = 20
                probabilities[16] = 10
            end
        elseif distance > 10 then
            if actor:GetStringIndexedNumber("MoonPosibleFlg") == 1 then
                probabilities[1] = 20
                probabilities[2] = 15
                probabilities[3] = 15
                probabilities[4] = 20
                probabilities[5] = 40
                probabilities[9] = 15
                probabilities[16] = 10
                --probabilities[32] = 100
                probabilities[33] = 100
                probabilities[34] = 100
            else
                probabilities[1] = 25
                probabilities[2] = 20
                probabilities[3] = 20
                probabilities[4] = 20
                probabilities[9] = 15
                probabilities[16] = 10
                --probabilities[32] = 100
                probabilities[33] = 100
                probabilities[34] = 100
            end
        elseif distance > 5 then
            if actor:HasSpecialEffectId(TARGET_SELF, 5032) and actor:GetTimer(0) <= 0 and random < 80 then
                actor:SetTimer(0, 10)
                probabilities[12] = 70
                probabilities[15] = 30
                probabilities[34] = 100
            else
                if actor:GetStringIndexedNumber("MoonPosibleFlg") == 1 then
                    probabilities[5] = 50
                end
                probabilities[4] = 10
                probabilities[8] = 45
                probabilities[9] = 30
                probabilities[32] = 100
                probabilities[33] = 100
                probabilities[34] = 100
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5031) and random < 50 then
            probabilities[12] = 15
            probabilities[13] = 80
            probabilities[20] = 5
            probabilities[19] = 200
            probabilities[23] = 200
            probabilities[32] = 100
            probabilities[33] = 100
            probabilities[34] = 100
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5032) and random < 50 then
            probabilities[12] = 50
            probabilities[13] = 30
            probabilities[20] = 5
            probabilities[19] = 200
            probabilities[23] = 200
            probabilities[32] = 100
            probabilities[33] = 100
            probabilities[34] = 100
        else
            probabilities[12] = 20
            probabilities[13] = 50
            probabilities[20] = 30
            probabilities[19] = 200
            probabilities[23] = 200
            probabilities[32] = 100
            probabilities[33] = 100
            probabilities[34] = 100
            if actor:GetHpRate(TARGET_SELF) > 0.6 and actor:GetStringIndexedNumber("MoonPosibleFlg") == 1 then
                probabilities[5] = 100
            end
        end
    else
        probabilities[42] = 100
    end
    probabilities[21] = 0
    if actor:GetNumber(1) == 0 then
        probabilities[41] = 1000000
        actor:SetNumber(1, 1)
    end
    if actor:HasSpecialEffectId(TARGET_SELF, 5104) then
        if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, -1, 999) and distance <= 5 then
            probabilities[17] = 200
        end
    end
    if actor:GetHpRate(TARGET_SELF) <= 0.4 and actor:HasSpecialEffectId(TARGET_SELF, 5104) == false and actor:HasSpecialEffectId(TARGET_SELF, 5131) then
        probabilities[18] = 99999999999
    end

    if actor:GetHpRate(TARGET_SELF) <= 0.8 and actor:HasSpecialEffectId(TARGET_SELF, 5105) == false then
        probabilities[28] = 99999999999
    end

    if actor:HasSpecialEffectId(TARGET_SELF, 5104) then
        probabilities[33] = 0
    end

    probabilities[1] = SetCoolTime(actor, goals, 3000, 16, probabilities[1], 1)
    probabilities[2] = SetCoolTime(actor, goals, 3001, 16, probabilities[2], 1)
    probabilities[3] = SetCoolTime(actor, goals, 3002, 16, probabilities[3], 1)
    probabilities[4] = SetCoolTime(actor, goals, 3003, 15, probabilities[4], 0)
    probabilities[5] = SetCoolTime(actor, goals, 3005, 40, probabilities[5], 0)
    probabilities[8] = SetCoolTime(actor, goals, 3008, 10, probabilities[8], 10)
    probabilities[9] = SetCoolTime(actor, goals, 3009, 10, probabilities[9], 5)
    probabilities[12] = SetCoolTime(actor, goals, 3018, 15, probabilities[12], 5)
    probabilities[13] = SetCoolTime(actor, goals, 3013, 15, probabilities[13], 5)
    probabilities[15] = SetCoolTime(actor, goals, 3014, 15, probabilities[15], 5)
    probabilities[15] = SetCoolTime(actor, goals, 3019, 15, probabilities[15], 5)
    probabilities[16] = SetCoolTime(actor, goals, 3007, 20, probabilities[16], 0)
    probabilities[17] = SetCoolTime(actor, goals, 3006, 20, probabilities[17], 0)
    probabilities[20] = SetCoolTime(actor, goals, 3015, 10, probabilities[20], 0)
    probabilities[21] = SetCoolTime(actor, goals, 3016, 45, probabilities[21], 1)
    probabilities[25] = SetCoolTime(actor, goals, 3030, 90, probabilities[25], 0)
    probabilities[26] = SetCoolTime(actor, goals, 3031, 60, probabilities[26], 0)
    probabilities[27] = SetCoolTime(actor, goals, 3032, 70, probabilities[27], 0)
    probabilities[28] = SetCoolTime(actor, goals, 3033, 60, probabilities[28], 0)
    probabilities[19] = SetCoolTime(actor, goals, 6001, 15, probabilities[19], 0)
    probabilities[19] = SetCoolTime(actor, goals, 6002, 15, probabilities[19], 0)
    probabilities[19] = SetCoolTime(actor, goals, 6003, 15, probabilities[19], 0)
    probabilities[23] = SetCoolTime(actor, goals, 6002, 15, probabilities[23], 0)
    probabilities[23] = SetCoolTime(actor, goals, 6003, 15, probabilities[23], 0)
    probabilities[23] = SetCoolTime(actor, goals, 6001, 15, probabilities[23], 0)
    probabilities[32] = SetCoolTime(actor, goals, 3004, 20, probabilities[32], 0)
    probabilities[33] = SetCoolTime(actor, goals, 3010, 20, probabilities[33], 0)
    probabilities[34] = SetCoolTime(actor, goals, 3012, 15, probabilities[34], 0)
    acts[1] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act01)
    acts[2] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act02)
    acts[3] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act03)
    acts[4] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act04)
    acts[5] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act05)
    acts[8] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act08)
    acts[9] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act09)
    acts[12] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act12)
    acts[13] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act13)
    acts[14] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act14)
    acts[15] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act15)
    acts[16] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act16)
    acts[17] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act17)
    acts[18] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act18)
    acts[19] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act19)
    acts[20] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act20)
    acts[21] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act21)
    acts[22] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act22)
    acts[23] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act23)
    acts[25] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act25)
    acts[26] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act26)
    acts[27] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act27)
    acts[28] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act28)
    acts[30] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act30)
    acts[31] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act31)
    acts[32] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act32)
    acts[33] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act33)
    acts[34] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act34)
    acts[40] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act40)
    acts[41] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act41)
    acts[42] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act42)
    acts[43] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act43)
    acts[44] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act44)
    acts[45] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act45)
    acts[46] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act46)
    acts[47] = REGIST_FUNC(actor, goals, ProlificRenala203100_Act47)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, ProlificRenala203100_ActAfter_AdjustSpace), f2_local0)
end

function ProlificRenala203100_Act01(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f3_local0 = 4
    local action = 3000
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f3_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act02(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f4_local0 = 4
    local action = 3001
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f4_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act03(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f5_local0 = 4
    local action = 3002
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f5_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act04(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    local f6_local0 = 4
    local action = 3003
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f6_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act05(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f7_local0 = 4
    local action = 3005
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f7_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act08(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f8_local0 = 4
    local action = 3008
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f8_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act09(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f9_local0 = 4
    local action = 3009
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f9_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act12(actor, goals, _)
    local f10_local0 = 10
    local f10_local1 = 0
    local f10_local2 = 999
    local f10_local3 = 0
    local f10_local4 = 0
    local f10_local5 = 2
    local f10_local6 = 2
    Approach_Act_Flex(actor, goals, f10_local0, f10_local1, f10_local2, f10_local3, f10_local4, f10_local5, f10_local6)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    local f10_local7 = 4
    local action = 3018
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f10_local7, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act13(actor, goals, _)
    local f11_local0 = 6
    local f11_local1 = 0
    local f11_local2 = 999
    local f11_local3 = 0
    local f11_local4 = 0
    local f11_local5 = 2
    local f11_local6 = 2
    Approach_Act_Flex(actor, goals, f11_local0, f11_local1, f11_local2, f11_local3, f11_local4, f11_local5, f11_local6)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    local f11_local7 = 4
    local action = 3013
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f11_local7, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act14(actor, goals, _)
    local f12_local0 = 5
    local f12_local1 = 0
    local f12_local2 = 999
    local f12_local3 = 0
    local f12_local4 = 0
    local f12_local5 = 2
    local f12_local6 = 2
    Approach_Act_Flex(actor, goals, f12_local0, f12_local1, f12_local2, f12_local3, f12_local4, f12_local5, f12_local6)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    local f12_local7 = 4
    local action = 3010
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f12_local7, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act15(actor, goals, _)
    local f13_local0 = 10
    local f13_local1 = 0
    local f13_local2 = 999
    local f13_local3 = 0
    local f13_local4 = 0
    local f13_local5 = 2
    local f13_local6 = 2
    Approach_Act_Flex(actor, goals, f13_local0, f13_local1, f13_local2, f13_local3, f13_local4, f13_local5, f13_local6)
    if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_L, 180, -1, 999) then
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
        local f13_local7 = 4
        local action = 3014
        local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
        local turn_time_before = 0
        local front_decision_angle = 0
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f13_local7, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    else
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
        local f13_local7 = 4
        local action = 3019
        local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
        local turn_time_before = 0
        local front_decision_angle = 0
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f13_local7, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
end

function ProlificRenala203100_Act16(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f14_local0 = 15
    local action = 3007
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f14_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act17(actor, goals, _)
    local f14_local0 = 15
    local action = 3006
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f14_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act18(actor, goals, _)
    local f14_local0 = 15
    local action = 3034
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f14_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act19(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_StepSafety, 3, -1, 1, -1, -1, TARGET_ENE_0, 0, 0, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act32(actor, goals, _)
    local f14_local0 = 15
    local action = 3004
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f14_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act33(actor, goals, _)
    local f14_local0 = 15
    local action = 3010
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f14_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act34(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f8_local0 = 4
    local action = 3012
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f8_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act23(arg0, goals, _)
    if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        goals:AddSubGoal(GOAL_COMMON_StepSafety, 3, -1, -1, 1, -1, TARGET_ENE_0, 0, 0, true)
    else
        goals:AddSubGoal(GOAL_COMMON_StepSafety, 3, -1, -1, -1, 1, TARGET_ENE_0, 0, 0, true)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act20(actor, goals, _)
    if actor:CheckDoesExistPath(TARGET_SELF, AI_DIR_TYPE_B, 4) then
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
        local f15_local0 = 10
        local action = 3015
        local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
        local turn_time_before = 0
        local front_decision_angle = 0
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f15_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    else
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
        local f15_local0 = 10
        local action = 3016
        local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
        local turn_time_before = 0
        local front_decision_angle = 0
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f15_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
end

function ProlificRenala203100_Act21(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    local f16_local0 = 10
    local action = 3016
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f16_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act22(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f17_local0 = 10
    local action = 3029
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f17_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act25(actor, goals, _)
    actor:SetTimer(2, 15)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f18_local0 = 20
    local action = 3030
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f18_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act26(actor, goals, _)
    actor:SetTimer(2, 15)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f19_local0 = 20
    local action = 3031
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f19_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act27(actor, goals, _)
    actor:SetTimer(2, 15)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 14586)
    local f20_local0 = 20
    local action = 3032
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f20_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act28(actor, goals, _)
    actor:SetTimer(2, 15)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f21_local0 = 20
    local action = 3033
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f21_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act30(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f22_local0 = 4
    local action = 3031
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f22_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act31(actor, goals, _)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local f23_local0 = 4
    local action = 3026
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, f23_local0, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act40(_, goals, _)
    local f24_local0 = 2
    local distance = 2
    local is_walking = true
    local action = -1
    goals:AddSubGoal(GOAL_COMMON_ApproachTarget, f24_local0, TARGET_ENE_0, distance, TARGET_SELF, is_walking, action)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act41(_, goals, _)
    local f25_local0 = 3
    local distance = 20
    local is_walking = true
    local action = -1
    goals:AddSubGoal(GOAL_COMMON_ApproachTarget, f25_local0, TARGET_ENE_0, distance, TARGET_SELF, is_walking, action)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act42(arg0, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, arg0:GetRandam_Int(15, 20), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act43(arg0, goals, _)
    arg0:SetStringIndexedNumber("BackStepFlg", 1)
    local f27_local0 = 20
    local f27_local1 = 6001
    local f27_local2 = TARGET_ENE_0
    local f27_local3 = 0
    local f27_local4 = AI_DIR_TYPE_R
    local f27_local5 = 0
    goals:AddSubGoal(GOAL_COMMON_SpinStep, f27_local0, f27_local1, f27_local2, f27_local3, f27_local4, f27_local5)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act44(actor, goals, _)
    local random = actor:GetRandam_Int(0, 1)
    local f28_local0 = 3.5
    local target = TARGET_ENE_0
    local f28_local1 = random
    local f28_local2 = 15
    local f28_local3 = true
    local f28_local4 = -1
    local f28_local5 = GUARD_GOAL_DESIRE_RET_Failed
    goals:AddSubGoal(GOAL_COMMON_SidewayMove, f28_local0, target, f28_local1, f28_local2, f28_local3, isLifeSuccess, f28_local4, f28_local5)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act45(_, goals, _)
    local f29_local0 = 6
    local distance = 15
    local is_walking = true
    local action = -1
    goals:AddSubGoal(GOAL_COMMON_ApproachTarget, f29_local0, TARGET_ENE_0, distance, TARGET_SELF, is_walking, action)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act46(_, goals, _)
    local f30_local0 = 3
    local f30_local1 = TARGET_ENE_0
    local f30_local2 = 8
    local f30_local3 = TARGET_ENE_0
    local f30_local4 = true
    local f30_local5 = -1
    local f30_local6 = GUARD_GOAL_DESIRE_RET_Failed
    local f30_local7 = false
    local f30_local8 = 1
    goals:AddSubGoal(GOAL_COMMON_LeaveTargetToPathEnd, f30_local0, f30_local1, f30_local2, f30_local3, f30_local4, f30_local5, f30_local6, f30_local7, f30_local8)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_Act47(actor, goals, _)
    if actor:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 1.5) and actor:GetDist(TARGET_ENE_0) <= 8 then
        goals:AddSubGoal(GOAL_COMMON_LeaveTargetToPathEnd, 3, TARGET_ENE_0, 8, TARGET_ENE_0, true, -1, GUARD_GOAL_DESIRE_RET_Failed, false, 1)
    else
        local random = actor:GetRandam_Int(0, 1)
        goals:AddSubGoal(GOAL_COMMON_SidewayMove, 3.5, TARGET_ENE_0, random, 100, true, isLifeSuccess, -1, GUARD_GOAL_DESIRE_RET_Failed)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ProlificRenala203100_ActAfter_AdjustSpace(_, goals, _)
    goals:AddSubGoal(GOAL_ProlificRenala203100_AfterAttackAct, 10)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, actor, goals)
    if actor:IsLadderAct(TARGET_SELF) then
        return false
    end
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5040)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5131)
    local distance = actor:GetDist(TARGET_ENE_0)
    local random = actor:GetRandam_Int(1, 100)
    if actor:IsInterupt(INTERUPT_Damaged) and actor:HasSpecialEffectId(TARGET_SELF, 5034) == false and actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 300, -1, 999) and actor:GetTimer(1) <= 0 and random < 30 and distance < 5 then
        actor:SetTimer(1, 10)
        goals:ClearSubGoal()
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 4, 3015, TARGET_ENE_0, 0, 0, 0, 0, 0)
        return true
    elseif actor:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if actor:HasSpecialEffectId(TARGET_SELF, 5026) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 90, -1, 50) and distance > 15 then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 6, 3004, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5027) then
            actor:SetStringIndexedNumber("Warp_Cnt", actor:GetStringIndexedNumber("Warp_Cnt") + 1)
            goals:ClearSubGoal()
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 6, 3017, TARGET_ENE_0, 0, 0, 0, 0, 0)
            return true
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5040) then
            goals:ClearSubGoal()
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 6, 3011, TARGET_ENE_0, 0, 0, 0, 0, 0)
            return true
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5028) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 90, -1, 20) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 6, 3011, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5033) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 90, -1, 999) and actor:GetRemainingAttackCoolTime(3007) <= 0 and distance > 15 then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 6, 3007, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 14586) then
            local f35_local0 = 7
            local f35_local1 = 1.5
            goals:ClearSubGoal()
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_F", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_F, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_FL", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_FL, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_FR", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_FR, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_L", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_L, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_R", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_R, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_B", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_B, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_BL", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_BL, 70 + f35_local1, f35_local1, 0))
            actor:SetStringIndexedNumber("ExistMeshOnLine_SELF_BR", actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_BR, 70 + f35_local1, f35_local1, 0))
            local f35_local2 = nil
            if actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_BL") >= 8 or actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_BR") >= 8 then
                if actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_BL") < 8 then
                    f35_local2 = AI_DIR_TYPE_BR
                elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_BR") < 8 then
                    f35_local2 = AI_DIR_TYPE_BL
                elseif random > 50 then
                    f35_local2 = AI_DIR_TYPE_BL
                else
                    f35_local2 = AI_DIR_TYPE_BR
                end
            elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_BL") >= 8 then
                f35_local2 = AI_DIR_TYPE_B
            elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_L") >= 8 or actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_R") >= 8 then
                if actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_L") < 8 then
                    f35_local2 = AI_DIR_TYPE_R
                elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_R") < 8 then
                    f35_local2 = AI_DIR_TYPE_L
                elseif random > 50 then
                    f35_local2 = AI_DIR_TYPE_L
                else
                    f35_local2 = AI_DIR_TYPE_R
                end
            elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_FL") >= 8 or actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_FR") >= 8 then
                if actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_FL") < 8 then
                    f35_local2 = AI_DIR_TYPE_FR
                elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_FR") < 8 then
                    f35_local2 = AI_DIR_TYPE_FL
                elseif random > 50 then
                    f35_local2 = AI_DIR_TYPE_FL
                else
                    f35_local2 = AI_DIR_TYPE_FR
                end
            elseif actor:GetStringIndexedNumber("ExistMeshOnLine_SELF_F") < 8 then
                f35_local2 = AI_DIR_TYPE_F
            else
                f35_local2 = AI_DIR_TYPE_F
                f35_local0 = 0
            end
            goals:AddSubGoal(GOAL_COMMON_ToTargetWarp, 5, TARGET_SELF, f35_local2, f35_local0, TARGET_ENE_0)
            return true
        end
    end
    return false
end

RegisterTableGoal(GOAL_ProlificRenala203100_AfterAttackAct, "ProlificRenala203100_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_ProlificRenala203100_AfterAttackAct, true)

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end
