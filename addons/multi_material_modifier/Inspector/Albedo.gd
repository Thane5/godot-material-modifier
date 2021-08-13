tool
extends PanelContainer

var albedoColor 
var active = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _enter_tree():
	var style1 = load("res://addons/multi_material_modifier/Inspector/ExpandArea_header.tres")
	style1.set_default_margin(MARGIN_TOP, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	albedoColor = get_node("VBoxContainer/Albedo Value/ColorPickerButton").get_pick_color()
	


func _on_Albedo_CheckBox_toggled(button_pressed):
	active = button_pressed


func _on_ColorPickerButton_color_changed(color):
	albedoColor = color


func _on_Color_Reset_pressed():
	albedoColor = Color(1,1,1,1)
	get_node("VBoxContainer/Albedo Value/ColorPickerButton").set_pick_color(albedoColor)

