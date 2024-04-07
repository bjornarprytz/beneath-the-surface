class_name Tile
extends Node2D

signal hovered(tile: Tile)
signal unhovered(tile: Tile)
signal clicked(tile: Tile)

@onready var background: ColorRect = $Background

var coordinates: Vector2i

## The size of the tile in pixels.
var size: float

var _neighbours: Array[Tile] = []
var _edges: Array[Edge] = []
var _hardware: Hardware
var _software: Array[Software] = []

func connect_edge(edge: Edge) -> void:
	if _edges.has(edge):
		return

	_edges.append(edge)
	edge.connect_tile(self)

func get_edges() -> Array[Edge]:
	return _edges

func get_neighbours() -> Array[Tile]:
	if _neighbours.size() > 0:
		return _neighbours
	
	for e in _edges:
		var other = e.get_other_tile(self)
		if other != null:
			_neighbours.append(other)

	return _neighbours

func get_unobstructed_neighbours() -> Array[Tile]:
	var unobstructed: Array[Tile] = []

	for e in _edges:
		if e.has_hardware():
			continue

		var other = e.get_other_tile(self)
		if other != null:
			unobstructed.append(other)

	return unobstructed

func add_hardware(hardware: Hardware) -> void:
	assert(_hardware == null, "Tile already has hardware")
	_hardware = hardware

	add_child(hardware)

func get_hardware() -> Hardware:
	return _hardware

func add_software(software: Software) -> void:
	assert(!_software.has(software), "Tile already has software")

	_software.append(software)
	if software.get_parent() == null:
		add_child(software)
	else:
		software.reparent(self)
	
	software.currentTile = self

func remove_software(software: Software) -> void:
	assert(_software.has(software), "Tile does not have software")

	_software.erase(software)
	remove_child(software)

	software.currentTile = null

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
