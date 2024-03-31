class_name HardwareData
extends Resource

enum HardwareType {
    CPU,
    GPU,
    RAM,
    STORAGE,
    NETWORK,
    DEFENSE
}

## Cost in bit coin
var cost: int

## User facing name
var hardwareName: String

## The type of hardware
var type: HardwareType