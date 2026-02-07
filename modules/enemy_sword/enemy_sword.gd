extends CharacterBody2D
class_name EnemySword

@export var health : int = 40
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@onready var damage_area: Area2D = $DamageArea

func _ready() -> void:
	animator.play("walk")

func _process(delta: float) -> void:
	animator.play("walk")
	
func take_damage(damage : int):
	pass
