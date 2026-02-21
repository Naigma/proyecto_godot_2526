extends State
class_name EnemySwordFollowState

@export var enemy : CharacterBody2D
@export var move_speed := 40.0
var player : CharacterBody2D
@export var near_range : float = 25.0
@export var follow_range : float = 200.0

func enter():
	player = get_tree().get_first_node_in_group("player")
	print(player)
	enemy.weapon.show()
	
func physics_update(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > near_range:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2.ZERO
		
	enemy.move_and_slide()
	
	if direction.length() > follow_range :
		transitioned.emit(self,"idle")
