extends CharacterBody2D
class_name EnemyBoss

@export var max_health : float = 20
@export var health : float = 20
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func take_damage(damage: int):
	health = health - damage
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE
