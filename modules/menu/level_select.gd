class_name LevelSelect extends Button

@export var level_name: String = "Level"
@export var level_scene: PackedScene

func _ready() -> void:
	self.text = level_name


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(level_scene)
