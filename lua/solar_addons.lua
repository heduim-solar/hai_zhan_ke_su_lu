
--globals from YDTriggerSaveLoadSystem:
LIBRARY_YDTriggerSaveLoadSystem = true
YDHT = nil
YDLOC = nil
--endglobals from YDTriggerSaveLoadSystem
--globals from YDWEBase:
LIBRARY_YDWEBase = true
--ȫ�ֹ�ϣ�� 
bj_AllString = ".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
--全局系统变量
bj_lastAbilityCastingUnit = nil
bj_lastAbilityTargetUnit = nil
bj_lastPoolAbstractedUnit = nil
bj_lastCreatedUnitPool = nil
bj_lastPoolAbstractedItem = nil
bj_lastCreatedItemPool = nil
bj_lastSetAttackType = ATTACK_TYPE_NORMAL
bj_lastSetDamageType = DAMAGE_TYPE_NORMAL
bj_lastSetWeaponType = WEAPON_TYPE_WHOKNOWS
yd_MapMaxX = 0
yd_MapMinX = 0
yd_MapMaxY = 0
yd_MapMinY = 0
YDWEBase___yd_PlayerColor = _array_()
YDWEBase___AbilityCastingOverEventQueue = _array_()
YDWEBase___AbilityCastingOverEventType = _array_(0)
YDWEBase___AbilityCastingOverEventNumber = 0
--endglobals from YDWEBase
--globals from YDWETriggerEvent:
LIBRARY_YDWETriggerEvent = true
yd_DamageEventTrigger = nil
YDWETriggerEvent___DamageEventQueue = _array_()
YDWETriggerEvent___DamageEventNumber = 0

bj_lastMovedItemInItemSlot = nil

YDWETriggerEvent___MoveItemEventTrigger = nil
YDWETriggerEvent___MoveItemEventQueue = _array_()
YDWETriggerEvent___MoveItemEventNumber = 0
--endglobals from YDWETriggerEvent
--globals from MeatHook:
LIBRARY_MeatHook = true
--private constant real MOVE_DIST = 40. //
--private constant real KEEP_DIST = 50. // 
--
MeatHook__Except = CreateGroup()
MeatHook__Point = Location(0.0, 0.0)
--endglobals from MeatHook
--globals from YDWEAroundSystem:
LIBRARY_YDWEAroundSystem = true
YDWEAroundSystem___AROUND_TIM = CreateTimer()
YDWEAroundSystem___AROUND_INTER = 0.01
--endglobals from YDWEAroundSystem
--globals from YDWEJumpTimer:
LIBRARY_YDWEJumpTimer = true
--��Ծϵͳ���ȼ�
MoveMoreLevel_JumpTimer = 3
--endglobals from YDWEJumpTimer
--globals from YDWEStringFormula:
LIBRARY_YDWEStringFormula = true
bj_lastCombinedItem = nil
YDWEStringFormula___ItemCombineEventQueue = _array_()
YDWEStringFormula___ItemCombineEventNumber = 0
YDWEStringFormula___MAX_INSTANCES = 8100
YDWEStringFormula___SEGMENT_LENGTH = 4
YDWEStringFormula___FormulaData = 0
--endglobals from YDWEStringFormula
--globals from YDWETimerPattern:
LIBRARY_YDWETimerPattern = true
YDWETimerPattern___Bexpr = nil
YDWETimerPattern___Area = nil
YDWETimerPattern___tmp_data = nil
YDWETimerPattern___yd_loc = Location(0.0, 0.0)
--endglobals from YDWETimerPattern
-- Generated
gg_trg_solar_addons_ydwe = nil

l__library_init = nil

--JASSHelper struct globals:
si__YDWEAroundSystem___Data = 1
si__YDWEAroundSystem___Data_F = 0
si__YDWEAroundSystem___Data_I = 0
si__YDWEAroundSystem___Data_V = _array_(0)
s__YDWEAroundSystem___Data_Structs = _array_(0)
s__YDWEAroundSystem___Data_Total = 0
s__YDWEAroundSystem___Data_caster = _array_()
s__YDWEAroundSystem___Data_obj = _array_()
s__YDWEAroundSystem___Data_dur = _array_(0.0)
s__YDWEAroundSystem___Data_inter = _array_(0.0)
s__YDWEAroundSystem___Data_each = _array_(0.0)
s__YDWEAroundSystem___Data_rate = _array_(0.0)
s__YDWEAroundSystem___Data_dis = _array_(0.0)
s__YDWEAroundSystem___Data_rise = _array_(0.0)
s__YDWEAroundSystem___Data_angle = _array_(0.0)
s__YDWEAroundSystem___Data_radius = _array_(0.0)
s__YDWEAroundSystem___Data_height = _array_(0.0)
si__YDWEStringFormula___Inventory = 2
si__YDWEStringFormula___Inventory_F = 0
si__YDWEStringFormula___Inventory_I = 0
si__YDWEStringFormula___Inventory_V = _array_(0)
si__YDWEStringFormula___StringTable = 3
si__YDWEStringFormula___ItemIdMatrix = 4
s__YDWEStringFormula___ItemIdMatrix_Data = nil
s__YDWEStringFormula___ItemIdMatrix_Total = 1
s__YDWEStringFormula___ItemIdMatrix_itemId = _array_(0)
s__YDWEStringFormula___ItemIdMatrix_keyStr = _array_()
s__YDWEStringFormula___ItemIdMatrix_keyLen = _array_(0)
si__YDWEStringFormula___FormulaMatrix = 5
s__YDWEStringFormula___FormulaMatrix_Data = nil
s__YDWEStringFormula___FormulaMatrix_Total = 1
s__YDWEStringFormula___FormulaMatrix_formula = _array_()
s__YDWEStringFormula___FormulaMatrix_segmLen = _array_(0)
s__YDWEStringFormula___FormulaMatrix_model = _array_()
s__YDWEStringFormula___FormulaMatrix_message = _array_()
s__YDWEStringFormula___FormulaMatrix_chance = _array_(0)
s__YDWEStringFormula___FormulaMatrix_delete = _array_(false)
si__YDWEStringFormula___Sorting = 6
si__YDWEStringFormula___Sorting_F = 0
si__YDWEStringFormula___Sorting_I = 0
si__YDWEStringFormula___Sorting_V = _array_(0)
s___YDWEStringFormula___Sorting_stack = _array_(0)
s___YDWEStringFormula___Sorting_stack_size = 8
s__YDWEStringFormula___Sorting_stack = _array_(0)
s___YDWEStringFormula___Sorting_count = _array_(0)
s___YDWEStringFormula___Sorting_count_size = 8
s__YDWEStringFormula___Sorting_count = _array_(0)
s__YDWEStringFormula___Sorting_total = _array_(0)
s__YDWEStringFormula___Sorting_char = _array_()
si__YDWETimerPattern___YDVector3 = 9
si__YDWETimerPattern___YDVector3_F = 0
si__YDWETimerPattern___YDVector3_I = 0
si__YDWETimerPattern___YDVector3_V = _array_(0)
s__YDWETimerPattern___YDVector3_x = _array_(0.0)
s__YDWETimerPattern___YDVector3_y = _array_(0.0)
s__YDWETimerPattern___YDVector3_z = _array_(0.0)
si__YDWETimerPattern___Thread = 10
si__YDWETimerPattern___Thread_F = 0
si__YDWETimerPattern___Thread_I = 0
si__YDWETimerPattern___Thread_V = _array_(0)
s__YDWETimerPattern___Thread_des = _array_(0)
s__YDWETimerPattern___Thread_pos = _array_(0)
s__YDWETimerPattern___Thread_vel = _array_(0)
s__YDWETimerPattern___Thread_caster = _array_()
s__YDWETimerPattern___Thread_source = _array_()
s__YDWETimerPattern___Thread_target = _array_()
s__YDWETimerPattern___Thread_obj = _array_()
s__YDWETimerPattern___Thread_ac = _array_(0.0)
s__YDWETimerPattern___Thread_bc = _array_(0.0)
s__YDWETimerPattern___Thread_dist = _array_(0.0)
s__YDWETimerPattern___Thread_step = _array_(0.0)
s__YDWETimerPattern___Thread_amount = _array_(0.0)
s__YDWETimerPattern___Thread_switch = _array_(0)
s__YDWETimerPattern___Thread_follow = _array_(0)
s__YDWETimerPattern___Thread_unitid = _array_(0)
s__YDWETimerPattern___Thread_skills = _array_(0)
s__YDWETimerPattern___Thread_order = _array_(0)
s__YDWETimerPattern___Thread_level = _array_(0)
s__YDWETimerPattern___Thread_dsfx = _array_()
s__YDWETimerPattern___Thread_gsfx = _array_()
s__YDWETimerPattern___Thread_wsfx = _array_()
s__YDWETimerPattern___Thread_part = _array_()
s__YDWETimerPattern___Thread_recycle = _array_(false)
s__YDWETimerPattern___Thread_killdest = _array_(false)
s__YDWETimerPattern___Thread_volume = _array_(false)
s__YDWETimerPattern___Thread_g = _array_()
s__YDWETimerPattern___Thread_t = _array_()
si__YDWETimerPattern___Parabola = 11
si__YDWETimerPattern___Linear = 12
si__YDWETimerPattern___Deceleration = 13
si__YDWEStringFormula___Inventory_type = _array_(0)
st__YDWEStringFormula___Inventory_onDestroy = _array_()
si__YDWETimerPattern___Thread_type = _array_(0)
st__YDWETimerPattern___Thread_onDestroy = _array_()
st__YDWEStringFormula___Sorting_onDestroy = nil
f__arg_this = nil




--Generated allocator of YDWEAroundSystem___Data
function s__YDWEAroundSystem___Data__allocate()
	local this = si__YDWEAroundSystem___Data_F
	if this ~= 0 then
		si__YDWEAroundSystem___Data_F = si__YDWEAroundSystem___Data_V[this]
	else
		si__YDWEAroundSystem___Data_I = si__YDWEAroundSystem___Data_I + 1
		this = si__YDWEAroundSystem___Data_I
	end
	if this > 8190 then
		return 0
	end

	s__YDWEAroundSystem___Data_caster[this] = nil
	s__YDWEAroundSystem___Data_obj[this] = nil
	s__YDWEAroundSystem___Data_dur[this] = 0.0
	s__YDWEAroundSystem___Data_inter[this] = 0.0
	s__YDWEAroundSystem___Data_each[this] = 0.0
	s__YDWEAroundSystem___Data_rate[this] = 0.0
	s__YDWEAroundSystem___Data_dis[this] = 0.0
	s__YDWEAroundSystem___Data_rise[this] = 0.0
	s__YDWEAroundSystem___Data_angle[this] = 0.0
	s__YDWEAroundSystem___Data_radius[this] = 0.0
	s__YDWEAroundSystem___Data_height[this] = 0
	si__YDWEAroundSystem___Data_V[this] = -1
	return this
end

--Generated destructor of YDWEAroundSystem___Data
function s__YDWEAroundSystem___Data_deallocate(this)
	if this == nil then
		return
	elseif si__YDWEAroundSystem___Data_V[this] ~= -1 then
		return
	end
	si__YDWEAroundSystem___Data_V[this] = si__YDWEAroundSystem___Data_F
	si__YDWEAroundSystem___Data_F = this
end

--Generated method caller for YDWEStringFormula___Inventory.onDestroy
function sc__YDWEStringFormula___Inventory_onDestroy(this)
	f__arg_this = this
	TriggerEvaluate(st__YDWEStringFormula___Inventory_onDestroy[2])
end

--Generated allocator of YDWEStringFormula___Inventory
function s__YDWEStringFormula___Inventory__allocate()
	local this = si__YDWEStringFormula___Inventory_F
	if this ~= 0 then
		si__YDWEStringFormula___Inventory_F = si__YDWEStringFormula___Inventory_V[this]
	else
		si__YDWEStringFormula___Inventory_I = si__YDWEStringFormula___Inventory_I + 1
		this = si__YDWEStringFormula___Inventory_I
	end
	if this > 8190 then
		return 0
	end

	si__YDWEStringFormula___Inventory_type[this] = 2
	si__YDWEStringFormula___Inventory_V[this] = -1
	return this
end

--Generated destructor of YDWEStringFormula___Inventory
function sc__YDWEStringFormula___Inventory_deallocate(this)
	if this == nil then
		return
	elseif si__YDWEStringFormula___Inventory_V[this] ~= -1 then
		return
	end
	f__arg_this = this
	TriggerEvaluate(st__YDWEStringFormula___Inventory_onDestroy[si__YDWEStringFormula___Inventory_type[this]])
	si__YDWEStringFormula___Inventory_V[this] = si__YDWEStringFormula___Inventory_F
	si__YDWEStringFormula___Inventory_F = this
end

--Generated allocator of YDWEStringFormula___StringTable
function s__YDWEStringFormula___StringTable__allocate()
	local this = s__YDWEStringFormula___Inventory__allocate()
	local kthis
	if this == 0 then
		return 0
	end
	si__YDWEStringFormula___Inventory_type[this] = 3
	kthis = this

	return this
end


--Generated method caller for YDWETimerPattern___Thread.onDestroy
function sc__YDWETimerPattern___Thread_onDestroy(this)
	f__arg_this = this
	TriggerEvaluate(st__YDWETimerPattern___Thread_onDestroy[10])
end

--Generated allocator of YDWETimerPattern___Thread
function s__YDWETimerPattern___Thread__allocate()
	local this = si__YDWETimerPattern___Thread_F
	if this ~= 0 then
		si__YDWETimerPattern___Thread_F = si__YDWETimerPattern___Thread_V[this]
	else
		si__YDWETimerPattern___Thread_I = si__YDWETimerPattern___Thread_I + 1
		this = si__YDWETimerPattern___Thread_I
	end
	if this > 8190 then
		return 0
	end

	si__YDWETimerPattern___Thread_type[this] = 10
	si__YDWETimerPattern___Thread_V[this] = -1
	return this
end

--Generated destructor of YDWETimerPattern___Thread
function sc__YDWETimerPattern___Thread_deallocate(this)
	if this == nil then
		return
	elseif si__YDWETimerPattern___Thread_V[this] ~= -1 then
		return
	end
	f__arg_this = this
	TriggerEvaluate(st__YDWETimerPattern___Thread_onDestroy[si__YDWETimerPattern___Thread_type[this]])
	si__YDWETimerPattern___Thread_V[this] = si__YDWETimerPattern___Thread_F
	si__YDWETimerPattern___Thread_F = this
end

--Generated allocator of YDWETimerPattern___YDVector3
function s__YDWETimerPattern___YDVector3__allocate()
	local this = si__YDWETimerPattern___YDVector3_F
	if this ~= 0 then
		si__YDWETimerPattern___YDVector3_F = si__YDWETimerPattern___YDVector3_V[this]
	else
		si__YDWETimerPattern___YDVector3_I = si__YDWETimerPattern___YDVector3_I + 1
		this = si__YDWETimerPattern___YDVector3_I
	end
	if this > 8190 then
		return 0
	end

	si__YDWETimerPattern___YDVector3_V[this] = -1
	return this
end

--Generated destructor of YDWETimerPattern___YDVector3
function s__YDWETimerPattern___YDVector3_deallocate(this)
	if this == nil then
		return
	elseif si__YDWETimerPattern___YDVector3_V[this] ~= -1 then
		return
	end
	si__YDWETimerPattern___YDVector3_V[this] = si__YDWETimerPattern___YDVector3_F
	si__YDWETimerPattern___YDVector3_F = this
end

--Generated method caller for YDWEStringFormula___Sorting.onDestroy
function sc__YDWEStringFormula___Sorting_onDestroy(this)
	local i = 0
	for _ in _loop_() do
		if i == s___YDWEStringFormula___Sorting_stack_size then break end
		s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] = 0
		s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] = 0
		i = i + 1
	end
	s__YDWEStringFormula___Sorting_char[this] = ""
end

--Generated allocator of YDWEStringFormula___Sorting
function s__YDWEStringFormula___Sorting__allocate()
	local this = si__YDWEStringFormula___Sorting_F
	if this ~= 0 then
		si__YDWEStringFormula___Sorting_F = si__YDWEStringFormula___Sorting_V[this]
	else
		si__YDWEStringFormula___Sorting_I = si__YDWEStringFormula___Sorting_I + 1
		this = si__YDWEStringFormula___Sorting_I
	end
	if this > 1022 then
		return 0
	end
	s__YDWEStringFormula___Sorting_stack[this] = (this - 1) * 8
	s__YDWEStringFormula___Sorting_count[this] = (this - 1) * 8
	s__YDWEStringFormula___Sorting_total[this] = 7
	si__YDWEStringFormula___Sorting_V[this] = -1
	return this
end

--Generated destructor of YDWEStringFormula___Sorting
function sc__YDWEStringFormula___Sorting_deallocate(this)
	if this == nil then
		return
	elseif si__YDWEStringFormula___Sorting_V[this] ~= -1 then
		return
	end
	f__arg_this = this
	TriggerEvaluate(st__YDWEStringFormula___Sorting_onDestroy)
	si__YDWEStringFormula___Sorting_V[this] = si__YDWEStringFormula___Sorting_F
	si__YDWEStringFormula___Sorting_F = this
end

--Generated allocator of YDWETimerPattern___Deceleration
function s__YDWETimerPattern___Deceleration__allocate()
	local this = s__YDWETimerPattern___Thread__allocate()
	local kthis
	if this == 0 then
		return 0
	end
	si__YDWETimerPattern___Thread_type[this] = 13
	kthis = this

	return this
end


--Generated allocator of YDWETimerPattern___Parabola
function s__YDWETimerPattern___Parabola__allocate()
	local this = s__YDWETimerPattern___Thread__allocate()
	local kthis
	if this == 0 then
		return 0
	end
	si__YDWETimerPattern___Thread_type[this] = 11
	kthis = this

	return this
end


--Generated allocator of YDWETimerPattern___Linear
function s__YDWETimerPattern___Linear__allocate()
	local this = s__YDWETimerPattern___Thread__allocate()
	local kthis
	if this == 0 then
		return 0
	end
	si__YDWETimerPattern___Thread_type[this] = 12
	kthis = this

	return this
end


--library YDTriggerSaveLoadSystem:
function YDTriggerSaveLoadSystem___Init()
	YDHT = InitHashtable()
	YDLOC = InitHashtable()
end

--library YDTriggerSaveLoadSystem ends
--library YDWEBase:
--===========================================================================
--HashTable
--===========================================================================
--===========================================================================
--Return bug
--===========================================================================
function YDWEH2I(h)
	return GetHandleId(h)
end
--����
function YDWEFlushAllData()
	FlushParentHashtable(YDHT)
end
function YDWEFlushMissionByInteger(i)
	FlushChildHashtable(YDHT, i)
end
function YDWEFlushMissionByString(s)
	FlushChildHashtable(YDHT, StringHash(s))
end
function YDWEFlushStoredIntegerByInteger(i, j)
	RemoveSavedInteger(YDHT, i, j)
end
function YDWEFlushStoredIntegerByString(s1, s2)
	RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
end
function YDWEHaveSavedIntegerByInteger(i, j)
	return HaveSavedInteger(YDHT, i, j)
end
function YDWEHaveSavedIntegerByString(s1, s2)
	return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
end
--store and get integer
function YDWESaveIntegerByInteger(pTable, pKey, i)
	SaveInteger(YDHT, pTable, pKey, i)
end
function YDWESaveIntegerByString(pTable, pKey, i)
	SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
end
function YDWEGetIntegerByInteger(pTable, pKey)
	return LoadInteger(YDHT, pTable, pKey)
end
function YDWEGetIntegerByString(pTable, pKey)
	return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
end
--store and get real
function YDWESaveRealByInteger(pTable, pKey, r)
	SaveReal(YDHT, pTable, pKey, r)
end
function YDWESaveRealByString(pTable, pKey, r)
	SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
end
function YDWEGetRealByInteger(pTable, pKey)
	return LoadReal(YDHT, pTable, pKey)
end
function YDWEGetRealByString(pTable, pKey)
	return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
end
--store and get string
function YDWESaveStringByInteger(pTable, pKey, s)
	SaveStr(YDHT, pTable, pKey, s)
end
function YDWESaveStringByString(pTable, pKey, s)
	SaveStr(YDHT, StringHash(pTable), StringHash(pKey), s)
end
function YDWEGetStringByInteger(pTable, pKey)
	return LoadStr(YDHT, pTable, pKey)
end
function YDWEGetStringByString(pTable, pKey)
	return LoadStr(YDHT, StringHash(pTable), StringHash(pKey))
end
--store and get boolean
function YDWESaveBooleanByInteger(pTable, pKey, b)
	SaveBoolean(YDHT, pTable, pKey, b)
end
function YDWESaveBooleanByString(pTable, pKey, b)
	SaveBoolean(YDHT, StringHash(pTable), StringHash(pKey), b)
end
function YDWEGetBooleanByInteger(pTable, pKey)
	return LoadBoolean(YDHT, pTable, pKey)
end
function YDWEGetBooleanByString(pTable, pKey)
	return LoadBoolean(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Unit
function YDWESaveUnitByInteger(pTable, pKey, u)
	SaveUnitHandle(YDHT, pTable, pKey, u)
end
function YDWESaveUnitByString(pTable, pKey, u)
	SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
end
function YDWEGetUnitByInteger(pTable, pKey)
	return LoadUnitHandle(YDHT, pTable, pKey)
end
function YDWEGetUnitByString(pTable, pKey)
	return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert UnitID
function YDWESaveUnitIDByInteger(pTable, pKey, uid)
	SaveInteger(YDHT, pTable, pKey, uid)
end
function YDWESaveUnitIDByString(pTable, pKey, uid)
	SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), uid)
end
function YDWEGetUnitIDByInteger(pTable, pKey)
	return LoadInteger(YDHT, pTable, pKey)
end
function YDWEGetUnitIDByString(pTable, pKey)
	return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert AbilityID
function YDWESaveAbilityIDByInteger(pTable, pKey, abid)
	SaveInteger(YDHT, pTable, pKey, abid)
end
function YDWESaveAbilityIDByString(pTable, pKey, abid)
	SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), abid)
end
function YDWEGetAbilityIDByInteger(pTable, pKey)
	return LoadInteger(YDHT, pTable, pKey)
end
function YDWEGetAbilityIDByString(pTable, pKey)
	return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Player
function YDWESavePlayerByInteger(pTable, pKey, p)
	SavePlayerHandle(YDHT, pTable, pKey, p)
end
function YDWESavePlayerByString(pTable, pKey, p)
	SavePlayerHandle(YDHT, StringHash(pTable), StringHash(pKey), p)
end
function YDWEGetPlayerByInteger(pTable, pKey)
	return LoadPlayerHandle(YDHT, pTable, pKey)
end
function YDWEGetPlayerByString(pTable, pKey)
	return LoadPlayerHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Item
function YDWESaveItemByInteger(pTable, pKey, it)
	SaveItemHandle(YDHT, pTable, pKey, it)
end
function YDWESaveItemByString(pTable, pKey, it)
	SaveItemHandle(YDHT, StringHash(pTable), StringHash(pKey), it)
end
function YDWEGetItemByInteger(pTable, pKey)
	return LoadItemHandle(YDHT, pTable, pKey)
end
function YDWEGetItemByString(pTable, pKey)
	return LoadItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert ItemID
function YDWESaveItemIDByInteger(pTable, pKey, itid)
	SaveInteger(YDHT, pTable, pKey, itid)
end
function YDWESaveItemIDByString(pTable, pKey, itid)
	SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), itid)
end
function YDWEGetItemIDByInteger(pTable, pKey)
	return LoadInteger(YDHT, pTable, pKey)
end
function YDWEGetItemIDByString(pTable, pKey)
	return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Timer
function YDWESaveTimerByInteger(pTable, pKey, t)
	SaveTimerHandle(YDHT, pTable, pKey, t)
end
function YDWESaveTimerByString(pTable, pKey, t)
	SaveTimerHandle(YDHT, StringHash(pTable), StringHash(pKey), t)
end
function YDWEGetTimerByInteger(pTable, pKey)
	return LoadTimerHandle(YDHT, pTable, pKey)
end
function YDWEGetTimerByString(pTable, pKey)
	return LoadTimerHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Trigger
function YDWESaveTriggerByInteger(pTable, pKey, trg)
	SaveTriggerHandle(YDHT, pTable, pKey, trg)
end
function YDWESaveTriggerByString(pTable, pKey, trg)
	SaveTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey), trg)
end
function YDWEGetTriggerByInteger(pTable, pKey)
	return LoadTriggerHandle(YDHT, pTable, pKey)
end
function YDWEGetTriggerByString(pTable, pKey)
	return LoadTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Location
function YDWESaveLocationByInteger(pTable, pKey, pt)
	SaveLocationHandle(YDHT, pTable, pKey, pt)
end
function YDWESaveLocationByString(pTable, pKey, pt)
	SaveLocationHandle(YDHT, StringHash(pTable), StringHash(pKey), pt)
end
function YDWEGetLocationByInteger(pTable, pKey)
	return LoadLocationHandle(YDHT, pTable, pKey)
end
function YDWEGetLocationByString(pTable, pKey)
	return LoadLocationHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Group
function YDWESaveGroupByInteger(pTable, pKey, g)
	SaveGroupHandle(YDHT, pTable, pKey, g)
end
function YDWESaveGroupByString(pTable, pKey, g)
	SaveGroupHandle(YDHT, StringHash(pTable), StringHash(pKey), g)
end
function YDWEGetGroupByInteger(pTable, pKey)
	return LoadGroupHandle(YDHT, pTable, pKey)
end
function YDWEGetGroupByString(pTable, pKey)
	return LoadGroupHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Multiboard
function YDWESaveMultiboardByInteger(pTable, pKey, m)
	SaveMultiboardHandle(YDHT, pTable, pKey, m)
end
function YDWESaveMultiboardByString(pTable, pKey, m)
	SaveMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey), m)
end
function YDWEGetMultiboardByInteger(pTable, pKey)
	return LoadMultiboardHandle(YDHT, pTable, pKey)
end
function YDWEGetMultiboardByString(pTable, pKey)
	return LoadMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert MultiboardItem
function YDWESaveMultiboardItemByInteger(pTable, pKey, mt)
	SaveMultiboardItemHandle(YDHT, pTable, pKey, mt)
end
function YDWESaveMultiboardItemByString(pTable, pKey, mt)
	SaveMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey), mt)
end
function YDWEGetMultiboardItemByInteger(pTable, pKey)
	return LoadMultiboardItemHandle(YDHT, pTable, pKey)
end
function YDWEGetMultiboardItemByString(pTable, pKey)
	return LoadMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert TextTag
function YDWESaveTextTagByInteger(pTable, pKey, tt)
	SaveTextTagHandle(YDHT, pTable, pKey, tt)
end
function YDWESaveTextTagByString(pTable, pKey, tt)
	SaveTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey), tt)
end
function YDWEGetTextTagByInteger(pTable, pKey)
	return LoadTextTagHandle(YDHT, pTable, pKey)
end
function YDWEGetTextTagByString(pTable, pKey)
	return LoadTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Lightning
function YDWESaveLightningByInteger(pTable, pKey, ln)
	SaveLightningHandle(YDHT, pTable, pKey, ln)
end
function YDWESaveLightningByString(pTable, pKey, ln)
	SaveLightningHandle(YDHT, StringHash(pTable), StringHash(pKey), ln)
end
function YDWEGetLightningByInteger(pTable, pKey)
	return LoadLightningHandle(YDHT, pTable, pKey)
end
function YDWEGetLightningByString(pTable, pKey)
	return LoadLightningHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Region
function YDWESaveRegionByInteger(pTable, pKey, rn)
	SaveRegionHandle(YDHT, pTable, pKey, rn)
end
function YDWESaveRegionByString(pTable, pKey, rt)
	SaveRegionHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
end
function YDWEGetRegionByInteger(pTable, pKey)
	return LoadRegionHandle(YDHT, pTable, pKey)
end
function YDWEGetRegionByString(pTable, pKey)
	return LoadRegionHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Rect
function YDWESaveRectByInteger(pTable, pKey, rn)
	SaveRectHandle(YDHT, pTable, pKey, rn)
end
function YDWESaveRectByString(pTable, pKey, rt)
	SaveRectHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
end
function YDWEGetRectByInteger(pTable, pKey)
	return LoadRectHandle(YDHT, pTable, pKey)
end
function YDWEGetRectByString(pTable, pKey)
	return LoadRectHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Leaderboard
function YDWESaveLeaderboardByInteger(pTable, pKey, lb)
	SaveLeaderboardHandle(YDHT, pTable, pKey, lb)
end
function YDWESaveLeaderboardByString(pTable, pKey, lb)
	SaveLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey), lb)
end
function YDWEGetLeaderboardByInteger(pTable, pKey)
	return LoadLeaderboardHandle(YDHT, pTable, pKey)
end
function YDWEGetLeaderboardByString(pTable, pKey)
	return LoadLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Effect
function YDWESaveEffectByInteger(pTable, pKey, e)
	SaveEffectHandle(YDHT, pTable, pKey, e)
end
function YDWESaveEffectByString(pTable, pKey, e)
	SaveEffectHandle(YDHT, StringHash(pTable), StringHash(pKey), e)
end
function YDWEGetEffectByInteger(pTable, pKey)
	return LoadEffectHandle(YDHT, pTable, pKey)
end
function YDWEGetEffectByString(pTable, pKey)
	return LoadEffectHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert Destructable
function YDWESaveDestructableByInteger(pTable, pKey, da)
	SaveDestructableHandle(YDHT, pTable, pKey, da)
end
function YDWESaveDestructableByString(pTable, pKey, da)
	SaveDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey), da)
end
function YDWEGetDestructableByInteger(pTable, pKey)
	return LoadDestructableHandle(YDHT, pTable, pKey)
end
function YDWEGetDestructableByString(pTable, pKey)
	return LoadDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert triggercondition
function YDWESaveTriggerConditionByInteger(pTable, pKey, tc)
	SaveTriggerConditionHandle(YDHT, pTable, pKey, tc)
end
function YDWESaveTriggerConditionByString(pTable, pKey, tc)
	SaveTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey), tc)
end
function YDWEGetTriggerConditionByInteger(pTable, pKey)
	return LoadTriggerConditionHandle(YDHT, pTable, pKey)
end
function YDWEGetTriggerConditionByString(pTable, pKey)
	return LoadTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert triggeraction
function YDWESaveTriggerActionByInteger(pTable, pKey, ta)
	SaveTriggerActionHandle(YDHT, pTable, pKey, ta)
end
function YDWESaveTriggerActionByString(pTable, pKey, ta)
	SaveTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
end
function YDWEGetTriggerActionByInteger(pTable, pKey)
	return LoadTriggerActionHandle(YDHT, pTable, pKey)
end
function YDWEGetTriggerActionByString(pTable, pKey)
	return LoadTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert event
function YDWESaveTriggerEventByInteger(pTable, pKey, et)
	SaveTriggerEventHandle(YDHT, pTable, pKey, et)
end
function YDWESaveTriggerEventByString(pTable, pKey, et)
	SaveTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey), et)
end
function YDWEGetTriggerEventByInteger(pTable, pKey)
	return LoadTriggerEventHandle(YDHT, pTable, pKey)
end
function YDWEGetTriggerEventByString(pTable, pKey)
	return LoadTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert force
function YDWESaveForceByInteger(pTable, pKey, fc)
	SaveForceHandle(YDHT, pTable, pKey, fc)
end
function YDWESaveForceByString(pTable, pKey, fc)
	SaveForceHandle(YDHT, StringHash(pTable), StringHash(pKey), fc)
end
function YDWEGetForceByInteger(pTable, pKey)
	return LoadForceHandle(YDHT, pTable, pKey)
end
function YDWEGetForceByString(pTable, pKey)
	return LoadForceHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert boolexpr
function YDWESaveBoolexprByInteger(pTable, pKey, be)
	SaveBooleanExprHandle(YDHT, pTable, pKey, be)
end
function YDWESaveBoolexprByString(pTable, pKey, be)
	SaveBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey), be)
end
function YDWEGetBoolexprByInteger(pTable, pKey)
	return LoadBooleanExprHandle(YDHT, pTable, pKey)
end
function YDWEGetBoolexprByString(pTable, pKey)
	return LoadBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert sound
function YDWESaveSoundByInteger(pTable, pKey, sd)
	SaveSoundHandle(YDHT, pTable, pKey, sd)
end
function YDWESaveSoundByString(pTable, pKey, sd)
	SaveSoundHandle(YDHT, StringHash(pTable), StringHash(pKey), sd)
end
function YDWEGetSoundByInteger(pTable, pKey)
	return LoadSoundHandle(YDHT, pTable, pKey)
end
function YDWEGetSoundByString(pTable, pKey)
	return LoadSoundHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert timerdialog
function YDWESaveTimerDialogByInteger(pTable, pKey, td)
	SaveTimerDialogHandle(YDHT, pTable, pKey, td)
end
function YDWESaveTimerDialogByString(pTable, pKey, td)
	SaveTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), td)
end
function YDWEGetTimerDialogByInteger(pTable, pKey)
	return LoadTimerDialogHandle(YDHT, pTable, pKey)
end
function YDWEGetTimerDialogByString(pTable, pKey)
	return LoadTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert trackable
function YDWESaveTrackableByInteger(pTable, pKey, ta)
	SaveTrackableHandle(YDHT, pTable, pKey, ta)
end
function YDWESaveTrackableByString(pTable, pKey, ta)
	SaveTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
end
function YDWEGetTrackableByInteger(pTable, pKey)
	return LoadTrackableHandle(YDHT, pTable, pKey)
end
function YDWEGetTrackableByString(pTable, pKey)
	return LoadTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert dialog
function YDWESaveDialogByInteger(pTable, pKey, d)
	SaveDialogHandle(YDHT, pTable, pKey, d)
end
function YDWESaveDialogByString(pTable, pKey, d)
	SaveDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), d)
end
function YDWEGetDialogByInteger(pTable, pKey)
	return LoadDialogHandle(YDHT, pTable, pKey)
end
function YDWEGetDialogByString(pTable, pKey)
	return LoadDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert button
function YDWESaveButtonByInteger(pTable, pKey, bt)
	SaveButtonHandle(YDHT, pTable, pKey, bt)
end
function YDWESaveButtonByString(pTable, pKey, bt)
	SaveButtonHandle(YDHT, StringHash(pTable), StringHash(pKey), bt)
end
function YDWEGetButtonByInteger(pTable, pKey)
	return LoadButtonHandle(YDHT, pTable, pKey)
end
function YDWEGetButtonByString(pTable, pKey)
	return LoadButtonHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert quest
function YDWESaveQuestByInteger(pTable, pKey, qt)
	SaveQuestHandle(YDHT, pTable, pKey, qt)
end
function YDWESaveQuestByString(pTable, pKey, qt)
	SaveQuestHandle(YDHT, StringHash(pTable), StringHash(pKey), qt)
end
function YDWEGetQuestByInteger(pTable, pKey)
	return LoadQuestHandle(YDHT, pTable, pKey)
end
function YDWEGetQuestByString(pTable, pKey)
	return LoadQuestHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
--Covert questitem
function YDWESaveQuestItemByInteger(pTable, pKey, qi)
	SaveQuestItemHandle(YDHT, pTable, pKey, qi)
end
function YDWESaveQuestItemByString(pTable, pKey, qi)
	SaveQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey), qi)
end
function YDWEGetQuestItemByInteger(pTable, pKey)
	return LoadQuestItemHandle(YDHT, pTable, pKey)
end
function YDWEGetQuestItemByString(pTable, pKey)
	return LoadQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
end
function YDWES2I(s)
	return StringHash(s)
end
function YDWESaveAbilityHandleBJ(AbilityID, key, missionKey, table)
	SaveInteger(table, missionKey, key, AbilityID)
end
function YDWESaveAbilityHandle(table, parentKey, childKey, AbilityID)
	SaveInteger(table, parentKey, childKey, AbilityID)
end
function YDWELoadAbilityHandleBJ(key, missionKey, table)
	return LoadInteger(table, missionKey, key)
end
function YDWELoadAbilityHandle(table, parentKey, childKey)
	return LoadInteger(table, parentKey, childKey)
end
--===========================================================================
--返回参数
--===========================================================================
--地图边界判断
function YDWECoordinateX(x)
	return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
end
function YDWECoordinateY(y)
	return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
end
--两个单位之间的距离
function YDWEDistanceBetweenUnits(a, b)
	return SquareRoot((GetUnitX(a) - GetUnitX(b)) * (GetUnitX(a) - GetUnitX(b)) + (GetUnitY(a) - GetUnitY(b)) * (GetUnitY(a) - GetUnitY(b)))
end
--两个单位之间的角度
function YDWEAngleBetweenUnits(fromUnit, toUnit)
	return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
end
--生成区域
function YDWEGetRect(x, y, width, height)
	return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
end
--===========================================================================
--设置单位可以飞行
--===========================================================================
function YDWEFlyEnable(u)
	UnitAddAbility(u, 1097691750)
	UnitRemoveAbility(u, 1097691750)
end
--===========================================================================
--字符窜与ID转换
--===========================================================================
function YDWEId2S(value)
	local charMap = bj_AllString
	local result = ""
	local remainingValue = value
	local charValue
	local byteno
	byteno = 0
	for _ in _loop_() do
		charValue = ModuloInteger(remainingValue, 256)
		remainingValue = remainingValue // 256
		result = (SubString(charMap, charValue, charValue + 1) or "") .. (result or "")
		byteno = byteno + 1
		if byteno == 4 then break end
	end
	return result
end
function YDWES2Id(targetstr)
	local originstr = bj_AllString
	local strlength = StringLength(targetstr)
	local a = 0
	local b = 0
	local numx = 1
	local result = 0
	for _ in _loop_() do
		if b > strlength - 1 then break end
		numx = R2I(Pow(256, strlength - 1 - b))
		a = 1
		for _ in _loop_() do
			if a > 255 then break end
			if SubString(targetstr, b, b + 1) == SubString(originstr, a, a + 1) then
				result = result + a * numx
				a = 256
			end
			a = a + 1
		end
		b = b + 1
	end
	return result
end
function YDWES2UnitId(targetstr)
	return YDWES2Id(targetstr)
end
function YDWES2ItemId(targetstr)
	return YDWES2Id(targetstr)
end
function GetLastAbilityCastingUnit()
	return bj_lastAbilityCastingUnit
end
function GetLastAbilityTargetUnit()
	return bj_lastAbilityTargetUnit
end
function YDWESetMapLimitCoordinate(MinX, MaxX, MinY, MaxY)
	yd_MapMaxX = MaxX
	yd_MapMinX = MinX
	yd_MapMaxY = MaxY
	yd_MapMinY = MinY
end
--===========================================================================
--===========================================================================
--地图初始化
--===========================================================================
--YDWE特殊技能结束事件 
function YDWESyStemAbilityCastingOverTriggerAction(hero, index)
	local i = 0
	for _ in _loop_() do
		if i >= YDWEBase___AbilityCastingOverEventNumber then break end
		if YDWEBase___AbilityCastingOverEventType[i] == index then
			bj_lastAbilityCastingUnit = hero
			if YDWEBase___AbilityCastingOverEventQueue[i] ~= nil and TriggerEvaluate(YDWEBase___AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase___AbilityCastingOverEventQueue[i]) then
				TriggerExecute(YDWEBase___AbilityCastingOverEventQueue[i])
			end
		end
		i = i + 1
	end
end
--===========================================================================  
--YDWE技能捕捉事件 
--===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger(trg, index)
	YDWEBase___AbilityCastingOverEventQueue[YDWEBase___AbilityCastingOverEventNumber] = trg
	YDWEBase___AbilityCastingOverEventType[YDWEBase___AbilityCastingOverEventNumber] = index
	YDWEBase___AbilityCastingOverEventNumber = YDWEBase___AbilityCastingOverEventNumber + 1
end
--===========================================================================
--系统函数完善
--===========================================================================
function YDWECreateUnitPool()
	bj_lastCreatedUnitPool = CreateUnitPool()
end
function YDWEPlaceRandomUnit(up, p, x, y, face)
	bj_lastPoolAbstractedUnit = PlaceRandomUnit(up, p, x, y, face)
end
function YDWEGetLastUnitPool()
	return bj_lastCreatedUnitPool
end
function YDWEGetLastPoolAbstractedUnit()
	return bj_lastPoolAbstractedUnit
end
function YDWECreateItemPool()
	bj_lastCreatedItemPool = CreateItemPool()
end
function YDWEPlaceRandomItem(ip, x, y)
	bj_lastPoolAbstractedItem = PlaceRandomItem(ip, x, y)
end
function YDWEGetLastItemPool()
	return bj_lastCreatedItemPool
end
function YDWEGetLastPoolAbstractedItem()
	return bj_lastPoolAbstractedItem
end
function YDWESetAttackDamageWeaponType(at, dt, wt)
	bj_lastSetAttackType = at
	bj_lastSetDamageType = dt
	bj_lastSetWeaponType = wt
end
--unitpool bj_lastCreatedPool=null
--unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString(p, s)
	return (YDWEBase___yd_PlayerColor[GetHandleId(GetPlayerColor(p))] or "") .. (s or "") .. "|r"
end
--===========================================================================
--===========================================================================
--系统函数补充
--===========================================================================
--===========================================================================
function YDWEGetUnitItemSoftId(hero, it)
	local i = 0
	for _ in _loop_() do
		if i > 5 then break end
		if UnitItemInSlot(hero, i) == it then
			return i + 1
		end
		i = i + 1
	end
	return 0
end
--===========================================================================
--===========================================================================
--地图初始化
--===========================================================================
--===========================================================================
--显示版本
function YDWEVersion_Display()
	DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FF当前编辑器版本为： |r|cFF00FF00YDWE 0.0.0.0")
	return false
end
function YDWEVersion_Init()
	local t = CreateTrigger()
	local i = 0
	for _ in _loop_() do
		if i == 12 then break end
		TriggerRegisterPlayerChatEvent(t, Player(i), "YDWE Version", true)
		i = i + 1
	end
	TriggerAddCondition(t, Condition(YDWEVersion_Display))
	t = nil
end
function InitializeYD()
	YDHT = InitHashtable()
	--=================设置变量=====================
	yd_MapMinX = GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	yd_MapMinY = GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	yd_MapMaxX = GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	yd_MapMaxY = GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)

	YDWEBase___yd_PlayerColor[0] = "|cFFFF0303"
	YDWEBase___yd_PlayerColor[1] = "|cFF0042FF"
	YDWEBase___yd_PlayerColor[2] = "|cFF1CE6B9"
	YDWEBase___yd_PlayerColor[3] = "|cFF540081"
	YDWEBase___yd_PlayerColor[4] = "|cFFFFFC01"
	YDWEBase___yd_PlayerColor[5] = "|cFFFE8A0E"
	YDWEBase___yd_PlayerColor[6] = "|cFF20C000"
	YDWEBase___yd_PlayerColor[7] = "|cFFE55BB0"
	YDWEBase___yd_PlayerColor[8] = "|cFF959697"
	YDWEBase___yd_PlayerColor[9] = "|cFF7EBFF1"
	YDWEBase___yd_PlayerColor[10] = "|cFF106246"
	YDWEBase___yd_PlayerColor[11] = "|cFF4E2A04"
	YDWEBase___yd_PlayerColor[12] = "|cFF282828"
	YDWEBase___yd_PlayerColor[13] = "|cFF282828"
	YDWEBase___yd_PlayerColor[14] = "|cFF282828"
	YDWEBase___yd_PlayerColor[15] = "|cFF282828"
	--=================显示版本=====================
	YDWEVersion_Init()
end

--library YDWEBase ends
--library YDWETriggerEvent:

--===========================================================================  
--���ⵥλ�˺��¼� 
--===========================================================================
function YDWEAnyUnitDamagedTriggerAction()
	local i = 0

	for _ in _loop_() do
		if i >= YDWETriggerEvent___DamageEventNumber then break end
		if YDWETriggerEvent___DamageEventQueue[i] ~= nil and IsTriggerEnabled(YDWETriggerEvent___DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent___DamageEventQueue[i]) then
			TriggerExecute(YDWETriggerEvent___DamageEventQueue[i])
		end
		i = i + 1
	end
end
function YDWEAnyUnitDamagedFilter()
	if GetUnitAbilityLevel(GetFilterUnit(), 1097625443) <= 0 then
		TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
	end
	return false
end
function YDWEAnyUnitDamagedEnumUnit()
	local t = CreateTrigger()
	local r = CreateRegion()
	local g = CreateGroup()
	RegionAddRect(r, GetWorldBounds())
	TriggerRegisterEnterRegion(t, r, Condition(YDWEAnyUnitDamagedFilter))
	GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(YDWEAnyUnitDamagedFilter))
	DestroyGroup(g)
	r = nil
	t = nil
	g = nil
end

function YDWESyStemAnyUnitDamagedRegistTrigger(trg)
	if trg == nil then
		return
	end

	if YDWETriggerEvent___DamageEventNumber == 0 then
		yd_DamageEventTrigger = CreateTrigger()
		TriggerAddAction(yd_DamageEventTrigger, YDWEAnyUnitDamagedTriggerAction)
		YDWEAnyUnitDamagedEnumUnit()
	end

	YDWETriggerEvent___DamageEventQueue[YDWETriggerEvent___DamageEventNumber] = trg
	YDWETriggerEvent___DamageEventNumber = YDWETriggerEvent___DamageEventNumber + 1
end
--===========================================================================  
--�ƶ���Ʒ�¼� 
--===========================================================================  
function YDWESyStemItemUnmovableTriggerAction()
	local i = 0

	if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		bj_lastMovedItemInItemSlot = GetOrderTargetItem()
		for _ in _loop_() do
			if i >= YDWETriggerEvent___MoveItemEventNumber then break end
			if YDWETriggerEvent___MoveItemEventQueue[i] ~= nil and IsTriggerEnabled(YDWETriggerEvent___MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent___MoveItemEventQueue[i]) then
				TriggerExecute(YDWETriggerEvent___MoveItemEventQueue[i])
			end
			i = i + 1
		end
	end
end
function YDWESyStemItemUnmovableRegistTrigger(trg)
	if trg == nil then
		return
	end

	if YDWETriggerEvent___MoveItemEventNumber == 0 then
		YDWETriggerEvent___MoveItemEventTrigger = CreateTrigger()
		TriggerAddAction(YDWETriggerEvent___MoveItemEventTrigger, YDWESyStemItemUnmovableTriggerAction)
		TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent___MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
	end

	YDWETriggerEvent___MoveItemEventQueue[YDWETriggerEvent___MoveItemEventNumber] = trg
	YDWETriggerEvent___MoveItemEventNumber = YDWETriggerEvent___MoveItemEventNumber + 1
end
function GetLastMovedItemInItemSlot()
	return bj_lastMovedItemInItemSlot
end

--library YDWETriggerEvent ends
--library MeatHook:
--****************************//
--* ����-���� Fetrix_sai���� *//
--****************************//

function MeatHook__GetUnitZ(u)
	MoveLocation(MeatHook__Point, GetUnitX(u), GetUnitY(u))
	return GetUnitFlyHeight(u) + GetLocationZ(MeatHook__Point)
end

function MeatHook__HookAim(key, pudge, x, y, z)
	local damage = LoadReal(YDHT, StringHash(key), StringHash("Damage")) -- INLINED!!
	local g = CreateGroup()
	local f = nil
	GroupEnumUnitsInRange(g, x, y, 120.0, nil)
	for _ in _loop_() do
		f = FirstOfGroup(g)
		if f == nil then break end
		if GetWidgetLife(f) > 0.405 and not IsUnitType(f, UNIT_TYPE_STRUCTURE) and not IsUnitInGroup(f, MeatHook__Except) and f ~= pudge then
			if (GetUnitX(f) - x) * (GetUnitX(f) - x) + (GetUnitY(f) - y) * (GetUnitY(f) - y) + (MeatHook__GetUnitZ(f) - z) * (MeatHook__GetUnitZ(f) - z) < 14400 then
				--* ���ұ����ӹ����ˣ�ʹ��غ���һ��������~��
				bj_lastAbilityTargetUnit = f
				YDWESyStemAbilityCastingOverTriggerAction(pudge, 4)
				SaveInteger(YDHT, StringHash(key), StringHash("Switch"), 2) -- INLINED!!
				SaveUnitHandle(YDHT, StringHash(key), StringHash("Target"), f) -- INLINED!!
				if IsUnitEnemy(f, GetOwningPlayer(pudge)) then
					DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", f, "origin"))
					UnitDamageTarget(pudge, f, damage, true, false, bj_lastSetAttackType, bj_lastSetDamageType, bj_lastSetWeaponType)
				end
				IssueImmediateOrderById(f, 851972)
				GroupAddUnit(MeatHook__Except, f)
				if true then break end
			end
		end
		GroupRemoveUnit(g, f)
		f = nil
	end
	DestroyGroup(g)
	g = nil
	f = nil
end

function MeatHook__Cycle()
	local key = I2S(GetHandleId(GetExpiredTimer())) -- INLINED!!
	local total = LoadInteger(YDHT, StringHash(key), StringHash("ChainLinkNumber")) -- INLINED!!
	local size = LoadInteger(YDHT, StringHash(key), StringHash("ChainLinkNumberMax")) -- INLINED!!
	local utid = LoadInteger(YDHT, StringHash(key), StringHash("ChainLinkId")) -- INLINED!!
	local switch = LoadInteger(YDHT, StringHash(key), StringHash("Switch")) -- INLINED!!
	local pudge = LoadUnitHandle(YDHT, StringHash(key), StringHash("Pudge")) -- INLINED!!
	local target = LoadUnitHandle(YDHT, StringHash(key), StringHash("Target")) -- INLINED!!
	local dist = LoadReal(YDHT, StringHash(key), StringHash("Distance")) -- INLINED!!
	local l
	local f
	local x
	local y
	local xvel
	local yvel
	local part = _array_()
	local i = 0

	for _ in _loop_() do
		if i == total then break end
		part[i] = LoadUnitHandle(YDHT, StringHash(key), StringHash("ChainLinks" .. (I2S(i) or ""))) -- INLINED!!
		i = i + 1
	end

	--*===== Hook Target =====*
	if target == nil then
		MeatHook__HookAim(key, pudge, GetUnitX(part[0]), GetUnitY(part[0]), MeatHook__GetUnitZ(part[0]))
	else
		SetUnitX(target, GetUnitX(part[0]))
		SetUnitY(target, GetUnitY(part[0]))
		if GetLocalPlayer() == GetOwningPlayer(target) then
			SelectUnit(target, false)
		end
	end

	--*===== Stretch =====*
	if switch == 1 then
		--*===== Chain Head =====*
		x = GetUnitX(part[0]) + LoadReal(YDHT, StringHash(key), StringHash("VelocityX")) -- INLINED!!
		y = GetUnitY(part[0]) + LoadReal(YDHT, StringHash(key), StringHash("VelocityY")) -- INLINED!!
		SetUnitX(part[0], x)
		SetUnitY(part[0], y)
		--call SetUnitFacing(part[i], YDWEGetRealByString(key, "Face"))
		if RMinBJ(RMaxBJ(x * 1.0, yd_MapMinX), yd_MapMaxX) ~= x or RMinBJ(RMaxBJ(y * 1.0, yd_MapMinY), yd_MapMaxY) ~= y then -- INLINED!!
			SaveInteger(YDHT, StringHash(key), StringHash("Switch"), 2) -- INLINED!!
		end
		--*===== Chain Links =====*
		i = 1
		for _ in _loop_() do
			if i == total then break end
			f = Atan2(GetUnitY(part[i - 1]) - GetUnitY(part[i]), GetUnitX(part[i - 1]) - GetUnitX(part[i]))
			SetUnitX(part[i], GetUnitX(part[i]) + Cos(f) * 40.0)
			SetUnitY(part[i], GetUnitY(part[i]) + Sin(f) * 40.0)
			SetUnitFacing(part[i], f * bj_RADTODEG)
			i = i + 1
		end
	elseif switch == 2 then
		l = (50.0 + 40.0) * (50.0 + 40.0)
		i = total - 1
		--*===== Move Back =====*
		for _ in _loop_() do
			if i < 0 then break end
			if part[i + 1] == nil then
				xvel = GetUnitX(part[i]) - GetUnitX(pudge)
				yvel = GetUnitY(part[i]) - GetUnitY(pudge)
				if xvel * xvel + yvel * yvel <= l then
					RemoveUnit(part[i])
					part[i] = nil
					total = total - 1
					SaveInteger(YDHT, StringHash(key), StringHash("ChainLinkNumber"), total) -- INLINED!!
				end
			else
				xvel = GetUnitX(part[i]) - GetUnitX(part[i + 1])
				yvel = GetUnitY(part[i]) - GetUnitY(part[i + 1])
			end

			if part[i] ~= nil then
				f = Atan2(yvel, xvel)
				SetUnitX(part[i], GetUnitX(part[i]) - Cos(f) * 40.0)
				SetUnitY(part[i], GetUnitY(part[i]) - Sin(f) * 40.0)
				SetUnitFacing(part[i], f * bj_RADTODEG)
			end

			i = i - 1
		end
		if total < 1 then
			SaveInteger(YDHT, StringHash(key), StringHash("Switch"), 0) -- INLINED!!
			switch = 0
		end
	end

	--*===== Fill Chain =====*
	if switch > 0 then
		x = GetUnitX(part[total - 1])
		y = GetUnitY(part[total - 1])
		xvel = x - GetUnitX(pudge)
		yvel = y - GetUnitY(pudge)
		l = SquareRoot(xvel * xvel + yvel * yvel)

		if l > dist + 50.0 then
			f = bj_RADTODEG * Atan2(yvel, xvel)
			xvel = xvel * (dist / l)
			yvel = yvel * (dist / l)
			for _ in _loop_() do
				if l < dist then break end
				if total > size then
					SaveInteger(YDHT, StringHash(key), StringHash("Switch"), 2) -- INLINED!!
					if true then break end
				end
				x = x - xvel
				y = y - yvel
				part[total] = CreateUnit(GetOwningPlayer(pudge), utid, x, y, f)
				SaveUnitHandle(YDHT, StringHash(key), StringHash("ChainLinks" .. (I2S(total) or "")), part[total]) -- INLINED!!
				total = total + 1
				l = l - dist
			end
			SaveInteger(YDHT, StringHash(key), StringHash("ChainLinkNumber"), total) -- INLINED!!
		end

		if l > 50.0 + 40.0 * 2 then
			l = (50.0 + 40.0) / dist
			xvel = xvel * l
			yvel = yvel * l
			SetUnitX(part[total - 1], GetUnitX(pudge) + xvel)
			SetUnitY(part[total - 1], GetUnitY(pudge) + yvel)
			SetUnitFacing(part[total - 1], Atan2(yvel, xvel) * bj_RADTODEG)

			i = total - 2
			for _ in _loop_() do
				if i < 0 then break end
				xvel = GetUnitX(part[i]) - GetUnitX(part[i + 1])
				yvel = GetUnitY(part[i]) - GetUnitY(part[i + 1])
				l = dist / SquareRoot(xvel * xvel + yvel * yvel)
				SetUnitX(part[i], GetUnitX(part[i + 1]) + xvel * l)
				SetUnitY(part[i], GetUnitY(part[i + 1]) + yvel * l)
				SetUnitFacing(part[i], Atan2(yvel, xvel) * bj_RADTODEG)
				i = i - 1
			end
		end
	end

	--*===== Release =====*
	if switch == 0 then
		YDWESyStemAbilityCastingOverTriggerAction(pudge, 5)
		FlushChildHashtable(YDHT, StringHash(key)) -- INLINED!!
		GroupRemoveUnit(MeatHook__Except, target)
		PauseTimer(GetExpiredTimer())
		DestroyTimer(GetExpiredTimer())
	end

	i = 0
	for _ in _loop_() do
		if i >= total then break end
		part[i] = nil
		i = i + 1
	end

	target = nil
	pudge = nil
	key = ""
end

function YDWEMeatHook(pudge, point, headid, chainid, length, distance, damage, timeout)
	local f = Atan2(GetLocationY(point) - GetUnitY(pudge), GetLocationX(point) - GetUnitX(pudge))
	local x = Cos(f) * 50.0
	local y = Sin(f) * 50.0
	local u = CreateUnit(GetOwningPlayer(pudge), headid, GetUnitX(pudge) + x, GetUnitY(pudge) + y, f * bj_RADTODEG)
	local t = CreateTimer()
	-- *===== Save =====*
	SaveUnitHandle(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Pudge"), pudge) -- INLINED!!
	SaveUnitHandle(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("ChainLinks" .. (I2S(0) or "")), u) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("VelocityX"), x * (40.0 / 50.0) * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("VelocityY"), y * (40.0 / 50.0) * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Face"), f * bj_RADTODEG * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Distance"), distance * 1.0) -- INLINED!!
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Switch"), 1) -- INLINED!!
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("ChainLinkId"), chainid) -- INLINED!!
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("ChainLinkNumberMax"), R2I(length / distance)) -- INLINED!!
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("ChainLinkNumber"), 1) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Damage"), damage * 1.0) -- INLINED!!
	TimerStart(t, timeout, true, MeatHook__Cycle)
	-- *===== end =====*
	u = nil
	t = nil
end

--library MeatHook ends
--library YDWEAroundSystem:
--library TP1 requires YDWEBase
function YDWEAroundSystem___spin()
	local d = 0
	local x = 0.0
	local y = 0.0
	local inst = 0

	for _ in _loop_() do
		if inst == s__YDWEAroundSystem___Data_Total then break end
		d = s__YDWEAroundSystem___Data_Structs[inst]
		if s__YDWEAroundSystem___Data_dur[d] > 0 and GetUnitState(s__YDWEAroundSystem___Data_caster[d], UNIT_STATE_LIFE) > 0.405 and GetUnitState(s__YDWEAroundSystem___Data_obj[d], UNIT_STATE_LIFE) > 0.405 then
			s__YDWEAroundSystem___Data_each[d] = s__YDWEAroundSystem___Data_each[d] + YDWEAroundSystem___AROUND_INTER
			if s__YDWEAroundSystem___Data_each[d] >= s__YDWEAroundSystem___Data_inter[d] then
				s__YDWEAroundSystem___Data_angle[d] = s__YDWEAroundSystem___Data_angle[d] + s__YDWEAroundSystem___Data_rate[d]
				s__YDWEAroundSystem___Data_radius[d] = s__YDWEAroundSystem___Data_radius[d] + s__YDWEAroundSystem___Data_dis[d]
				s__YDWEAroundSystem___Data_height[d] = s__YDWEAroundSystem___Data_height[d] + s__YDWEAroundSystem___Data_rise[d]
				x = GetUnitX(s__YDWEAroundSystem___Data_caster[d]) + s__YDWEAroundSystem___Data_radius[d] * Cos(s__YDWEAroundSystem___Data_angle[d])
				y = GetUnitY(s__YDWEAroundSystem___Data_caster[d]) + s__YDWEAroundSystem___Data_radius[d] * Sin(s__YDWEAroundSystem___Data_angle[d])
				x = RMinBJ(RMaxBJ(x * 1.0, yd_MapMinX), yd_MapMaxX) -- INLINED!!
				y = RMinBJ(RMaxBJ(y * 1.0, yd_MapMinY), yd_MapMaxY) -- INLINED!!
				SetUnitX(s__YDWEAroundSystem___Data_obj[d], x)
				SetUnitY(s__YDWEAroundSystem___Data_obj[d], y)
				SetUnitFlyHeight(s__YDWEAroundSystem___Data_obj[d], s__YDWEAroundSystem___Data_height[d], 0.0)
				s__YDWEAroundSystem___Data_each[d] = 0.0
			end
			s__YDWEAroundSystem___Data_dur[d] = s__YDWEAroundSystem___Data_dur[d] - YDWEAroundSystem___AROUND_INTER
		else
			bj_lastAbilityTargetUnit = s__YDWEAroundSystem___Data_caster[d]
			YDWESyStemAbilityCastingOverTriggerAction(s__YDWEAroundSystem___Data_obj[d], 10)
			s__YDWEAroundSystem___Data_caster[d] = nil
			s__YDWEAroundSystem___Data_obj[d] = nil
			s__YDWEAroundSystem___Data_deallocate(d)
			s__YDWEAroundSystem___Data_Total = s__YDWEAroundSystem___Data_Total - 1
			s__YDWEAroundSystem___Data_Structs[inst] = s__YDWEAroundSystem___Data_Structs[s__YDWEAroundSystem___Data_Total]
			inst = inst - 1
		end
		inst = inst + 1
	end
	if s__YDWEAroundSystem___Data_Total == 0 then
		PauseTimer(YDWEAroundSystem___AROUND_TIM)
	end
end
function YDWEAroundSystem(satellite, star, angleRate, displacement, riseRate, timeout, interval)
	local d = s__YDWEAroundSystem___Data__allocate()
	local x1 = GetUnitX(star)
	local y1 = GetUnitY(star)
	local x2 = GetUnitX(satellite)
	local y2 = GetUnitY(satellite)
	s__YDWEAroundSystem___Data_caster[d] = star
	s__YDWEAroundSystem___Data_obj[d] = satellite
	s__YDWEAroundSystem___Data_dur[d] = timeout
	s__YDWEAroundSystem___Data_inter[d] = interval
	s__YDWEAroundSystem___Data_rate[d] = angleRate * (3.14159 / 180.0)
	s__YDWEAroundSystem___Data_dis[d] = displacement
	s__YDWEAroundSystem___Data_rise[d] = riseRate
	s__YDWEAroundSystem___Data_angle[d] = Atan2(y2 - y1, x2 - x1)
	s__YDWEAroundSystem___Data_radius[d] = SquareRoot((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
	s__YDWEAroundSystem___Data_height[d] = GetUnitFlyHeight(s__YDWEAroundSystem___Data_obj[d])
	s__YDWEAroundSystem___Data_Structs[s__YDWEAroundSystem___Data_Total] = d
	s__YDWEAroundSystem___Data_Total = s__YDWEAroundSystem___Data_Total + 1
	if s__YDWEAroundSystem___Data_Total - 1 == 0 then
		TimerStart(YDWEAroundSystem___AROUND_TIM, YDWEAroundSystem___AROUND_INTER, true, YDWEAroundSystem___spin)
	end
end


--library YDWEAroundSystem ends
--library YDWEJumpTimer:
function YDWEJumpTimerLoop()
	local t = GetExpiredTimer()
	local hero = LoadUnitHandle(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Hero")) -- INLINED!!
	local angle = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Angle")) -- INLINED!!
	local steeps = LoadInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("steeps")) -- INLINED!!
	local steepsMax = LoadInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("steepsMax")) -- INLINED!!
	local heightMax = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("heightMax")) -- INLINED!!
	local dist = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("dist")) -- INLINED!!
	local dheig = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("dheig")) -- INLINED!!
	local OriginHeight = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("OriginHeight")) -- INLINED!!
	local x = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("X")) -- INLINED!!
	local y = LoadReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Y")) -- INLINED!!
	local x1 = 0
	local y1 = 0
	local height = 0
	local lvJumpTimer = MoveMoreLevel_JumpTimer
	local lvUnitMove = LoadInteger(YDHT, StringHash(I2S(GetHandleId(hero))), StringHash("lvUnitMove")) -- INLINED!!
	if steeps < steepsMax and lvJumpTimer >= lvUnitMove then
		x1 = x + steeps * dist * Cos(angle * 3.14159 / 180.0)
		y1 = y + steeps * dist * Sin(angle * 3.14159 / 180.0)
		x1 = RMinBJ(RMaxBJ(x1 * 1.0, yd_MapMinX), yd_MapMaxX) -- INLINED!!
		y1 = RMinBJ(RMaxBJ(y1 * 1.0, yd_MapMinY), yd_MapMaxY) -- INLINED!!
		SetUnitX(hero, x1)
		SetUnitY(hero, y1)
		steeps = steeps + 1
		SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("steeps"), steeps) -- INLINED!!
		height = ( - (2 * I2R(steeps) * dheig - 1) * (2 * I2R(steeps) * dheig - 1) + 1) * heightMax + OriginHeight
		SetUnitFlyHeight(hero, height, 99999)
		SetUnitFacing(hero, angle)
	else
		SetUnitFlyHeight(hero, OriginHeight, 99999)
		SetUnitPathing(hero, true)
		DestroyTimer(t)
		FlushChildHashtable(YDHT, StringHash(I2S(GetHandleId(t)))) -- INLINED!!
		SaveInteger(YDHT, StringHash(I2S(GetHandleId(hero))), StringHash("lvUnitMove"), 0) -- INLINED!!
		YDWESyStemAbilityCastingOverTriggerAction(hero, 2)
	end
	t = nil
	hero = nil
end

function YDWEJumpTimer(hero, angle, distance, lasttime, timeout, heightMax)
	local t = nil
	local x = GetUnitX(hero)
	local y = GetUnitY(hero)
	local steepsMax = R2I(lasttime / timeout)
	local steeps = 0
	local dist = distance / steepsMax
	local dheig = 1.0 / steepsMax
	local OriginHeight = GetUnitFlyHeight(hero)
	local lvUnitMove = LoadInteger(YDHT, StringHash(I2S(GetHandleId(hero))), StringHash("lvUnitMove")) -- INLINED!!
	if MoveMoreLevel_JumpTimer <= lvUnitMove then
		return
	end
	t = CreateTimer()
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(hero))), StringHash("lvUnitMove"), MoveMoreLevel_JumpTimer) -- INLINED!!
	YDWEFlyEnable(hero)
	SetUnitPathing(hero, false)
	SaveUnitHandle(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Hero"), hero) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("OriginHeight"), OriginHeight * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Angle"), angle * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("dist"), dist * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("heightMax"), heightMax * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("dheig"), dheig * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("X"), x * 1.0) -- INLINED!!
	SaveReal(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("Y"), y * 1.0) -- INLINED!!
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("steeps"), steeps) -- INLINED!!
	SaveInteger(YDHT, StringHash(I2S(GetHandleId(t))), StringHash("steepsMax"), steepsMax) -- INLINED!!
	TimerStart(t, timeout, true, YDWEJumpTimerLoop)
	t = nil
end

--library YDWEJumpTimer ends
--library YDWEStringFormula:
function GetLastCombinedItem()
	return bj_lastCombinedItem
end
--===========================================================================
--��Ʒ�ϳ�
function YDWESyStemItemCombineTriggerAction()
	local i = 0
	for _ in _loop_() do
		if i >= YDWEStringFormula___ItemCombineEventNumber then break end
		if YDWEStringFormula___ItemCombineEventQueue[i] ~= nil and TriggerEvaluate(YDWEStringFormula___ItemCombineEventQueue[i]) and IsTriggerEnabled(YDWEStringFormula___ItemCombineEventQueue[i]) then
			TriggerExecute(YDWEStringFormula___ItemCombineEventQueue[i])
		end
		i = i + 1
	end
end
--GetLastMovedItemInItemSlot 
--===========================================================================  
--��Ʒ�ϳ��¼� 
--===========================================================================  
function YDWESyStemItemCombineRegistTrigger(trg)
	YDWEStringFormula___ItemCombineEventQueue[YDWEStringFormula___ItemCombineEventNumber] = trg
	YDWEStringFormula___ItemCombineEventNumber = YDWEStringFormula___ItemCombineEventNumber + 1
end
function s__YDWEStringFormula___Inventory_reset(this)
	FlushChildHashtable(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or ""))) -- INLINED!!
end

function s__YDWEStringFormula___Inventory_onDestroy(this)
	FlushChildHashtable(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or ""))) -- INLINED!!
end

function s__YDWEStringFormula___StringTable__getindex(this, key)
	return LoadInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or "")), StringHash(key)) -- INLINED!!
end

function s__YDWEStringFormula___StringTable__setindex(this, key, value)
	SaveInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or "")), StringHash(key), value) -- INLINED!!
end

function s__YDWEStringFormula___StringTable_flush(this, key)
	RemoveSavedInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or "")), StringHash(key)) -- INLINED!!
end

function s__YDWEStringFormula___StringTable_exists(this, key)
	return HaveSavedInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or "")), StringHash(key)) -- INLINED!!
end
--***************************************************************
--* StringFormula 2.0 - Fetrix_sai
--* ------------
--*
--***************************************************************

function YDWEStringFormula___Convert(value, length)
	local Char = I2S(value)
	local slen = StringLength(Char)

	for _ in _loop_() do
		if slen >= length then break end
		Char = "0" .. (Char or "")
		slen = slen + 1
	end

	return Char
end


--//////////////////////////////////////////////////////////
--////////////////// __ItemId Matrix__ /////////////////////



function s__YDWEStringFormula___ItemIdMatrix_get(id)
	return LoadInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___ItemIdMatrix_Data) or "")), StringHash(I2S(id))) -- INLINED!!
end

function s__YDWEStringFormula___ItemIdMatrix_exists(id)
	return HaveSavedInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___ItemIdMatrix_Data) or "")), StringHash(I2S(id))) -- INLINED!!
end

function s__YDWEStringFormula___ItemIdMatrix_sub(this, segment)
	local start = s__YDWEStringFormula___ItemIdMatrix_keyLen[this] * segment + 1
	return S2I(SubString(s__YDWEStringFormula___ItemIdMatrix_keyStr[this], start, start + s__YDWEStringFormula___ItemIdMatrix_keyLen[this]))
end

function s__YDWEStringFormula___ItemIdMatrix_assigns(id)
	local this = 0
	if id == nil or id == 0 then
		return 0
	end

	this = LoadInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___ItemIdMatrix_Data) or "")), StringHash(I2S(id))) -- INLINED!!

	if this > 0 then
		return this
	end

	this = s__YDWEStringFormula___ItemIdMatrix_Total
	s__YDWEStringFormula___ItemIdMatrix_itemId[this] = id
	s__YDWEStringFormula___ItemIdMatrix_keyStr[this] = I2S(YDWEStringFormula___SEGMENT_LENGTH)
	s__YDWEStringFormula___ItemIdMatrix_keyLen[this] = YDWEStringFormula___SEGMENT_LENGTH
	SaveInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___ItemIdMatrix_Data) or "")), StringHash(I2S(id)), this) -- INLINED!!
	s__YDWEStringFormula___ItemIdMatrix_Total = s__YDWEStringFormula___ItemIdMatrix_Total + 1
	return this
end

function s__YDWEStringFormula___ItemIdMatrix_memory(this, key)
	s__YDWEStringFormula___ItemIdMatrix_keyStr[this] = (s__YDWEStringFormula___ItemIdMatrix_keyStr[this] or "") .. (key or "")
--debug call BJDebugMsg("|cff00ff00KEY: |r" + .keyStr)
end

function s__YDWEStringFormula___ItemIdMatrix_onInit()
	s__YDWEStringFormula___ItemIdMatrix_Data = s__YDWEStringFormula___StringTable__allocate()
end

--//////////////// __End of ItemId Matrix__ ////////////////
--//////////////////////////////////////////////////////////


--//////////////////////////////////////////////////////////
--////////////////// __Formula Matrix__ ////////////////////






function s__YDWEStringFormula___FormulaMatrix_exists(s)
	return HaveSavedInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___FormulaMatrix_Data) or "")), StringHash(s)) -- INLINED!!
end

function s__YDWEStringFormula___FormulaMatrix_sub(this, segment)
	local start = s__YDWEStringFormula___FormulaMatrix_segmLen[this] * segment + 1
	return S2I(SubString(s__YDWEStringFormula___FormulaMatrix_formula[this], start, start + s__YDWEStringFormula___FormulaMatrix_segmLen[this]))
end

function s__YDWEStringFormula___FormulaMatrix_memory(lingth, formStr, eventually)
	local this = 0

	if HaveSavedInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___FormulaMatrix_Data) or "")), StringHash(formStr)) then -- INLINED!!
		--debug call BJDebugMsg("|cffff0000Registration cannot be repeated !!|r")
		return 0
	end

	this = s__YDWEStringFormula___FormulaMatrix_Total
	s__YDWEStringFormula___FormulaMatrix_formula[this] = (formStr or "") .. (YDWEStringFormula___Convert(eventually, YDWEStringFormula___SEGMENT_LENGTH) or "")
	s__YDWEStringFormula___FormulaMatrix_segmLen[this] = lingth

	s__YDWEStringFormula___FormulaMatrix_model[this] = nil --"Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl"
	s__YDWEStringFormula___FormulaMatrix_message[this] = nil --"|cff00ff00��ϳ��ˣ�|r" 
	s__YDWEStringFormula___FormulaMatrix_chance[this] = 100
	s__YDWEStringFormula___FormulaMatrix_delete[this] = false
	SaveInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___FormulaMatrix_Data) or "")), StringHash(formStr), this) -- INLINED!!
	s__YDWEStringFormula___FormulaMatrix_Total = s__YDWEStringFormula___FormulaMatrix_Total + 1

	--debug call BJDebugMsg("|cff00ff00Formula Register: |r" + I2S(integer(this)) + ". " + this.formula)
	return this
end

function s__YDWEStringFormula___FormulaMatrix_onInit()
	s__YDWEStringFormula___FormulaMatrix_Data = s__YDWEStringFormula___StringTable__allocate()
end


--//////////////// __End of Formula Matrix__ ///////////////
--//////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////
--////////////////// __Formula Sorting__ ///////////////////

function s__YDWEStringFormula___Sorting_onDestroy(this)
	local i = 0
	for _ in _loop_() do
		if i == s___YDWEStringFormula___Sorting_stack_size then break end
		s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] = 0
		s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] = 0
		i = i + 1
	end
	s__YDWEStringFormula___Sorting_char[this] = ""
end

--Generated destructor of YDWEStringFormula___Sorting
function s__YDWEStringFormula___Sorting_deallocate(this)
	if this == nil then
		return
	elseif si__YDWEStringFormula___Sorting_V[this] ~= -1 then
		return
	end
	s__YDWEStringFormula___Sorting_onDestroy(this)
	si__YDWEStringFormula___Sorting_V[this] = si__YDWEStringFormula___Sorting_F
	si__YDWEStringFormula___Sorting_F = this
end

function s__YDWEStringFormula___Sorting_create(type1, n1, type2, n2, type3, n3, type4, n4, type5, n5, type6, n6, type7, n7)
	local this = s__YDWEStringFormula___Sorting__allocate()

	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 1] = s__YDWEStringFormula___ItemIdMatrix_assigns(type1)
	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 2] = s__YDWEStringFormula___ItemIdMatrix_assigns(type2)
	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 3] = s__YDWEStringFormula___ItemIdMatrix_assigns(type3)
	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 4] = s__YDWEStringFormula___ItemIdMatrix_assigns(type4)
	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 5] = s__YDWEStringFormula___ItemIdMatrix_assigns(type5)
	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 6] = s__YDWEStringFormula___ItemIdMatrix_assigns(type6)
	s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + 7] = s__YDWEStringFormula___ItemIdMatrix_assigns(type7)

	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 1] = n1
	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 2] = n2
	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 3] = n3
	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 4] = n4
	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 5] = n5
	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 6] = n6
	s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + 7] = n7

	return this
end

function s__YDWEStringFormula___Sorting_convert(this)
	local i = 1
	local j
	local k

	s__YDWEStringFormula___Sorting_char[this] = ""
	for _ in _loop_() do
		if i > s__YDWEStringFormula___Sorting_total[this] then break end
		if s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] == 0 or s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] == 0 then
			s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] = s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + s__YDWEStringFormula___Sorting_total[this]]
			s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] = s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + s__YDWEStringFormula___Sorting_total[this]]
			s__YDWEStringFormula___Sorting_total[this] = s__YDWEStringFormula___Sorting_total[this] - 1
			i = i - 1
		else
			j = i + 1
			for _ in _loop_() do
				if j > s__YDWEStringFormula___Sorting_total[this] then break end
				if s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j] == 0 or s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + j] == 0 then
					s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j] = s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + s__YDWEStringFormula___Sorting_total[this]]
					s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + j] = s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + s__YDWEStringFormula___Sorting_total[this]]
					s__YDWEStringFormula___Sorting_total[this] = s__YDWEStringFormula___Sorting_total[this] - 1
					j = j - 1
				elseif s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] > s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j] then
					k = s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i]
					s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] = s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j]
					s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j] = k
					k = s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i]
					s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] = s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + j]
					s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + j] = k
				elseif s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] == s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j] then
					s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] = s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] + s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + j]
					s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + j] = 0
					j = j - 1
				end
				j = j + 1
			end

			j = s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i]
			for _ in _loop_() do
				if j == 0 then break end
				s__YDWEStringFormula___Sorting_char[this] = (s__YDWEStringFormula___Sorting_char[this] or "") .. (YDWEStringFormula___Convert(s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i], YDWEStringFormula___SEGMENT_LENGTH) or "")
				j = j - 1
			end
		end
		i = i + 1
	end

	return s__YDWEStringFormula___Sorting_char[this]
end

--//////////////// __End of Formula Sorting__ //////////////
--//////////////////////////////////////////////////////////


--//////////////////////////////////////////////////////////
--///////////////////// __Craft Item__ /////////////////////

function YDWEStringFormula___Adaptation()
	return true
end

function YDWEStringFormula___verify()
	return HaveSavedInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___ItemIdMatrix_Data) or "")), StringHash(I2S(GetItemTypeId(GetManipulatedItem())))) -- INLINED!!
end

function YDWEStringFormula___GetCharges(it)
	local charges = GetItemCharges(it)
	if charges == 0 then
		charges = 1
	end
	return charges
end

function YDWEStringFormula___CraftItem()
	local forx = 0
	local itmx = LoadInteger(YDHT, StringHash("YDWEStringFormula." .. (I2S(s__YDWEStringFormula___ItemIdMatrix_Data) or "")), StringHash(I2S(GetItemTypeId(GetManipulatedItem())))) -- INLINED!!
	local size = StringLength(s__YDWEStringFormula___ItemIdMatrix_keyStr[itmx]) // s__YDWEStringFormula___ItemIdMatrix_keyLen[itmx]
	local inst = 0
	local numb = 0
	local sum = 0

	local tmpid = 0
	local i = 0
	local j = 0
	local b = false
	local it = nil

	local article = GetManipulatedItem()
	local caster = GetTriggerUnit()

	local items = _array_()
	local typeid = _array_(0)
	local amount = _array_(0)
	local surplus = _array_(0)
	--* Check Slots
	i = 0
	for _ in _loop_() do
		if i == 6 then break end
		it = UnitItemInSlot(caster, i)

		if it ~= nil then
			items[sum] = it
			typeid[sum] = GetItemTypeId(it)
			amount[sum] = YDWEStringFormula___GetCharges(it)
			if it == article then
				b = true
			end
			sum = sum + 1
		end

		i = i + 1
		it = nil
	end

	if b == false then
		items[sum] = article
		typeid[sum] = GetItemTypeId(article)
		amount[sum] = 1
		sum = sum + 1
	end
	--* Check Formulas
	for _ in _loop_() do
		if inst == size then break end
		forx = s__YDWEStringFormula___ItemIdMatrix_sub(itmx, inst)
		numb = StringLength(s__YDWEStringFormula___FormulaMatrix_formula[forx]) // s__YDWEStringFormula___FormulaMatrix_segmLen[forx] - 1

		i = 0
		for _ in _loop_() do
			if i == sum then break end
			surplus[i] = amount[i]
			i = i + 1
		end

		i = 0
		for _ in _loop_() do
			tmpid = s__YDWEStringFormula___ItemIdMatrix_itemId[s__YDWEStringFormula___FormulaMatrix_sub(forx, i)]
			if i == numb then break end

			j = 0
			for _ in _loop_() do
				if j == sum then break end

				if typeid[j] == tmpid and surplus[j] > 0 then
					surplus[j] = surplus[j] - 1
					if true then break end
				end

				j = j + 1
			end

			if j == sum then break end
			i = i + 1
		end
		if i == numb then
			if GetRandomInt(0, 99) < s__YDWEStringFormula___FormulaMatrix_chance[forx] then
				if s__YDWEStringFormula___FormulaMatrix_model[forx] ~= nil then
					DestroyEffect(AddSpecialEffectTarget(s__YDWEStringFormula___FormulaMatrix_model[forx], caster, "origin"))
				end

				if s__YDWEStringFormula___FormulaMatrix_message[forx] ~= nil then
					DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, s__YDWEStringFormula___FormulaMatrix_message[forx])
				end

				i = 0
				for _ in _loop_() do
					if i == sum then break end
					if surplus[i] > 0 and GetItemCharges(items[i]) > 0 then
						SetItemCharges(items[i], surplus[i])
					elseif surplus[i] == 0 then
						RemoveItem(items[i])
					end
					i = i + 1
				end

				it = CreateItem(tmpid, GetUnitX(caster), GetUnitY(caster))

				if GetItemCharges(it) > 0 then
					SetItemCharges(it, 1)

					i = 0
					for _ in _loop_() do
						if i == sum then break end
						if typeid[i] == tmpid then
							RemoveItem(items[i])
							SetItemCharges(it, surplus[i] + 1)
						end
						i = i + 1
					end
				end

				UnitAddItem(caster, it)
				bj_lastCombinedItem = it
				YDWESyStemItemCombineTriggerAction()
			elseif s__YDWEStringFormula___FormulaMatrix_delete[forx] then
				i = 0
				for _ in _loop_() do
					if i == sum then break end
					if surplus[i] > 0 and GetItemCharges(items[i]) > 0 then
						SetItemCharges(items[i], surplus[i])
					elseif surplus[i] == 0 then
						RemoveItem(items[i])
					end
					i = i + 1
				end
			end

			it = nil
			if true then break end
		end

		inst = inst + 1
	end
	if b == false then
		RemoveItem(article)
	end

	i = 0
	for _ in _loop_() do
		if i == sum then break end
		items[i] = nil
		i = i + 1
	end

	article = nil
	caster = nil
	it = nil
end
function YDWEStringFormula___Init()
	local f = Filter(YDWEStringFormula___Adaptation)
	local t = CreateTrigger()
	local i = 0

	for _ in _loop_() do
		if i > 15 then break end
		TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, f)
		i = i + 1
	end

	TriggerAddCondition(t, Condition(YDWEStringFormula___verify))
	TriggerAddAction(t, YDWEStringFormula___CraftItem)
	DestroyFilter(f)

	f = nil
	t = nil
end

--/////////////////// __End of Craft Item__ ////////////////
--//////////////////////////////////////////////////////////

-- call YDWENewItemsFormula('rat6', 6, 'rat9', 5, 'ratc', 4, 'rde1', 3, 'rde2', 2, 'rde3', 1, 'mcou')
function YDWENewItemsFormula(type1, n1, type2, n2, type3, n3, type4, n4, type5, n5, type6, n6, eventually)
	local sort = s__YDWEStringFormula___Sorting_create(type1, n1, type2, n2, type3, n3, type4, n4, type5, n5, type6, n6, 0, 0)
	local itmx = s__YDWEStringFormula___ItemIdMatrix_assigns(eventually)
	local f = (I2S(YDWEStringFormula___SEGMENT_LENGTH) or "") .. (s__YDWEStringFormula___Sorting_convert(sort) or "")
	local s = ""
	local i = 0

	YDWEStringFormula___FormulaData = s__YDWEStringFormula___FormulaMatrix_memory(YDWEStringFormula___SEGMENT_LENGTH, f, itmx)
	if YDWEStringFormula___FormulaData > 0 then
		s = YDWEStringFormula___Convert(YDWEStringFormula___FormulaData, YDWEStringFormula___SEGMENT_LENGTH)

		i = 0
		for _ in _loop_() do
			if i > s__YDWEStringFormula___Sorting_total[sort] then break end
			s__YDWEStringFormula___ItemIdMatrix_memory(s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[sort] + i], s)
			i = i + 1
		end

		s__YDWEStringFormula___ItemIdMatrix_memory(itmx, s)
	end

	s__YDWEStringFormula___Sorting_deallocate(sort)
	f = ""
	s = ""
end

--library YDWEStringFormula ends
--library YDWETimerPattern:
--***************************************************
--* �� - Matrix ����ģ�庯��
--*--------------------
--* ���ߣ�Warft_TigerCN  �����Ż���Fetrix_sai
--***************************************************
---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--                                       Timer Pattern Union                                              //
---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
function YDWETimerPattern___SingleMagic(sour, targ, x, y, h, uid, aid, lv, order)
	local dummy = CreateUnit(GetOwningPlayer(sour), uid, x, y, GetUnitFacing(sour))
	UnitApplyTimedLife(dummy, 1112045413, 1.0)
	UnitAddAbility(dummy, aid)
	SetUnitAbilityLevel(dummy, aid, lv)
	SetUnitFlyHeight(dummy, h, 0.0)
	IssueTargetOrderById(dummy, order, targ)
	--debug call BJDebugMsg("Target order")
	dummy = nil
end
function YDWETimerPattern___GetUnitZ(u)
	MoveLocation(YDWETimerPattern___yd_loc, GetUnitX(u), GetUnitY(u))
	return GetUnitFlyHeight(u) + GetLocationZ(YDWETimerPattern___yd_loc)
end
---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--                                            Filter Funcs                                                //
---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
function YDWETimerPattern___EnemyFilter(u, caster)
	return IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(u, UNIT_TYPE_RESISTANT) == false and IsUnitType(u, UNIT_TYPE_SLEEPING) == false and GetUnitState(u, UNIT_STATE_LIFE) > 0.405 and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and IsUnitIllusion(u) == false and IsUnitHidden(u) == false and IsUnitEnemy(u, GetOwningPlayer(caster)) and IsUnitVisible(u, GetOwningPlayer(caster))
end
function YDWETimerPattern___TreeFilter()
	local id = GetDestructableTypeId(GetFilterDestructable())
	return id == 1280601204 or id == 1096053874 or id == 1112831095 or id == 1263826039 or id == 1498703476 or id == 1247044468 or id == 1498706804 or id == 1498702708 or id == 1498707828 or id == 1247048823 or id == 1146385256 or id == 1179939959 or id == 1129608306 or id == 1230271607 or id == 1314157687 or id == 1330934903 or id == 1515484279 or id == 1465152372 or id == 1196716904 or id == 1448373364 or id == 1465152631 or id == 1096053859 or id == 1112831075 or id == 1129608291 or id == 1230271587 or id == 1314157667 or id == 1515484259
end
function YDWETimerPattern___DamageFilter()
	local u = GetFilterUnit()
	local d = YDWETimerPattern___tmp_data
	if not IsUnitInGroup(u, s__YDWETimerPattern___Thread_g[d]) and s__YDWETimerPattern___Thread_switch[d] ~= 0 and YDWETimerPattern___EnemyFilter(u, s__YDWETimerPattern___Thread_caster[d]) then
		UnitDamageTarget(s__YDWETimerPattern___Thread_caster[d], u, s__YDWETimerPattern___Thread_amount[d], true, true, bj_lastSetAttackType, bj_lastSetDamageType, bj_lastSetWeaponType)
		DestroyEffect(AddSpecialEffectTarget(s__YDWETimerPattern___Thread_dsfx[d], u, s__YDWETimerPattern___Thread_part[d]))
		if s__YDWETimerPattern___Thread_skills[d] > 808464432 and s__YDWETimerPattern___Thread_skills[d] ~= nil and s__YDWETimerPattern___Thread_order[d] > 0 and s__YDWETimerPattern___Thread_order[d] ~= nil then
			YDWETimerPattern___SingleMagic(s__YDWETimerPattern___Thread_caster[d], u, s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[d]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[d]], GetUnitFlyHeight(s__YDWETimerPattern___Thread_obj[d]), s__YDWETimerPattern___Thread_unitid[d], s__YDWETimerPattern___Thread_skills[d], s__YDWETimerPattern___Thread_level[d], s__YDWETimerPattern___Thread_order[d])
		end
		if not s__YDWETimerPattern___Thread_recycle[d] then
			--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r A one-time.")
			s__YDWETimerPattern___Thread_switch[d] = 0
		end
		s__YDWETimerPattern___Thread_target[d] = u
		--call GroupAddUnit(d.g, u)
		u = nil
		return true
	end
	u = nil
	return false
end
function YDWETimerPattern___TreeKill()
	local d = GetEnumDestructable()
	if GetWidgetLife(d) > 0.405 then
		KillDestructable(d)
	end
	d = nil
end
---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--                                         Major Structure Code                                           //
---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
function s__YDWETimerPattern___Thread__staticgetindex(h)
	return LoadInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(h)))) -- INLINED!!
end
function s__YDWETimerPattern___Thread__staticsetindex(h, value)
	SaveInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(h))), value) -- INLINED!!
end
function s__YDWETimerPattern___Thread_flush(h)
	RemoveSavedInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(h)))) -- INLINED!!
end
function s__YDWETimerPattern___Thread__set_x(this, value)
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] = value
	SetUnitX(s__YDWETimerPattern___Thread_obj[this], value)
end
function s__YDWETimerPattern___Thread__set_y(this, value)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] = value
	SetUnitY(s__YDWETimerPattern___Thread_obj[this], value)
end
function s__YDWETimerPattern___Thread__set_z(this, value)
	s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]] = value
	MoveLocation(YDWETimerPattern___yd_loc, s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]])
	SetUnitFlyHeight(s__YDWETimerPattern___Thread_obj[this], value - GetLocationZ(YDWETimerPattern___yd_loc), 0)
end
function s__YDWETimerPattern___Thread_onDestroy(this)
	--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r Knockback stopped!")
	RemoveSavedInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_obj[this])))) -- INLINED!!
	RemoveSavedInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_t[this])))) -- INLINED!!
	GroupClear(s__YDWETimerPattern___Thread_g[this])
	DestroyGroup(s__YDWETimerPattern___Thread_g[this])
	PauseTimer(s__YDWETimerPattern___Thread_t[this])
	DestroyTimer(s__YDWETimerPattern___Thread_t[this])
	s__YDWETimerPattern___YDVector3_deallocate(s__YDWETimerPattern___Thread_des[this])
	s__YDWETimerPattern___YDVector3_deallocate(s__YDWETimerPattern___Thread_pos[this])
	s__YDWETimerPattern___YDVector3_deallocate(s__YDWETimerPattern___Thread_vel[this])
	s__YDWETimerPattern___Thread_caster[this] = nil
	s__YDWETimerPattern___Thread_target[this] = nil
	s__YDWETimerPattern___Thread_obj[this] = nil
	s__YDWETimerPattern___Thread_g[this] = nil
	s__YDWETimerPattern___Thread_t[this] = nil
	s__YDWETimerPattern___Thread_amount[this] = 0
	s__YDWETimerPattern___Thread_skills[this] = 0
	s__YDWETimerPattern___Thread_order[this] = 0
	s__YDWETimerPattern___Thread_dsfx[this] = ""
	s__YDWETimerPattern___Thread_gsfx[this] = ""
	s__YDWETimerPattern___Thread_wsfx[this] = ""
	s__YDWETimerPattern___Thread_part[this] = ""
end
function s__YDWETimerPattern___Parabola_move()
	local this = LoadInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(GetExpiredTimer())))) -- INLINED!!
	--local real vx = .des.x - .pos.x
	--local real vy = .des.y - .pos.y
	--local real vz = .des.z - .pos.z
	--if vx * vx + vy * vy + vz * vz > 900.0 then
	s__YDWETimerPattern___Thread__set_x(this, GetUnitX(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]]) --.pos.x + .vel.x
	s__YDWETimerPattern___Thread__set_y(this, GetUnitY(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]]) --.pos.y + .vel.y
	s__YDWETimerPattern___Thread__set_z(this, YDWETimerPattern___GetUnitZ(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___Thread_ac[this] * s__YDWETimerPattern___Thread_step[this] * 2 + s__YDWETimerPattern___Thread_ac[this] * s__YDWETimerPattern___Thread_dist[this] + s__YDWETimerPattern___Thread_bc[this]) --.pos.z + .ac * .step * 2 + .ac * .dist + .bc
	s__YDWETimerPattern___Thread_step[this] = s__YDWETimerPattern___Thread_step[this] + s__YDWETimerPattern___Thread_dist[this]
	--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r high = ." + R2S(GetLocationZ(yd_loc)))
	if RMinBJ(RMaxBJ(s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] * 1.0, yd_MapMinX), yd_MapMaxX) ~= s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] or RMinBJ(RMaxBJ(s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] * 1.0, yd_MapMinY), yd_MapMaxY) ~= s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] or s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]] <= GetLocationZ(YDWETimerPattern___yd_loc) then -- INLINED!!
		s__YDWETimerPattern___Thread_switch[this] = 0
	end
	if s__YDWETimerPattern___Thread_amount[this] > 0.0 then
		--call this.damage(.caster, .pos.x + .vel.x, .pos.y + .vel.y, GetUnitZ(.obj), false, false)
		YDWETimerPattern___tmp_data = this
		GroupEnumUnitsInRange(s__YDWETimerPattern___Thread_g[this], s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] + s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] + s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]], 120.0, Condition(YDWETimerPattern___DamageFilter))
	--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r Area damage.")
	end
	--else
	--set .switch = 0
	--endif
	if s__YDWETimerPattern___Thread_switch[this] == 0 then
		SetUnitFlyHeight(s__YDWETimerPattern___Thread_obj[this], GetUnitDefaultFlyHeight(s__YDWETimerPattern___Thread_obj[this]), 200.0)
		SetUnitTimeScale(s__YDWETimerPattern___Thread_obj[this], 1)
		--YDWETriggerEvent
		YDWESyStemAbilityCastingOverTriggerAction(s__YDWETimerPattern___Thread_obj[this], 7)
		sc__YDWETimerPattern___Thread_deallocate(this)
	end
end
function s__YDWETimerPattern___Parabola_create(source, object, angle, distance, time, interval, high, damage, attach, deff)
	local this = s__YDWETimerPattern___Parabola__allocate()
	local vx = 0.0
	local vy = 0.0
	local vz = 0.0
	s__YDWETimerPattern___Thread_des[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_pos[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_vel[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] = GetUnitX(object)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] = GetUnitY(object)
	s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]] = YDWETimerPattern___GetUnitZ(object)
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_des[this]] = s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] + distance * Cos(angle)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_des[this]] = s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] + distance * Sin(angle)
	MoveLocation(YDWETimerPattern___yd_loc, s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_des[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_des[this]])
	s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_des[this]] = GetLocationZ(YDWETimerPattern___yd_loc)
	if s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]] > s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_des[this]] then
		high = high + s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]]
	else
		high = high + s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_des[this]]
	end
	s__YDWETimerPattern___Thread_ac[this] = (2 * (s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]] + s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_des[this]]) - 4 * high) / (distance * distance)
	s__YDWETimerPattern___Thread_bc[this] = (s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_des[this]] - s__YDWETimerPattern___YDVector3_z[s__YDWETimerPattern___Thread_pos[this]] - s__YDWETimerPattern___Thread_ac[this] * distance * distance) / distance
	s__YDWETimerPattern___Thread_dist[this] = distance * interval / time
	s__YDWETimerPattern___Thread_ac[this] = s__YDWETimerPattern___Thread_ac[this] * s__YDWETimerPattern___Thread_dist[this]
	s__YDWETimerPattern___Thread_bc[this] = s__YDWETimerPattern___Thread_bc[this] * s__YDWETimerPattern___Thread_dist[this]
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]] = s__YDWETimerPattern___Thread_dist[this] * Cos(angle)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]] = s__YDWETimerPattern___Thread_dist[this] * Sin(angle)
	s__YDWETimerPattern___Thread_step[this] = 0.0
	s__YDWETimerPattern___Thread_caster[this] = source
	s__YDWETimerPattern___Thread_obj[this] = object
	s__YDWETimerPattern___Thread_amount[this] = damage
	s__YDWETimerPattern___Thread_dsfx[this] = deff
	s__YDWETimerPattern___Thread_part[this] = attach
	s__YDWETimerPattern___Thread_switch[this] = 1
	s__YDWETimerPattern___Thread_recycle[this] = true
	s__YDWETimerPattern___Thread_t[this] = CreateTimer()
	s__YDWETimerPattern___Thread_g[this] = CreateGroup()
	UnitAddAbility(s__YDWETimerPattern___Thread_obj[this], 1097691750)
	UnitRemoveAbility(s__YDWETimerPattern___Thread_obj[this], 1097691750)
	TimerStart(s__YDWETimerPattern___Thread_t[this], interval, true, s__YDWETimerPattern___Parabola_move)
	GroupAddUnit(s__YDWETimerPattern___Thread_g[this], object)
	SaveInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(object))), this) -- INLINED!!
	SaveInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_t[this]))), this) -- INLINED!!
	return this
end
-- uniform speed
function s__YDWETimerPattern___Linear_move()
	local this = LoadInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(GetExpiredTimer())))) -- INLINED!!
	if s__YDWETimerPattern___Thread_step[this] > s__YDWETimerPattern___Thread_dist[this] then
		s__YDWETimerPattern___Thread__set_x(this, GetUnitX(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]]) --.pos.x + .vel.x
		s__YDWETimerPattern___Thread__set_y(this, GetUnitY(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]]) --.pos.y + .vel.y
		--set .pos.z = GetUnitZ(.obj)
		s__YDWETimerPattern___Thread_step[this] = s__YDWETimerPattern___Thread_step[this] - s__YDWETimerPattern___Thread_dist[this]
		--call this.damage(.caster, .pos.x, .pos.y, .pos.z, true, true)
		YDWETimerPattern___tmp_data = this
		GroupEnumUnitsInRange(s__YDWETimerPattern___Thread_g[this], s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] + s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] + s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]], 120.0, Condition(YDWETimerPattern___DamageFilter))
		if RMinBJ(RMaxBJ(s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] * 1.0, yd_MapMinX), yd_MapMaxX) ~= s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] or RMinBJ(RMaxBJ(s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] * 1.0, yd_MapMinY), yd_MapMaxY) ~= s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] then -- INLINED!!
			s__YDWETimerPattern___Thread_switch[this] = 0
		end
	else
		s__YDWETimerPattern___Thread_switch[this] = 0
	end
	if s__YDWETimerPattern___Thread_switch[this] == 0 then
		-- YDWETriggerEvent
		if s__YDWETimerPattern___Thread_target[this] ~= nil then
			--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r  |cffff0000" + GetUnitName(.target) + "|r was hit!!!")
			--call YDWESaveUnitByString(I2S(YDWEH2I(.caster)), "MoonPriestessArrow", .target)
			bj_lastAbilityTargetUnit = s__YDWETimerPattern___Thread_target[this]
			YDWESyStemAbilityCastingOverTriggerAction(s__YDWETimerPattern___Thread_caster[this], 8)
		else
			YDWESyStemAbilityCastingOverTriggerAction(s__YDWETimerPattern___Thread_caster[this], 9)
		end
		--call KillUnit(.obj)
		RemoveUnit(s__YDWETimerPattern___Thread_obj[this])
		sc__YDWETimerPattern___Thread_deallocate(this)
	end
end
function s__YDWETimerPattern___Linear_create(source, object, angle, distance, time, interval, uid, aid, lv, orderid, attach, sfx)
	local this = s__YDWETimerPattern___Linear__allocate()
	s__YDWETimerPattern___Thread_des[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_pos[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_vel[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_step[this] = distance
	s__YDWETimerPattern___Thread_dist[this] = distance * interval / time
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]] = s__YDWETimerPattern___Thread_dist[this] * Cos(angle)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]] = s__YDWETimerPattern___Thread_dist[this] * Sin(angle)
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] = GetUnitX(object)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] = GetUnitY(object)
	s__YDWETimerPattern___Thread_caster[this] = source
	s__YDWETimerPattern___Thread_obj[this] = object
	s__YDWETimerPattern___Thread_unitid[this] = uid
	s__YDWETimerPattern___Thread_skills[this] = aid
	s__YDWETimerPattern___Thread_level[this] = lv
	s__YDWETimerPattern___Thread_order[this] = orderid
	s__YDWETimerPattern___Thread_part[this] = attach
	s__YDWETimerPattern___Thread_gsfx[this] = sfx
	s__YDWETimerPattern___Thread_switch[this] = 1
	s__YDWETimerPattern___Thread_recycle[this] = false
	s__YDWETimerPattern___Thread_t[this] = CreateTimer()
	s__YDWETimerPattern___Thread_g[this] = CreateGroup()
	TimerStart(s__YDWETimerPattern___Thread_t[this], interval, true, s__YDWETimerPattern___Linear_move)
	SaveInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_t[this]))), this) -- INLINED!!
	return this
end
-- Uniform deceleration
function s__YDWETimerPattern___Deceleration_move()
	local this = LoadInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(GetExpiredTimer())))) -- INLINED!!
	local xp = GetUnitX(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___Thread_dist[this] * s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]]
	local yp = GetUnitY(s__YDWETimerPattern___Thread_obj[this]) + s__YDWETimerPattern___Thread_dist[this] * s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]]
	if s__YDWETimerPattern___Thread_volume[this] == false then
		--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |rPathable without terrain.")
		if IsTerrainPathable(xp, yp, PATHING_TYPE_WALKABILITY) then
			s__YDWETimerPattern___Thread_switch[this] = 0
		else
			s__YDWETimerPattern___Thread__set_x(this, xp)
			s__YDWETimerPattern___Thread__set_y(this, yp)
		end
	else
		s__YDWETimerPattern___Thread__set_x(this, xp)
		s__YDWETimerPattern___Thread__set_y(this, yp)
	end
	if s__YDWETimerPattern___Thread_follow[this] == 0 then
		if GetUnitFlyHeight(s__YDWETimerPattern___Thread_obj[this]) < 5.0 then
			if IsTerrainPathable(s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]], PATHING_TYPE_FLOATABILITY) then
				DestroyEffect(AddSpecialEffect(s__YDWETimerPattern___Thread_gsfx[this], s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]]))
			else
				DestroyEffect(AddSpecialEffect(s__YDWETimerPattern___Thread_wsfx[this], s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]]))
			end
		end
	end
	s__YDWETimerPattern___Thread_follow[this] = s__YDWETimerPattern___Thread_follow[this] + 1
	if s__YDWETimerPattern___Thread_follow[this] == 2 then
		s__YDWETimerPattern___Thread_follow[this] = 0
	end
	if s__YDWETimerPattern___Thread_killdest[this] then
		MoveRectTo(YDWETimerPattern___Area, s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]])
		EnumDestructablesInRect(YDWETimerPattern___Area, YDWETimerPattern___Bexpr, YDWETimerPattern___TreeKill)
	end
	if s__YDWETimerPattern___Thread_amount[this] > 0.0 then
		--call this.damage(.caster, .pos.x, .pos.y, 0.0, false, .recycle)
		YDWETimerPattern___tmp_data = this
		GroupEnumUnitsInRange(s__YDWETimerPattern___Thread_g[this], s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]], s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]], 120.0, Condition(YDWETimerPattern___DamageFilter))
	end
	s__YDWETimerPattern___Thread_dist[this] = s__YDWETimerPattern___Thread_dist[this] - s__YDWETimerPattern___Thread_step[this]
	if s__YDWETimerPattern___Thread_dist[this] <= 0.0 or RMinBJ(RMaxBJ(s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] * 1.0, yd_MapMinX), yd_MapMaxX) ~= s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] or RMinBJ(RMaxBJ(s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] * 1.0, yd_MapMinY), yd_MapMaxY) ~= s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] then -- INLINED!!
		s__YDWETimerPattern___Thread_switch[this] = 0
	end
	if s__YDWETimerPattern___Thread_switch[this] == 0 then
		SetUnitFlyHeight(s__YDWETimerPattern___Thread_obj[this], GetUnitDefaultFlyHeight(s__YDWETimerPattern___Thread_obj[this]), 200.0)
		SetUnitTimeScale(s__YDWETimerPattern___Thread_obj[this], 1)
		-- YDWETriggerEvent
		YDWESyStemAbilityCastingOverTriggerAction(s__YDWETimerPattern___Thread_obj[this], 6)
		sc__YDWETimerPattern___Thread_deallocate(this)
	end
end
function s__YDWETimerPattern___Deceleration_create(source, object, angle, distance, time, interval, damage, killtrees, cycle, path, part, geff, weff)
	local this = s__YDWETimerPattern___Deceleration__allocate()
	local vx = 0.0
	local vy = 0.0
	local l = 0.0
	s__YDWETimerPattern___Thread_des[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_pos[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___Thread_vel[this] = s__YDWETimerPattern___YDVector3__allocate()
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_vel[this]] = Cos(angle)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_vel[this]] = Sin(angle)
	s__YDWETimerPattern___Thread_dist[this] = 2 * distance * interval / time
	s__YDWETimerPattern___Thread_step[this] = s__YDWETimerPattern___Thread_dist[this] * interval / time
	s__YDWETimerPattern___YDVector3_x[s__YDWETimerPattern___Thread_pos[this]] = GetUnitX(object)
	s__YDWETimerPattern___YDVector3_y[s__YDWETimerPattern___Thread_pos[this]] = GetUnitY(object)
	s__YDWETimerPattern___Thread_caster[this] = source
	s__YDWETimerPattern___Thread_obj[this] = object
	s__YDWETimerPattern___Thread_amount[this] = damage
	s__YDWETimerPattern___Thread_killdest[this] = killtrees
	s__YDWETimerPattern___Thread_recycle[this] = cycle
	s__YDWETimerPattern___Thread_volume[this] = path
	s__YDWETimerPattern___Thread_gsfx[this] = geff
	s__YDWETimerPattern___Thread_wsfx[this] = weff
	s__YDWETimerPattern___Thread_switch[this] = 1
	s__YDWETimerPattern___Thread_follow[this] = 0
	s__YDWETimerPattern___Thread_g[this] = CreateGroup()
	s__YDWETimerPattern___Thread_t[this] = CreateTimer()
	TimerStart(s__YDWETimerPattern___Thread_t[this], interval, true, s__YDWETimerPattern___Deceleration_move)
	SaveInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_t[this]))), this) -- INLINED!!
	return this
end
-- Jump Attack PUI
function YDWETimerPatternJumpAttack(u, face, dis, lasttime, timeout, high, damage, part, dsfx)
	if u == nil then
		--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r No object!")
		return
	end
	s__YDWETimerPattern___Parabola_create(u, u, Deg2Rad(face), RMaxBJ(dis, 0), RMaxBJ(lasttime, 0), RMaxBJ(timeout, 0), high, damage, part, dsfx)
end
-- Moon Priestess Arrow PUI
function YDWETimerPatternMoonPriestessArrow(u, face, dis, lasttime, timeout, lv, aid, uid, order, part, dsfx)
	local sour = nil
	if u == nil then
		--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r No object!")
		return
	end
	sour = LoadUnitHandle(YDHT, StringHash(I2S(GetHandleId(u))), StringHash("MoonPriestessArrow")) -- INLINED!!
	if sour == nil then
		sour = u
	end
	s__YDWETimerPattern___Linear_create(sour, u, Deg2Rad(face), RMaxBJ(dis, 0), RMaxBJ(lasttime, 0), RMaxBJ(timeout, 0), uid, aid, IMaxBJ(lv, 1), OrderId(order), part, dsfx)
	--call YDWEFlushMissionByString(I2S(YDWEH2I(u)))
	sour = nil
end
-- Rush Slide PUI
function YDWETimerPatternRushSlide(u, face, dis, lasttime, timeout, damage, killtrees, cycle, path, part, gsfx, wsfx)
	if u == nil then
		--debug call BJDebugMsg("|cff00ff00[YDWE] Timer Pattern : |r No object!")
		return
	end
	s__YDWETimerPattern___Deceleration_create(u, u, Deg2Rad(face), RMaxBJ(dis, 0), RMaxBJ(lasttime, 0), RMaxBJ(timeout, 0), damage, killtrees, cycle, path, part, gsfx, wsfx)
end
function YDWETimerPattern___Init()
	YDWETimerPattern___Area = Rect(-120.0, -120.0, 120.0, 120.0)
	YDWETimerPattern___Bexpr = Filter(YDWETimerPattern___TreeFilter)
end

--***************************************************************************
--*
--*  Custom Script Code
--*
--***************************************************************************
--TESH.scrollpos=0
--TESH.alwaysfold=0
--***************************************************************************
--*
--*  Triggers
--*
--***************************************************************************
--===========================================================================
-- Trigger: solar_addons_ydwe
--===========================================================================
function Trig_solar_addons_ydweActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2020678509 + 0, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2020678509 + 0))
	YDWEJumpTimer(GetTriggerUnit(), 0, 800, 2, 0.01, 300)
	YDWEMeatHook(GetTriggerUnit(), GetSpellTargetLoc(), 1752328550, 1751611762, 2000, 35, 100, 0.03)
	YDWETimerPatternJumpAttack(GetTriggerUnit(), 0, 800, 1, 0.03, 100, 0, "chest", "")
	YDWETimerPatternRushSlide(GetTriggerUnit(), 0, 800, 1, 0.03, 0, false, false, false, "origin", "", "")
	YDWEAroundSystem(GetLastCreatedUnit(), GetTriggerUnit(), 8, 3, 0, 5, 0.03)
	YDWENewItemsFormula(1667786099, 0, 1667786099, 0, 1667786099, 0, 1667786099, 0, 1667786099, 0, 1667786099, 0, 1652187749)
	SaveInteger(YDHT, 1, -244676034, LoadInteger(YDHT, 0, 450813563))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end
--===========================================================================  
--���ܻ���ģ�� 
--===========================================================================
--===========================================================================  
--===========================================================================  
--�Զ����¼� 
--===========================================================================
--===========================================================================   
--===========================================================================
--��Ծϵͳ 
--===========================================================================




--Struct method generated initializers/callers:
function sa__YDWEStringFormula___Inventory_onDestroy()
	local this = f__arg_this
	FlushChildHashtable(YDHT, StringHash("YDWEStringFormula." .. (I2S(this) or ""))) -- INLINED!!
	return true
end
function sa__YDWETimerPattern___Thread_onDestroy()
	local this = f__arg_this
	RemoveSavedInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_obj[this])))) -- INLINED!!
	RemoveSavedInteger(YDHT, StringHash("YDWETimerPattern."), StringHash(I2S(GetHandleId(s__YDWETimerPattern___Thread_t[this])))) -- INLINED!!
	GroupClear(s__YDWETimerPattern___Thread_g[this])
	DestroyGroup(s__YDWETimerPattern___Thread_g[this])
	PauseTimer(s__YDWETimerPattern___Thread_t[this])
	DestroyTimer(s__YDWETimerPattern___Thread_t[this])
	s__YDWETimerPattern___YDVector3_deallocate(s__YDWETimerPattern___Thread_des[this])
	s__YDWETimerPattern___YDVector3_deallocate(s__YDWETimerPattern___Thread_pos[this])
	s__YDWETimerPattern___YDVector3_deallocate(s__YDWETimerPattern___Thread_vel[this])
	s__YDWETimerPattern___Thread_caster[this] = nil
	s__YDWETimerPattern___Thread_target[this] = nil
	s__YDWETimerPattern___Thread_obj[this] = nil
	s__YDWETimerPattern___Thread_g[this] = nil
	s__YDWETimerPattern___Thread_t[this] = nil
	s__YDWETimerPattern___Thread_amount[this] = 0
	s__YDWETimerPattern___Thread_skills[this] = 0
	s__YDWETimerPattern___Thread_order[this] = 0
	s__YDWETimerPattern___Thread_dsfx[this] = ""
	s__YDWETimerPattern___Thread_gsfx[this] = ""
	s__YDWETimerPattern___Thread_wsfx[this] = ""
	s__YDWETimerPattern___Thread_part[this] = ""
	return true
end
function sa__YDWEStringFormula___Sorting_onDestroy()
	local this = f__arg_this
	local i = 0
	for _ in _loop_() do
		if i == s___YDWEStringFormula___Sorting_stack_size then break end
		s___YDWEStringFormula___Sorting_stack[s__YDWEStringFormula___Sorting_stack[this] + i] = 0
		s___YDWEStringFormula___Sorting_count[s__YDWEStringFormula___Sorting_count[this] + i] = 0
		i = i + 1
	end
	s__YDWEStringFormula___Sorting_char[this] = ""
	return true
end

function jasshelper__initstructs244205734()
	st__YDWEStringFormula___Inventory_onDestroy[2] = CreateTrigger()
	st__YDWEStringFormula___Inventory_onDestroy[3] = st__YDWEStringFormula___Inventory_onDestroy[2]
	TriggerAddCondition(st__YDWEStringFormula___Inventory_onDestroy[2], Condition(sa__YDWEStringFormula___Inventory_onDestroy))
	st__YDWETimerPattern___Thread_onDestroy[10] = CreateTrigger()
	st__YDWETimerPattern___Thread_onDestroy[11] = st__YDWETimerPattern___Thread_onDestroy[10]
	st__YDWETimerPattern___Thread_onDestroy[12] = st__YDWETimerPattern___Thread_onDestroy[10]
	st__YDWETimerPattern___Thread_onDestroy[13] = st__YDWETimerPattern___Thread_onDestroy[10]
	TriggerAddCondition(st__YDWETimerPattern___Thread_onDestroy[10], Condition(sa__YDWETimerPattern___Thread_onDestroy))
	st__YDWEStringFormula___Sorting_onDestroy = CreateTrigger()
	TriggerAddCondition(st__YDWEStringFormula___Sorting_onDestroy, Condition(sa__YDWEStringFormula___Sorting_onDestroy))














	ExecuteFunc("s__YDWEStringFormula___ItemIdMatrix_onInit")
	ExecuteFunc("s__YDWEStringFormula___FormulaMatrix_onInit")
end
