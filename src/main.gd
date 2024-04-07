class_name GameState
extends Node2D

var map: Map:
	get:
		return $Map
var player: Player = Player.new()

var timer

func _ready() -> void:
	for swData in player.deployableSoftware:
		var sw = Create.software(swData)
		player.software.append(sw)
		var tile = map._tilesLookup.pick_random().pick_random()
		tile.add_software(sw)

	timer = Timer.new()
	timer.timeout.connect(_tick)
	add_child(timer)
	timer.start(1.0)

func _tick():
	for sw in player.software:
		sw.computeMove()
	for sw in player.software:
		sw.commitMove()
	for sw in player.software:
		sw.execute()
