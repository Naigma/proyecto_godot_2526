extends State
class_name EnemyKamiExplodeState

@export var enemy : CharacterBody2D
@export var damage : int = 5
@export var fuse_time : float = 1.0

func enter():
	get_tree().create_timer(fuse_time).timeout.connect(_explode)
	
	#TODO: Animación explosión
	enemy.modulate = Color.BLUE
	await get_tree().create_timer(0.15).timeout
	enemy.modulate = Color.WHITE
	
func _explode():
	var bodies = enemy.explosion_area.get_overlapping_bodies()
	for body in bodies:
		if body is Player:
			body.take_damage(damage)
	
	enemy.queue_free()
