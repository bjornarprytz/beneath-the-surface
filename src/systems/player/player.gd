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
        HardwareData.new().withName("Db").withCost(100).withType(HardwareData.Type.TILE),
        HardwareData.new().withName("Fw").withCost(10).withColor(Color.PINK).withType(HardwareData.Type.EDGE)
    ]

    deployableSoftware = [
        SoftwareData.new().withName("S1").withMovementStrategy(MovementStrategy.new()),
        SoftwareData.new().withName("S2").withMovementStrategy(MovementStrategy.new()),
        SoftwareData.new().withName("S3").withMovementStrategy(MovementStrategy.new()),
        SoftwareData.new().withName("S4").withMovementStrategy(MovementStrategy.new()),
        SoftwareData.new().withName("S5").withMovementStrategy(MovementStrategy.new()),
        SoftwareData.new().withName("S6").withMovementStrategy(MovementStrategy.new()),
    ]