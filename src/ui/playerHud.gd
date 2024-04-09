extends Control

@export var gameState: GameState

@onready var buildActionSpawner: PackedScene = preload ("res://systems/actions/build_action.tscn")
@onready var buttonSpawner: PackedScene = preload ("res://ui/hardware_button.tscn")
@onready var hardwareBar: HFlowContainer = $Hardware
@onready var resourceInfo: ResourceInfo = $ResourceInfo

var currentAction: BuildAction

func _ready() -> void:
	for hw in gameState.player.buildableHardware:
		var button = buttonSpawner.instantiate() as HardwareButton
		button.button.text = hw.hardwareName
		button.button.pressed.connect(_on_build_button_pressed.bind(hw))
		hardwareBar.add_child(button)
	
	resourceInfo.init(gameState.player.resources)

func _unhandled_key_input(event: InputEvent) -> void:
	## Map number keys to buttons
	if event is InputEventKey:
		var key = event as InputEventKey
		if key.pressed:
			var buttonIndex = key.keycode - KEY_1
			if buttonIndex >= 0 and buttonIndex < hardwareBar.get_child_count():
				var button = hardwareBar.get_child(buttonIndex)
				button.button.pressed.emit()

func _on_build_button_pressed(hw: HardwareData) -> void:
	if currentAction != null:
		currentAction.cancel()
	currentAction = buildActionSpawner.instantiate() as BuildAction

	currentAction.init(hw, gameState)

	add_child(currentAction)
