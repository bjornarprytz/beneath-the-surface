class_name MovementStrategy
extends Resource

func move(_software: Software) -> Tile:
	push_warning("MovementStrategy.move() not implemented. Movement is random.");
	var options = _software.currentTile.get_unobstructed_neighbours()
	if options.size() > 0:
		return options.pick_random();
	else:
		return null
