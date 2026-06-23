extends Control
@onready var bar: ProgressBar = $ProgressBar
@export var boss: EnemyBoss
@export var color_health: float = 20

func _ready() -> void:
	bar.max_value = boss.max_health
	bar.value = boss.health
	bar.modulate = Color.LIME_GREEN
	
	boss.health_updated.connect(_update_bar)
	
func _update_bar(health):
	bar.value = health
	if health > color_health:
		bar.modulate = Color.LIME_GREEN
	else:
		bar.modulate = Color.RED
