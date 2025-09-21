extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_esc"):
		if $shop.visible:
			$shop.visible = false
