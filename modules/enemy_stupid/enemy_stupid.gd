extends CharacterBody2D

@export var health : int = 20

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		take_damage(5)
	

func take_damage(damage: int):
	health = health - damage
	if health < 1:
		queue_free()
	 
