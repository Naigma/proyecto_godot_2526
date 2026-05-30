extends ConditionLeaf

@export var timer: Timer

func tick(actor: Node, blackboard: Blackboard) -> int:
	if timer.is_stopped():
		timer.start()
		return SUCCESS
	
	return FAILURE
