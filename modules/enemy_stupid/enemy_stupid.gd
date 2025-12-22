extends CharacterBody2D
class_name EnemyStupid

@export var health : int = 20
@onready var animator: AnimatedSprite2D = $Sprite2D
@onready var damage_area: Area2D = $DamageArea

func _ready() -> void:
	animator.play("default")

func _process(delta: float) -> void:
	animator.play("default")
	
func take_damage(damage: int):
	health = health - damage
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE	 

func _on_timer_timeout() -> void:
	var bodies = damage_area.get_overlapping_bodies()
	for body in bodies:
		if body is Player:
			body.take_damage(1)
		
