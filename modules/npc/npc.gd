extends CharacterBody2D
class_name NPC

@export var dialogue: String
@export var npc_type: String
@onready var dialogue_label: Label = $DialogueLabel
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animator.play(npc_type)
	
func interact():
	dialogue_label.text = dialogue
	await get_tree().create_timer(3).timeout
	dialogue_label.text = ""
