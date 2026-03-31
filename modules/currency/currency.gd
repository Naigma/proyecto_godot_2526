extends Node
signal coins_updated(coins : int)
var coins : int = 0

func increment_coins(amount : int):
	coins += amount
	coins_updated.emit(coins)
	print(coins)

signal eggs_updated(eggs : int)
var eggs : int = 0

func increment_eggs(amount : int):
	eggs += amount
	eggs_updated.emit(eggs)
	print(eggs)
