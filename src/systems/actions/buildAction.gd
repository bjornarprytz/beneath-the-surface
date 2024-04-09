class_name BuildAction
extends Node2D

signal finished()

var _hardwareData: HardwareData
var _map: Map
var _resources: Resources

func init(hardwareData: HardwareData, gameState: GameState) -> void:
	_hardwareData = hardwareData
	_map = gameState.map
	_resources = gameState.player.resources

	match hardwareData.type:
		HardwareData.Type.TILE:
			_map.tileClicked.connect(_on_tile_clicked)
		HardwareData.Type.EDGE:
			_map.edgeClicked.connect(_on_edge_clicked)
		HardwareData.Type.CROSS:
			_map.intersectionClicked.connect(_on_intersection_clicked)

func cancel() -> void:
	_finish()

func _unhandled_input(event: InputEvent) -> void:
	## Cancel with mouse 2
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			_finish()

func _on_tile_clicked(tile: Tile) -> void:
	## Place the hardware on the tile
	var hardware = Create.hardware(_hardwareData)
	tile.add_hardware(hardware)
	_resources.bitcoin -= _hardwareData.cost
	_finish()

func _on_edge_clicked(edge: Edge) -> void:
	## Place the hardware on the edge
	var hardware = Create.hardware(_hardwareData)
	edge.add_hardware(hardware)
	_finish()

func _on_intersection_clicked(intersection: Cross) -> void:
	## Place the hardware on the intersection
	var hardware = Create.hardware(_hardwareData)
	intersection.add_hardware(hardware)
	_finish()

func _finish() -> void:
	finished.emit()
	queue_free()
