extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_esc"):
		if $shop.visible:
			$shop.visible = false
		else:
			save()

func save():
	var sf = {}
	sf["lines"] = []
	for i in $ScrollContainer/Control/TextEdit.get_children():
		sf["lines"].append([i.points[0], i.points[1], i.default_color])
	sf["text"] = $ScrollContainer/Control/TextEdit.text
	print(sf)
	var sf_file = FileAccess.open("user://" + UiHandler.docs_name + ".noot", FileAccess.WRITE)
	sf_file.store_var(sf)

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

func _ready() -> void:
	sf_load()
