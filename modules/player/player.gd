extends CharacterBody2D
class_name Player

@onready var sprite_player: AnimatedSprite2D = $SpritePlayer
@export var speed : float = 100.00
@onready var interaction_area: Area2D = $InteractionArea
@onready var weapon_pivot: Node2D = $WeaponPivot
@export var max_health: int = 6
var health = max_health

func _ready() -> void:
	$HealthBar.max_value=max_health
	set_health_bar()

func set_health_bar() -> void:
	var ratio = float(health) / float(max_health)
	$HealthBar.value = health
	
	if ratio > 0.6:
		$HealthBar.modulate = Color.GREEN
	elif ratio > 0.3:
		$HealthBar.modulate = Color.ORANGE
	else:
		$HealthBar.modulate = Color.RED

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
	health = clamp(health-damage,0,max_health)
	
	if damage > 0:
		sprite_player.modulate = Color.INDIAN_RED
	else:
		sprite_player.modulate = Color.WEB_GREEN
		
	if health <= 0:
		hide()
		
	set_health_bar()
	
	await get_tree().create_timer(0.1).timeout
	sprite_player.modulate = Color.WHITE
