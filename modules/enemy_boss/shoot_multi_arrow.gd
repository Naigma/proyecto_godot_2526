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
	
	var direction = Vector2.UP.rotated(randf_range(0, TAU))
	var n_bullets = randi_range(3,7)
	var turn = TAU / n_bullets
	for i in n_bullets:
		var instance = bullet_scene.instantiate()
		
		direction = direction.rotated(turn)
		instance.direction = direction
		instance.global_position = actor.global_position
		
		actor.get_parent().add_child(instance)
		
