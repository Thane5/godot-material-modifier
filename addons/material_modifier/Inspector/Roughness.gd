@tool
extends PanelContainer

const ROUGHNESS_DEFAULT = 1

var roughness = ROUGHNESS_DEFAULT
var active = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Roughness_CheckBox_toggled(button_pressed):
	active = button_pressed

func _on_Roughness_Slider_value_changed(value):
	get_node("VBoxContainer/Roughness Value/Roughness_SpinBox").set_value(value)
	roughness = value

func _on_Roughness_SpinBox_value_changed(value):
	get_node("VBoxContainer/Roughness Value/Roughness_Slider").set_value(value)
	roughness = value


#	Restore defaults
func _on_Roughness_Reset_pressed():
	roughness = ROUGHNESS_DEFAULT
	get_node("VBoxContainer/Roughness Value/Roughness_Slider").set_value(ROUGHNESS_DEFAULT)
	get_node("VBoxContainer/Roughness Value/Roughness_SpinBox").set_value(ROUGHNESS_DEFAULT)
