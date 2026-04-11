extends Area2D
class_name Bullet

@export var damage : int = 1
@export var speed : float = 200
var direction : Vector2 = Vector2.ZERO
@export var decay_time : float = 1

func _ready() -> void:
	await get_tree().create_timer(decay_time).timeout
	self.queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(damage)
		self.queue_free()
		
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
