extends CharacterBody2D
class_name NPC

@export var dialogue: String
@onready var dialogue_label: Label = $DialogueLabel

func interact():
	dialogue_label.text = dialogue
	
