
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_ropeCreate

Description:
    Tow a vehicle.

Parameters:
    _tower - Vehicle towing. [Object]
    _vehicleSelected - Vehicle will be towed. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_tow_ropeCreate;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_tower", objNull, [objNull]],
    ["_vehicleSelected", btc_tow_vehicleSelected, [objNull]]
];

if !([_tower, _vehicleSelected] call btc_fnc_tow_check) exitWith {};
private _alreadyLoaded = (getVehicleCargo _tower) findIf {isObjectHidden _x} isEqualTo -1;
if (
    _alreadyLoaded &&
    {_tower setVehicleCargo _vehicleSelected}
) exitWith {};

private _canViV_wreck = false;
if (_alreadyLoaded) then {
    private _fakeVehicle = "B_LSV_01_unarmed_F" createVehicleLocal [0, 0, 0];
    _canViV_wreck = _tower canVehicleCargo _fakeVehicle isEqualTo [true, true];
    deleteVehicle _fakeVehicle;
};
if (_canViV_wreck) exitWith {
    [_vehicleSelected, _tower] remoteExecCall ["btc_fnc_tow_ViV", 2];
    btc_tow_vehicleSelected = objNull;
};

private _model_selected = (0 boundingBoxReal _vehicleSelected) select 1;
private _model_tower = (0 boundingBoxReal _tower) select 0;
private _model_selected_z = ((0 boundingBoxReal _vehicleSelected) select 0) select 2;
private _model_tower_z = ((0 boundingBoxReal _tower) select 0) select 2;
private _attachTo = [
    0,
    ((_model_tower select 1) - (_model_selected select 1)) - 0.2,
    -(abs _model_tower_z - abs _model_selected_z) + 0.1
];
_vehicleSelected attachTo [_tower, _attachTo];

private _model_rear_tower = ([_tower] call btc_fnc_tow_hitch_points) select 1;
private _model_front_selected = ([_vehicleSelected] call btc_fnc_tow_hitch_points) select 0;
private _selected_front_relativeToTower = _tower worldToModel (_vehicleSelected modelToWorld _model_front_selected);
private _helper = createVehicle ["CBA_NamespaceDummy", _vehicleSelected modelToWorld _model_front_selected, [], 0, "CAN_COLLIDE"]; // Need helper since 2.06 https://feedback.bistudio.com/T161256
_helper attachTo [_tower, _selected_front_relativeToTower];
private _rope1 = ropeCreate [_tower, _model_rear_tower, _helper, [-0.4, 0, 0]];
private _rope2 = ropeCreate [_tower, _model_rear_tower, _helper, [0.4, 0, 0]];

[_tower, "RopeBreak", {
    [_this, _thisArgs] call btc_fnc_tow_ropeBreak;
    deleteVehicle (_thisArgs select 2)
},
    [_vehicleSelected, [_rope1, _rope2], _helper]
] remoteExecCall ["CBA_fnc_addBISEventHandler", 2];

[_tower, getMass _tower + (getMass _vehicleSelected)/1.5] remoteExecCall ["setMass", _tower];
_tower setVariable ["btc_towing", _vehicleSelected, true];
_vehicleSelected setVariable ["btc_towing", _tower, true];
btc_tow_vehicleSelected = objNull;
