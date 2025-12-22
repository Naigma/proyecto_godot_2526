extends CharacterBody2D
class_name Player

@onready var sprite_player: AnimatedSprite2D = $SpritePlayer
@export var speed : float = 100.00
@onready var interaction_area: Area2D = $InteractionArea
@onready var weapon_pivot: Node2D = $WeaponPivot
@export var health: int = 6

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("left","right","up","down").normalized()
	self.velocity = direction * speed
	move_and_slide()

func _process(delta: float) -> void:
	if velocity == Vector2.ZERO:
		sprite_player.stop()
	else:
		sprite_player.play("walk")
		
	if Input.is_action_just_pressed("interact"):
		var bodies = interaction_area.get_overlapping_bodies()
		for body in bodies:
			if body.has_method("interact"):
				body.interact()
	var mouse_position : Vector2 = get_global_mouse_position()
	weapon_pivot.look_at(mouse_position)
	
func take_damage(damage):
	health = health - damage
	sprite_player.modulate = Color.INDIAN_RED
	if health <= 0:
		queue_free()
	await get_tree().create_timer(0.1).timeout
	sprite_player.modulate = Color.WHITE
