extends Node
signal coins_updated(coins : int)
var coins : int = 7

func increment_coins(amount : int):
	coins += amount
	coins_updated.emit(coins)
	print(coins)
	
	
