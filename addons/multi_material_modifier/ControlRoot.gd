tool
extends Control

export(NodePath) var nameLabelPath
export(NodePath) var previewAreaPath
export(NodePath) var loadPath

var currentResourcePath = "res://SomeMat1.material"
var currentResource

func _enter_tree():
	var theme = load("res://addons/multi_material_modifier/Inspector/Editor.tres")
	var style1 = load("res://addons/multi_material_modifier/Inspector/ExpandArea_header.tres")
	var colorBG = get_color("dark_color_1", "Editor") 
	var colorTest = Color(0.15,0.1725,0.2325,1)
	theme.set_color("bg_color", "Panel/colors/Panel", colorTest)
	theme.set_color("font_color", "Label", colorTest)
	#style1.set_default_margin(MARGIN_TOP, -1)
	style1.set_bg_color(Color(0.15,0.1725,0.2325,1))
	print(style1.get_bg_color())


func _on_BrowseFiles_pressed():
	get_node("FileDialog PNG").popup_centered()

func _on_Preview_pressed():
	#	Set preview image
	currentResourcePath = get_node(loadPath).get_text()
	print("Using ", currentResourcePath)
	var previewArea = get_node(previewAreaPath)
	currentResource = load(currentResourcePath) 
	previewArea.set_texture(currentResource)
	
	#	set preview material name
	var nameLabel = get_node(nameLabelPath)
	var displayName = currentResourcePath.get_file().trim_suffix('.png')
	nameLabel.set_text(str(displayName, ".material"))
	



func _on_Create_pressed():
	#	create new material and apply the currentRessource as albedo
	var myMaterial = SpatialMaterial.new()
	currentResource = load(currentResourcePath)
	myMaterial.albedo_texture = currentResource
	
	#	define a name for the material and save it as a resource
	var displayName = currentResourcePath.get_file().trim_suffix('.png')
	ResourceSaver.save(str("res://", displayName, ".material"), myMaterial)
	print("Saved new Material ", "res://", displayName, ".material")
		
	
