class_name Tile
extends Node2D

@onready var background: ColorRect = $Background

var coordinates: Vector2i

## The size of the tile in pixels.
var size: float

func get_edges() -> Array[Edge]:
	var edges = []
	
	push_error("get_edges() not implemented")

	return edges

func get_neighbours() -> Array[Tile]:
	var neighbours = []
	
	push_error("get_neighbours() not implemented")

	return neighbours

func get_hardware() -> Hardware:
	push_error("get_hardware() not implemented")
	return null

func get_software() -> Array[Software]:
	push_error("get_software() not implemented")
	return []

func _draw() -> void:
	background.size = Vector2(size, size)
