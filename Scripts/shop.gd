extends Control

func _process(delta: float) -> void:
	$coins.text = "Balance: " + var_to_str(UiHandler.coins) + " Coins"
func _ready() -> void:
	PurchaseManager.reload_navbar.connect(update)
	PurchaseManager.reload_colors.connect(update)
func update():
	for i in $ScrollContainer/VBoxContainer.get_children():
		if i is Panel:
			if i.is_color and PurchaseManager.bought_colors.find(i.color) != -1:
				i.queue_free()
			elif PurchaseManager.bought_features.find(i.name) != -1:
				i.queue_free()
