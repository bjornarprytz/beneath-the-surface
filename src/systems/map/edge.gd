class_name Edge
extends Node2D

@onready var background: ColorRect = $Background

## Coordinates correspond to the top left corner of a tile
var v1: Vector2i
## Coordinates correspond to the top left corner of a tile
var v2: Vector2i
## Length of the edge. This should the same across the board
var size: float
var thickness: float

func get_neigbours() -> Array[Edge]:
	var neigbours = []
	push_error("get_neigbours() not implemented")
	return neigbours

func get_tiles() -> Array[Tile]:
	var tiles = []
	push_error("get_tiles() not implemented")
	return tiles

func get_hardware() -> Array[Hardware]:
	var hardware = []
	push_error("get_hardware() not implemented")
	return hardware

func _draw() -> void:
	if size == 0:
		return

	background.size = Vector2(size, thickness)
	var halfHeight = thickness / 2
	background.pivot_offset = Vector2(0, halfHeight)
	background.position = Vector2(0, -halfHeight)
	background.scale.y = thickness / size

	if v2 - v1 == Vector2i.RIGHT:
		background.rotation_degrees = 0
	elif v2 - v1 == Vector2i.DOWN:
		background.rotation_degrees = 90
	else:
		push_error("Weird edge direction %s" % (v2 - v1))
		return

func _on_background_mouse_entered() -> void:
	background.modulate = Color(0.5, 0.5, 0.5, 1)

func _on_background_mouse_exited() -> void:
	background.modulate = Color(1, 1, 1, 1)
