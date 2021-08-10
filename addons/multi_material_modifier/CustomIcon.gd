tool
extends Button

export(String) var customIcon


# Called when the node enters the scene tree for the first time.
func _ready():
	icon = get_icon(customIcon, 'EditorIcons')
	set_button_icon(icon)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
