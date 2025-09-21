extends Panel

@export var is_color = false
@export var product_name = "product_x"
@export var color = Color(Color.YELLOW)
@export var price = 100

func _ready() -> void:
	$price.text = var_to_str(price) + " Coins"
	$product.text = product_name
	$color.color = color
	if is_color:
		$product.visible = false
	else:
		$color.visible = false

func refresh():
	if is_color:
		if PurchaseManager.bought_colors.find(color) != -1:
			self.queue_free()
	else:
		if PurchaseManager.bought_features.find(self.name) != -1:
			self.queue_free()


func _on_button_pressed() -> void:
	if is_color:
		PurchaseManager.bought_colors.append(color)
		PurchaseManager.reload_colors.emit()
	else:
		PurchaseManager.bought_features.append(self.name)
		PurchaseManager.reload_navbar.emit()
	refresh()
