extends State
class_name EnemyWingardiumFollowState

@export var bullet_scene : PackedScene
@export var move_speed := 40.0
@export var enemy: CharacterBody2D
var player: CharacterBody2D

@onready var shoot_timer: Timer = $ShootTimer

func enter():
	player = get_tree().get_first_node_in_group("player")
	shoot_timer.start()

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

func shoot():
	var instance = bullet_scene.instantiate() as Bullet
	
	instance.direction = enemy.global_position.direction_to(player.global_position).normalized()
	instance.global_position = enemy.global_position
	instance.look_at(player.global_position)
	
	get_parent().add_child(instance)
	
func exit():
	shoot_timer.stop()
