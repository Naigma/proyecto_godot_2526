extends Area2D
class_name PickUp

@export var pick_type: String
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animator.play(pick_type)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if pick_type == "heart":
			body.take_damage(-1)
		if pick_type == "coin":
			Currency.increment_coins(1)
		if pick_type == "egg":
			Currency.increment_eggs(1)
		queue_free()
