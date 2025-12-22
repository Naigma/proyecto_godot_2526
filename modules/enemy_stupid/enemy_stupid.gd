extends CharacterBody2D
class_name EnemyStupid

@export var health : int = 20
@onready var animator: AnimatedSprite2D = $Sprite2D

func _process(delta: float) -> void:
	pass
	
func take_damage(damage: int):
	health = health - damage
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE
	 
