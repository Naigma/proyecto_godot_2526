extends State
class_name EnemyKamiExplodeState

@export var enemy : CharacterBody2D

func enter():
	enemy.queue_free()
