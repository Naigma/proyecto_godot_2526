extends Area2D
class_name Bullet

@export var damage : int = 1
@export var speed : float = 200
var direction : Vector2 = Vector2.ZERO

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(damage)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
