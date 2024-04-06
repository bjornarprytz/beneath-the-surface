class_name BuildAction
extends Node2D

signal finished()

var _hardwareData: HardwareData
var _map: Map

func init(hardwareData: HardwareData, map: Map) -> void:
	_hardwareData = hardwareData
	_map = map

## The build action is to place a piece of hardware on the map
## If this is fencing, you get to drag a line along the edges
## If this is a rack, you get to place it on a tile
## If this is a switch, you get to place it on an intersection ??

func _unhandled_input(event: InputEvent) -> void:
	## Cancel with mouse 2
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			finished.emit()
