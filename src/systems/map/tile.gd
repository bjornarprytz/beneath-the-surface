class_name Tile
extends Node2D

signal hovered(tile: Tile)
signal unhovered(tile: Tile)
signal clicked(tile: Tile)

@onready var background: ColorRect = $Background

var coordinates: Vector2i

## The size of the tile in pixels.
var size: float

var _edges: Array[Edge] = []

func connect_edge(edge: Edge) -> void:
	if _edges.has(edge):
		return

	_edges.append(edge)
	edge.connect_tile(self)

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

func _ready() -> void:
	background.tooltip_text = str(coordinates)

func _draw() -> void:
	background.size = Vector2(size, size)

func _on_background_mouse_entered() -> void:
	background.modulate = Color(0.5, 0.5, 0.5, 1)
	for e in _edges:
		e.modulate = Color(0.5, 0.5, 0.5, 1)
	hovered.emit(self)

func _on_background_mouse_exited() -> void:
	background.modulate = Color(1, 1, 1, 1)
	for e in _edges:
		e.modulate = Color(1, 1, 1, 1)
	unhovered.emit(self)

func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.button_index == MOUSE_BUTTON_LEFT and mouseEvent.pressed:
			clicked.emit(self)
