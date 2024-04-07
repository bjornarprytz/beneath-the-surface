class_name Software
extends Node2D

## Represents a program designed to traverse the opposing network

var nameLabel: RichTextLabel:
	get:
		return $NameLabel

var data: SoftwareData

var currentTile: Tile

var nextTile: Tile = null

func init(swData: SoftwareData):
	data = swData
	nameLabel.text = data.softwareName

func computeMove():
	nextTile = data.movementStrategy.move(self)

func execute():
	if data.executionStrategy != null:
		data.executionStrategy.execute(self)

func commitMove():
	if nextTile != null:
		currentTile.remove_software(self)
		nextTile.add_software(self)
		nextTile = null
