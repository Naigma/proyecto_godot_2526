extends ConditionLeaf

var player : Player = null
@export var units : float = 300

func _ready() -> void:
		player = get_tree().get_first_node_in_group("player")

func tick(actor: Node, blackboard: Blackboard) -> int:
	if !player:
		return FAILURE
	
	if actor.global_position.distance_to(player.global_position) > units:
		return FAILURE
	
	return SUCCESS
