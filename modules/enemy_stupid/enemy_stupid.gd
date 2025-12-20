extends CharacterBody2D
class_name EnemyStupid

@export var health : int = 20

func _process(delta: float) -> void:
	pass
	
func take_damage(damage: int):
	health = health - damage
	if health < 1:
		queue_free()
	 
