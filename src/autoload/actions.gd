class_name ActionHandler
extends Node2D

var buildActionSpawner: PackedScene = preload ("res://systems/actions/build_action.tscn")

func build(hardware: HardwareData, gameState: GameState):
	var buildAction = buildActionSpawner.instance() as BuildAction
	buildAction.init(hardware, gameState)
	add_child(buildAction)

	await buildAction.finished
