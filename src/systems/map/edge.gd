class_name Edge
extends Node2D

@onready var line: Line2D = $Line

## Coordinates correspond to the top left corner of a tile
var v1: Vector2i
## Coordinates correspond to the top left corner of a tile
var v2: Vector2i
## Length of the edge. This should the same across the board
var size: float

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
	line.add_point(Vector2(0, 0))
	line.add_point((v2 - v1) * size)
