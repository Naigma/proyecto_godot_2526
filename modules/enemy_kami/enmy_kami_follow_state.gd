extends State
class_name EnemyKamiFollowState

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
@export var idle_range : float = 120
@export var explode_range : float = 30

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("player")
	print(player)

func physics_update(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2.ZERO
	
	enemy.move_and_slide()

	if direction.length() > idle_range:
		transitioned.emit(self,"idle")
	if direction.length() < explode_range:
		transitioned.emit(self, "explode")
