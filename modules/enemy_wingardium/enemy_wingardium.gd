extends CharacterBody2D
class_name EnemyWingardium

@export var health : int = 20
@onready var enemy_wingardium: CharacterBody2D = $"."

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	animator.play("idle")
		
func _process(delta: float) -> void:
	animator.play("idle")
	
func take_damage(damage: int):
	health = health - damage
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE
