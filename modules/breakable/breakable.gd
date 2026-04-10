extends StaticBody2D
class_name Breakable
var health : int = 10
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@export var pick_up_scene : PackedScene 

func take_damage(damage: int):
	health = health - damage
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		var instance = pick_up_scene.instantiate() as PickUp
		instance.pick_type = "coin"
		instance.global_position = self.global_position
		
		# TODO: Eliminar get parent
		get_parent().add_child(instance)
		
		queue_free()
	
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE
	
