tool
extends PanelContainer

const METALLIC_DEFAULT = 0
const SPECULAR_DEFAULT = 0.5

var metallicValue = 0
var specularValue = 0.5
var metallicActive = false
var specularActive = false
enum VALUE_MODES {
	floatMode,
	colorMode,
	textureMode
}
export(VALUE_MODES ) var currentMode
export(String) var valueName



func _on_Metallic_toggled(button_pressed):
	metallicActive = button_pressed


func _on_Metallic_Slider_value_changed(value):
	get_node("Metallic Category/Metallic Value/Metallic_SpinBox").set_value(value)
	metallicValue = value


func _on_Metallic_SpinBox_value_changed(value):
	get_node("Metallic Category/Metallic Value/Metallic_Slider").set_value(value)
	metallicValue = value


func _on_Specular_toggled(button_pressed):
	specularActive = button_pressed


func _on_Specular_Slider_value_changed(value):
	get_node("Metallic Category/Specular Value/Specular_SpinBox").set_value(value)
	specularValue = value


func _on_Specular_SpinBox_value_changed(value):
	get_node("Metallic Category/Specular Value/Specular_Slider").set_value(value)
	specularValue = value


func _on_Metallic_Reset_pressed():
	metallicValue = METALLIC_DEFAULT
	get_node("Metallic Category/Metallic Value/Metallic_Slider").set_value(METALLIC_DEFAULT)
	get_node("Metallic Category/Metallic Value/Metallic_SpinBox").set_value(METALLIC_DEFAULT)


func _on_Specular_Reset_pressed():
	specularValue = SPECULAR_DEFAULT
	get_node("Metallic Category/Specular Value/Specular_Slider").set_value(SPECULAR_DEFAULT)
	get_node("Metallic Category/Specular Value/Specular_SpinBox").set_value(SPECULAR_DEFAULT)
