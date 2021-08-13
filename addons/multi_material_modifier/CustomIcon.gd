@tool
extends Button

@export var customIcon: String


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	icon = get_theme_icon(customIcon, 'EditorIcons')
	set_button_icon(icon)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
