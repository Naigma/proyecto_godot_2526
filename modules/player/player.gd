extends CharacterBody2D
class_name Player
@onready var sprite_player: AnimatedSprite2D = $SpritePlayer
@export var speed : float = 100.00

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
