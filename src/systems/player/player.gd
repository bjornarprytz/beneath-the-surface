class_name Player
extends Resource

## Options
var secrets = 420 # Lives
var resources: Resources = Resources.new()
var buildableHardware: Array[HardwareData] = []
var deployableSoftware: Array[SoftwareData] = []

## In play
var hardware: Array[Hardware] = []
var software: Array[Software] = []

func _init() -> void:
    buildableHardware = [
        HardwareData.new().withName("Db").withCost(100).withType(HardwareData.Type.TILE)
    ]