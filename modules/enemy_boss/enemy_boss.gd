extends CharacterBody2D
class_name EnemyBoss

signal health_updated(health)
@export var max_health : float = 40
@export var health : float = 40
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func take_damage(damage: int):
	health = health - damage
	health_updated.emit(health)
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE
