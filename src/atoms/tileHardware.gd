class_name TileHardware
extends Hardware

@onready var nameLabel: RichTextLabel:
	get:
		return $Name

var tile: Tile

func init(hardwareData: HardwareData):
	data = hardwareData
	nameLabel.text = "[center]%s" % data.hardwareName
