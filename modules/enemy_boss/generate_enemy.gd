extends ActionLeaf

@export var bullet_scene : PackedScene
@export var n_enemies: int = 1
var player : Player = null
@export var magnitude : float = 30

func _ready() -> void:
		player = get_tree().get_first_node_in_group("player")
		
func tick(actor: Node, blackboard: Blackboard) -> int:
	if !player:
		return FAILURE
		
	for _i in n_enemies:
		generate(actor)
	return SUCCESS
	
func generate(actor: Node):
	var instance = bullet_scene.instantiate()
	
	var direction_random_vector = Vector2.UP.rotated(randf_range(0, TAU))
	var random_vector : Vector2 = direction_random_vector * magnitude
	
	instance.global_position = actor.global_position + random_vector
	
	actor.get_parent().add_child(instance)
