extends CanvasLayer
class_name UI

@onready var coins_label: Label = $CoinsLabel

func _ready() -> void:
	Currency.coins_updated.connect(update_coin_label)
	update_coin_label(Currency.coins)
	
func update_coin_label(coins : int):
	coins_label.text = "coins: " + str(coins)
	
