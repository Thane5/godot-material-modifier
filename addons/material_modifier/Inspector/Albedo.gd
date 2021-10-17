@tool
extends PanelContainer

const ALBEDO_DEFAULT = Color(1,1,1,1)
var albedoColor = ALBEDO_DEFAULT
var active = false


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	albedoColor = get_node("VBoxContainer/Albedo Value/ColorPickerButton").get_pick_color()


func _on_Albedo_CheckBox_toggled(button_pressed):
	active = button_pressed


func _on_ColorPickerButton_color_changed(color):
	albedoColor = color

#	Restore defaults
func _on_Color_Reset_pressed():
	albedoColor = ALBEDO_DEFAULT
	get_node("VBoxContainer/Albedo Value/ColorPickerButton").set_pick_color(ALBEDO_DEFAULT)

