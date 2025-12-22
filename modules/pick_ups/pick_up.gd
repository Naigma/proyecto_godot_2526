extends Area2D
class_name pick_up

@export var pick_type: String
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animator.play(pick_type)
