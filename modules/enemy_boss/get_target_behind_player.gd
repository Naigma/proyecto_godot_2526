extends ActionLeaf

var player : Player = null
@export var units : float = 300

func _ready() -> void:
		player = get_tree().get_first_node_in_group("player")

func tick(actor: Node, blackboard: Blackboard) -> int:
	if !player:
		return FAILURE
	
	var dir : Vector2 = actor.global_position.direction_to(player.global_position)
	var increment_v : Vector2 = dir.normalized()*units
	
	var target_v : Vector2 = dir + increment_v
	var target_pos : Vector2 = actor.global_position + target_v
	
	blackboard.set_value("dir",dir.normalized())
	blackboard.set_value("target_pos",target_pos)
	
	return SUCCESS
