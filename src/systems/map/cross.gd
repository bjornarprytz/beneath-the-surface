class_name Cross
extends Node2D

signal hovered(intersection: Cross)
signal unhovered(intersection: Cross)
signal clicked(intersection: Cross)

@onready var background1: ColorRect = $Background1
@onready var background2: ColorRect = $Background2

var coordinates: Vector2i
var tileSize: float
var thickness: float

## TODO: make north, south, east, west edges
var edges: Array[Edge] = []

func connect_edge(edge: Edge) -> void:
	if edges.has(edge):
		return
	
	edges.append(edge)
	edge.connect_intersection(self)

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
	for e in edges:
		e.modulate = Color(0.5, 0.5, 0.5, 1)
	hovered.emit(self)

func _on_background_mouse_exited() -> void:
	modulate = Color(1, 1, 1, 1)
	for e in edges:
		e.modulate = Color(1, 1, 1, 1)
	unhovered.emit(self)

func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.button_index == MOUSE_BUTTON_LEFT and mouseEvent.pressed:
			clicked.emit(self)
