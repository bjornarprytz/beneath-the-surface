extends Control

@export var gameState: GameState

@onready var buildActionSpawner: PackedScene = preload ("res://systems/actions/build_action.tscn")
@onready var buttonSpawner: PackedScene = preload ("res://ui/hardware_button.tscn")
@onready var buildingBar: HFlowContainer = $Buildings

var currentAction: BuildAction

func _ready() -> void:
	for hw in gameState.player.buildableHardware:
		var button = buttonSpawner.instantiate() as HardwareButton
		button.button.text = hw.hardwareName
		button.button.pressed.connect(_on_build_button_pressed.bind(hw))
		buildingBar.add_child(button)

func _on_build_button_pressed(hw: HardwareData) -> void:
	if currentAction != null:
		currentAction.cancel()
	currentAction = buildActionSpawner.instantiate() as BuildAction

	currentAction.init(hw, gameState.map)

	add_child(currentAction)
