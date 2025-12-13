extends CharacterBody2D
class_name Player
@onready var sprite_player: AnimatedSprite2D = $SpritePlayer
@export var speed : float = 100.00

func _ready() -> void:
	sprite_player.play("default")
	
func _physics_process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("left","right","up","down").normalized()
	self.velocity = direction * speed
	move_and_slide()
