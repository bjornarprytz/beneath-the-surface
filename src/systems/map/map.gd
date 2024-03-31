class_name Map
extends Node2D

@onready var tiles = $Tiles
@onready var edges = $Edges

@export var tileSize: float = 50
@export var edgeThickness: float = 20
@export var data: MapData

## [X][Y] = tile
var _tilesLookup: Array[Array] = []
var _edgeColumnLookup: Array[Array] = []
var _edgeRowLookup: Array[Array] = []

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
		_tilesLookup.append(column)

	# Create edge columns
	for x in range(data.width + 1):
		var column = []
		for y in range(data.height):
			var edge = Create.edge(Vector2i(x, y), Vector2i(x, y + 1), tileSize, edgeThickness)
			edge.position = Vector2(x * tileSize, y * tileSize)
			column.append(edge)
			edges.add_child(edge)
		_edgeColumnLookup.append(column)
	
	# Create edge rows
	for x in range(data.width):
		var row = []
		for y in range(data.height + 1):
			var edge = Create.edge(Vector2i(x, y), Vector2i(x + 1, y), tileSize, edgeThickness)
			edge.position = Vector2(x * tileSize, y * tileSize)
			row.append(edge)
			edges.add_child(edge)
		_edgeRowLookup.append(row)

	# Connect edges and tiles
