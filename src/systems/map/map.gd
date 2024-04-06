class_name Map
extends Node2D

signal tileHovered(tile: Tile)
signal edgeHovered(edge: Edge)
signal intersectionHovered(intersection: Cross)

@onready var tiles = $Tiles
@onready var edges = $Edges

@export var tileSize: float = 50
@export var edgeThickness: float = 20
@export var data: MapData

## [X][Y] = tile
var _tilesLookup: Array[Array] = []
var _edgeColumnLookup: Array[Array] = []
var _edgeRowLookup: Array[Array] = []
var _intersectionLookup: Array[Array] = []

func _ready():
	_update_map()

func _update_map():
	for x in range(data.width):
		var column = []
		for y in range(data.height):
			var tile = Create.tile(Vector2i(x, y), tileSize)
			tile.position = Vector2(x * tileSize, y * tileSize)
			column.append(tile)
			tiles.add_child(tile)
			tile.hovered.connect(_tile_hovered)
		_tilesLookup.append(column)

	# Create edge columns
	for x in range(data.width + 1):
		var column = []
		for y in range(data.height):
			var edge = Create.edge(Vector2i(x, y), Vector2i(x, y + 1), tileSize, edgeThickness)
			edge.position = Vector2(x * tileSize, y * tileSize)
			column.append(edge)
			edges.add_child(edge)
			edge.hovered.connect(_edge_hovered)
		_edgeColumnLookup.append(column)
	
	# Create edge rows
	for x in range(data.width):
		var row = []
		for y in range(data.height + 1):
			var edge = Create.edge(Vector2i(x, y), Vector2i(x + 1, y), tileSize, edgeThickness)
			edge.position = Vector2(x * tileSize, y * tileSize)
			row.append(edge)
			edges.add_child(edge)
			edge.hovered.connect(_edge_hovered)
		_edgeRowLookup.append(row)
	
	# Create intersections (cross)
	for x in range(0, data.width + 1):
		_intersectionLookup.append([])
		for y in range(0, data.height + 1):
			var intersection = Create.cross(Vector2i(x, y), tileSize, edgeThickness)
			intersection.position = Vector2(x * tileSize, y * tileSize)
			edges.add_child(intersection)
			_intersectionLookup[x].append(intersection)
			intersection.hovered.connect(_intersection_hovered)

	# Connect edges and tiles
	for column in _edgeColumnLookup:
		for edge in column:

			var c1 = _get_intersection(edge.v1)
			var c2 = _get_intersection(edge.v2)
			if c1 != null:
				c1.connect_edge(edge)
			if c2 != null:
				c2.connect_edge(edge)

			var t1 = _get_tile(edge.v1)
			var t2 = _get_tile(Vector2i(edge.v1.x - 1, edge.v1.y))
			if t1 != null:
				t1.connect_edge(edge)
			if t2 != null:
				t2.connect_edge(edge)
	
	for row in _edgeRowLookup:
		for edge in row:

			var c1 = _get_intersection(edge.v1)
			var c2 = _get_intersection(edge.v2)
			if c1 != null:
				c1.connect_edge(edge)
			if c2 != null:
				c2.connect_edge(edge)

			var t1 = _get_tile(edge.v1)
			var t2 = _get_tile(Vector2i(edge.v1.x, edge.v1.y - 1))
			if t1 != null:
				t1.connect_edge(edge)
			if t2 != null:
				t2.connect_edge(edge)

func _get_tile(v: Vector2i) -> Tile:
	var x = v.x
	var y = v.y
	if x < 0 or x >= _tilesLookup.size() or y < 0 or y >= _tilesLookup[x].size():
		return null
	return _tilesLookup[x][y]

func _get_intersection(v: Vector2i) -> Cross:
	var x = v.x
	var y = v.y
	if x < 0 or x >= _intersectionLookup.size() or y < 0 or y >= _intersectionLookup[x].size():
		return null
	return _intersectionLookup[x][y]

func _tile_hovered(tile: Tile):
	tileHovered.emit(tile)

func _edge_hovered(edge: Edge):
	edgeHovered.emit(edge)

func _intersection_hovered(intersection: Cross):
	intersectionHovered.emit(intersection)
