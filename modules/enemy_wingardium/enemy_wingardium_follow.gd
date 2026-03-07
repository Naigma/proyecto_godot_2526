extends State
class_name EnemyWingardiumFollowState

@export var move_speed := 40.0
@export var enemy: CharacterBody2D
var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("player")
	print(player)

func physics_update(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 110:
		enemy.velocity = direction.normalized() * move_speed
	elif direction.length() > 75:
		enemy.velocity = Vector2.ZERO
	else:
		enemy.velocity = direction.normalized() * -move_speed
	enemy.move_and_slide()

	if direction.length() > 170:
		transitioned.emit(self,"idle")
		
