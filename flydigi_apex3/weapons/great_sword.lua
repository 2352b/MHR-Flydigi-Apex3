local weapon_name = "GreatSword"
local weapon_type = 0

local sdk_weapon_type = sdk.find_type_definition("snow.player.GreatSword")
local charge_field = sdk_weapon_type:get_field("_TameLv")

local BaseWeapon = require("flydigi_apex3/base_weapon")
local utils = require('flydigi_apex3/utils')
local setting = require('flydigi_apex3/setting')
local BaseState = require('flydigi_apex3/base_state')

local State = BaseState:new()

local weapon = BaseWeapon:new(weapon_type, weapon_name, {sdk_weapon_type:get_method("update")}, State)

function weapon:get_status(manager)    
    local status = {
        charge = charge_field:get_data(manager)
    }
    return status
end

function weapon:get_controller_config(new_state, changed, player, config)
    local right = setting.right_default
    local left = setting.left_default
    -- TODO edit right trigger config here
    return {LeftTrigger=left, RightTrigger=right}
end

return weapon
