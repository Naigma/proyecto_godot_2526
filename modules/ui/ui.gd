extends CanvasLayer
class_name UI

@onready var coins_label: Label = $CoinsLabel
@onready var eggs_label: Label = $EggsLabel

func _ready() -> void:
	Currency.eggs_updated.connect(update_egg_label)
	update_egg_label(Currency.eggs)
	Currency.coins_updated.connect(update_coin_label)
	update_coin_label(Currency.coins) 
	
func update_egg_label(eggs : int):
	eggs_label.text = "eggs: " + str(eggs)
	

func update_coin_label(coins : int):
	coins_label.text = "coins: " + str(coins)
