class_name CreateHelper
extends Node2D

@onready var tileSpawner = preload ("res://systems/map/tile.tscn")
@onready var edgeSpawner = preload ("res://systems/map/edge.tscn")

func tile(coord: Vector2i, size: float) -> Tile:
	var tileScene = tileSpawner.instantiate() as Tile
	tileScene.size = size
	tileScene.coordinates = coord
	return tileScene

func edge(v1: Vector2i, v2: Vector2i, size: float, thickness: float) -> Edge:
	var edgeScene = edgeSpawner.instantiate() as Edge
	edgeScene.size = size
	edgeScene.thickness = thickness
	edgeScene.v1 = v1
	edgeScene.v2 = v2
	return edgeScene
