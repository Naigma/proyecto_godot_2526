extends ConditionLeaf
@export_range(0,1,0.1) var min_health : float = 0.5

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if actor.health > actor.max_health * min_health:
		return SUCCESS

	return FAILURE
