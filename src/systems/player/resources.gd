class_name Resources
extends Resource

## Generates resources which need storage
var gpuCycles: int:
	set(value):
		if value == gpuCycles:
			return
		gpuCycles = value
		emit_changed()

## Runs the active defense
var cpuCycles: int:
	set(value):
		if value == cpuCycles:
			return
		cpuCycles = value
		emit_changed()

## Runs the active offense
var ram: int:
	set(value):
		if value == ram:
			return
		ram = value
		emit_changed()

## Stores bitcoin and the code for running programs
var storage: int:
	set(value):
		if value == storage:
			return
		storage = value
		emit_changed()

## Used to buy hardware
var bitcoin: int:
	set(value):
		if value == bitcoin:
			return
		bitcoin = value
		emit_changed()
