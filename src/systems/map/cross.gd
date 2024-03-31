class_name Cross
extends Node2D

@onready var background1: ColorRect = $Background1
@onready var background2: ColorRect = $Background2

var coordinates: Vector2i
var tileSize: float
var thickness: float

func _draw() -> void:
	if tileSize == 0:
		return

	var intersectionSize = tileSize / 4.0

	background1.size = Vector2(intersectionSize, thickness)
	background2.size = Vector2(intersectionSize, thickness)
	var center = background1.size / 2.0
	background1.pivot_offset = center
	background2.pivot_offset = center
	background1.position = -center
	background2.position = -center
	background1.scale.y = thickness / tileSize
	background2.scale.y = thickness / tileSize

func _on_background_mouse_entered() -> void:
	modulate = Color(0.5, 0.5, 0.5, 1)

func _on_background_mouse_exited() -> void:
	modulate = Color(1, 1, 1, 1)
