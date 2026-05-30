extends ActionLeaf

@export var bullet_scene : PackedScene
var player : Player = null

func _ready() -> void:
		player = get_tree().get_first_node_in_group("player")
		
func tick(actor: Node, blackboard: Blackboard) -> int:
	if !player:
		return FAILURE
		
	shoot(actor)
	return SUCCESS

func shoot(actor: Node):
	var instance = bullet_scene.instantiate() as Bullet
	
	instance.speed = 600
	instance.direction = actor.global_position.direction_to(player.global_position).normalized()
	instance.global_position = actor.global_position
	instance.look_at(player.global_position)
	
	get_parent().add_child(instance)
