extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_esc"):
		if $shop.visible:
			$shop.visible = false
func save():
	var sf = {}
	sf["lines"] = []
	for i in $ScrollContainer/Control/TextEdit.get_children():
		sf["lines"].append([i.points[0], i.points[1], i.default_color])
	sf["text"] = $ScrollContainer/Control/TextEdit.text
	print(sf)
	var sf_file = FileAccess.open("user://" + UiHandler.docs_name + ".noot", FileAccess.WRITE)
	sf_file.store_var(sf)
	var user_data = {"coins": UiHandler.coins, "colors": PurchaseManager.bought_colors, "features": PurchaseManager.bought_features}
	var ud_file = FileAccess.open("user://user_data.nootnoot", FileAccess.WRITE)
	ud_file.store_var(user_data)
	ud_file.close()
	sf_file.close()
func sf_load():
	var sf_file = FileAccess.open("user://" + UiHandler.docs_name + ".noot", FileAccess.READ)
	if sf_file != null:
		var sf = sf_file.get_var()
		print(sf)
		var lines = sf["lines"]
		for i in lines:
			print(i)
			$drawing_area.make_line(i[0], i[1], i[2])
		$ScrollContainer/Control/TextEdit.text = sf["text"]
	var ud_file = FileAccess.open("user://user_data.nootnoot", FileAccess.READ)
	if ud_file != null:
		var user_data = ud_file.get_var()
		UiHandler.coins = user_data["coins"]
		PurchaseManager.bought_colors = user_data["colors"]
		PurchaseManager.bought_features = user_data["features"]
		PurchaseManager.reload_colors.emit()
		PurchaseManager.reload_navbar.emit()
func _ready() -> void:
	sf_load()
