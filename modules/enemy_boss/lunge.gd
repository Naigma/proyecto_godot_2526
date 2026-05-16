extends ActionLeaf

@export var speed : float = 700

func tick(actor: Node, blackboard: Blackboard) -> int:
	var target_pos : Vector2 = blackboard.get_value("target_pos")
	
	if actor.global_position.distance_to(target_pos) < 20:
		actor.velocity = Vector2.ZERO
		actor.move_and_slide()
		return SUCCESS
	
	var dir : Vector2 = blackboard.get_value("dir")
	
	actor.velocity = dir * speed
	actor.move_and_slide()
	return RUNNING
