extends Control

func _process(delta: float) -> void:
	$coins.text = "Balance: " + var_to_str(UiHandler.coins) + " Coins"
