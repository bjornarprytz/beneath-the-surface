class_name CreateHelper
extends Node2D

@onready var tileSpawner = preload ("res://systems/map/tile.tscn")
@onready var edgeSpawner = preload ("res://systems/map/edge.tscn")
@onready var crossSpawner = preload ("res://systems/map/cross.tscn")

@onready var edgeHardwareSpawner = preload ("res://atoms/hardware_edge.tscn")
@onready var crossHardwareSpawner = preload ("res://atoms/hardware_cross.tscn")
@onready var tileHardwareSpawner = preload ("res://atoms/hardware_tile.tscn")

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

func cross(coord: Vector2i, tileSize: float, thickness: float) -> Cross:
	var crossScene = crossSpawner.instantiate() as Cross
	crossScene.tileSize = tileSize
	crossScene.thickness = thickness
	crossScene.coordinates = coord
	return crossScene

func hardware(hardwareData: HardwareData) -> Hardware:
	
	match hardwareData.type:
		HardwareData.Type.EDGE:
			var scene = edgeHardwareSpawner.instantiate() as EdgeHardware
			scene.init(hardwareData)
			return scene
		HardwareData.Type.CROSS:
			var scene = crossHardwareSpawner.instantiate() as CrossHardware
			scene.init(hardwareData)
			return scene
		HardwareData.Type.TILE:
			var scene = tileHardwareSpawner.instantiate() as TileHardware
			scene.init(hardwareData)
			return scene
	
	assert(false, "Hardware type not implemented")
	return null
