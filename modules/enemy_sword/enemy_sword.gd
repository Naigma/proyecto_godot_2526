extends CharacterBody2D
class_name EnemySword

@export var health : int = 40
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D
@onready var weapon: Area2D = $Pivot/Weapon
@onready var pivot: Node2D = $Pivot

func _ready() -> void:
	animator.play("walk")

func _process(_delta: float) -> void:
	animator.play("walk")
	
	#TODO: Eliminar esto, es debug.
	if Input.is_action_just_pressed("ui_accept"):
		take_damage(1)
	
func take_damage(damage : int):
	health = health - damage
	animator.modulate = Color.INDIAN_RED
	if health < 1:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	animator.modulate = Color.WHITE
	
func _physics_process(delta: float) -> void:
	pivot.rotation += PI * delta
	
