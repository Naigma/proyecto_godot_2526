extends Area2D
class_name PlayerBullet

@export var damage : int = 1
@export var speed : float = 400
var direction : Vector2 = Vector2.ZERO

func _on_body_entered(body: Node2D) -> void:
	if body is not Player and body.has_method("take_damage"):
		body.take_damage(damage)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
