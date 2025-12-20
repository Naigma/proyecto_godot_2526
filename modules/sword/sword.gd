extends Area2D
class_name Sword
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_timer_timeout() -> void:
	var bodies = self.get_overlapping_bodies()
	for body in bodies:
		if body.has_method("take_damage"):
			body.take_damage(2)
