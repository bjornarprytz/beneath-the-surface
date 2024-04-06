class_name Edge
extends Node2D

signal hovered(edge: Edge)
signal unhovered(edge: Edge)
signal clicked(edge: Edge)

@onready var background: ColorRect = $Background

## Coordinates correspond to the top left corner of a tile
var v1: Vector2i
## Coordinates correspond to the top left corner of a tile
var v2: Vector2i
## Length of the edge. This should the same across the board
var size: float
var thickness: float

var _tiles: Array[Tile]
var _intersections: Array[Cross]

func connect_tile(tile: Tile):
	if _tiles.has(tile):
		return
	
	_tiles.append(tile)
	tile.connect_edge(self)

func connect_intersection(intersection: Cross):
	if _intersections.has(intersection):
		return
	
	_intersections.append(intersection)
	intersection.connect_edge(self)

func get_intersections() -> Array[Cross]:
	return _intersections

func get_tiles() -> Array[Tile]:
	return _tiles

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

	if Edge.is_horizontal(v1, v2):
		background.rotation_degrees = 0
	else:
		background.rotation_degrees = 90

func _on_background_mouse_entered() -> void:
	background.modulate = Color(0.5, 0.5, 0.5, 1)
	for t in _tiles:
		t.modulate = Color(0.5, 0.5, 0.5, 1)
	for i in _intersections:
		i.modulate = Color(0.5, 0.5, 0.5, 1)
	hovered.emit(self)

func _on_background_mouse_exited() -> void:
	background.modulate = Color(1, 1, 1, 1)
	for t in _tiles:
		t.modulate = Color(1, 1, 1, 1)
	for i in _intersections:
		i.modulate = Color(1, 1, 1, 1)
	unhovered.emit(self)

static func is_horizontal(coord1: Vector2i, coord2: Vector2i) -> bool:
	if coord2 - coord1 == Vector2i.RIGHT:
		return true
	elif coord2 - coord1 == Vector2i.DOWN:
		return false
	else:
		assert(false, "Weird edge direction %s" % (coord1 - coord2))
		return false

func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.button_index == MOUSE_BUTTON_LEFT and mouseEvent.pressed:
			clicked.emit(self)
