extends ActionLeaf

var player : Player = null
@export var speed : float = 10

func _ready() -> void:
		player = get_tree().get_first_node_in_group("player")
		
func tick(actor: Node, _blackboard: Blackboard) -> int:
	if !player:
		return FAILURE
		
	var direction : Vector2 = actor.global_position.direction_to(player.global_position).normalized()
	actor.velocity = direction * speed
	
	actor.move_and_slide()
	
	return SUCCESS
