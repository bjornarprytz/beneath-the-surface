class_name HardwareData
extends Resource

## Indicates which role the hardware fills
enum Category {
	CPU,
	GPU,
	RAM,
	STORAGE,
	NETWORK,
	DEFENSE
}

## Determines where the hardware can be placed
enum Type {
	TILE,
	EDGE,
	CROSS
}

## Cost in bit coin
var cost: int

## User facing name
var hardwareName: String

## The category of hardware
var category: Category

## The type of hardware
var type: Type

func withCost(hwCost: int) -> HardwareData:
	self.cost = hwCost
	return self

func withName(hwName: String) -> HardwareData:
	self.hardwareName = hwName
	return self

func withCategory(hwCategory: Category) -> HardwareData:
	self.category = hwCategory
	return self

func withType(hwType: Type) -> HardwareData:
	self.type = hwType
	return self
