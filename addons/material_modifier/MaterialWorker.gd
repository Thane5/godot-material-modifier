@tool
extends VBoxContainer


const ALBEDO_PANEL_PATH = "VSplitContainer/InspectorBG/ScrollContainer/MaterialProperties/VBoxContainer/Albedo Panel"
const METALLIC_PANEL_PATH = "VSplitContainer/InspectorBG/ScrollContainer/MaterialProperties/VBoxContainer/Metallic Panel"
const ROUGHNESS_PANEL_PATH = "VSplitContainer/InspectorBG/ScrollContainer/MaterialProperties/VBoxContainer/Roughness Panel"
@export var MaterialPathArea: NodePath
@export var textEditPath: NodePath


var albedoPanel
var metallicPanel
var roughnessPanel

var currentResourcePath
var currentResource
var changeCounter = 0


func _on_Modify_pressed():
	if typeof(currentResourcePath) == TYPE_PACKED_STRING_ARRAY:
		_modify_materials()
	else:
		print("No material selected")

func _modify_materials():
	albedoPanel = get_node(ALBEDO_PANEL_PATH)
	metallicPanel = get_node(METALLIC_PANEL_PATH)
	roughnessPanel = get_node(ROUGHNESS_PANEL_PATH)

	for singlePath in currentResourcePath:
		var currentResource #= SpatialMaterial.new()
		currentResource = load(singlePath)

		#	Apply parameters set through the UI
		if albedoPanel.active == true:
			currentResource.albedo_color = albedoPanel.albedoColor
			changeCounter = changeCounter+1

		if metallicPanel.metallicActive == true:
			currentResource.metallic = metallicPanel.metallicValue
			changeCounter = changeCounter+1

		if metallicPanel.specularActive == true:
			currentResource.metallic_specular = metallicPanel.specularValue
			changeCounter = changeCounter+1

		if roughnessPanel.active == true:
			currentResource.roughness = roughnessPanel.roughness
			changeCounter = changeCounter+1
			
		#	Apply parameters set through the command line
		var textField = get_node(textEditPath)
		var typedProperties = textField.text.strip_edges().split("\n")
		#print(typedProperties)
		
		#if typedProperties.is_empty() == true:
		if textField.text.is_empty() == true:
			#print("TextField is empty")
			pass
		else:
			#print("TextField is not empty")
			for property in typedProperties:
				var propertyArray = (property.split("="))
				var propertyName = propertyArray[0]
				#var propertyValue = propertyArray[1]
				#	alternative way to get propertyValue
				var propertyValue = property.trim_prefix(str(propertyName + "=")) 
				match propertyName:
					"albedo_color": currentResource.albedo_color = Color(propertyValue)
					"albedo_tex_force_srgb": currentResource.albedo_tex_force_srgb = str2var(propertyValue)
					"albedo_texture": currentResource.albedo_texture = load(propertyValue)
					"alpha_scissor_threshold": currentResource.alpha_scissor_threshold = propertyValue.to_float()
					"anisotropy": currentResource.anisotropy = propertyValue.to_float()
					"anisotropy_enabled": currentResource.anisotropy_enabled = propertyValue.to_bool()
					"anisotropy_flowmap": currentResource.anisotropy_flowmap = load(propertyValue)
					"ao_enabled": currentResource.ao_enabled = str2var(propertyValue)
					"ao_light_affect": currentResource.ao_light_affect = propertyValue.to_float()
					"ao_on_uv2": currentResource.ao_on_uv2 = str2var(propertyValue)
					"ao_texture": currentResource.ao_texture = load(propertyValue)
					"ao_texture_channel": currentResource.ao_texture_channel = propertyValue.to_int()
					"billboard_keep_scale": currentResource.billboard_keep_scale = str2var(propertyValue)
					"billboard_mode": currentResource.billboard_mode = propertyValue.to_int()
					"blend_mode": currentResource.blend_mode = propertyValue.to_int()
					"clearcoat": currentResource.clearcoat = propertyValue.to_float()
					"clearcoat_enabled": currentResource.clearcoat_enabled = str2var(propertyValue)
					"clearcoat_gloss": currentResource.clearcoat_gloss = propertyValue.to_float()
					"clearcoat_texture": currentResource.clearcoat_texture = load(propertyValue)
					"cull_mode": currentResource.cull_mode = propertyValue.to_int()
					"depth_draw_mode": currentResource.depth_draw_mode = propertyValue.to_int()
					"detail_albedo": currentResource.detail_albedo = load(propertyValue)
					"detail_blend_mode": currentResource.detail_blend_mode = propertyValue.to_int()
					"detail_enabled": currentResource.detail_enabled = str2var(propertyValue)
					"detail_mask": currentResource.detail_mask = load(propertyValue)
					"detail_normal": currentResource.detail_normal = load(propertyValue)
					"detail_uv_layer": currentResource.detail_uv_layer = propertyValue.to_int()
					"diffuse_mode": currentResource.diffuse_mode = propertyValue.to_int()
					"disable_ambient_light": currentResource.disable_ambient_light = str2var(propertyValue)
					"disable_receive_shadows": currentResource.disable_receive_shadows = str2var(propertyValue)
					"distance_fade_max_distance": currentResource.distance_fade_max_distance = propertyValue.to_float()
					"distance_fade_min_distance": currentResource.distance_fade_min_distance = propertyValue.to_float()
					"distance_fade_mode": currentResource.distance_fade_mode = propertyValue.to_int()
					"emission": currentResource.emission = Color(propertyValue)
					"emission_enabled": currentResource.emission_enabled = str2var(propertyValue)
					"emission_energy": currentResource.emission_energy = propertyValue.to_float()
					"emission_on_uv2": currentResource.emission_on_uv2 = str2var(propertyValue)
					"emission_operator": currentResource.emission_operator = propertyValue.to_int()
					"emission_texture": currentResource.emission_texture = load(propertyValue)
					"fixed_size": currentResource.fixed_size = str2var(propertyValue)
					"grow": currentResource.grow = str2var(propertyValue)
					"grow_amount": currentResource.grow_amount = propertyValue.to_float()
					"heightmap_deep_parallax": currentResource.heightmap_deep_parallax = str2var(propertyValue)
					"heightmap_enabled": currentResource.heightmap_enabled = str2var(propertyValue)
					"heightmap_flip_binormal": currentResource.heightmap_flip_binormal = str2var(propertyValue)
					"heightmap_flip_tangent": currentResource.heightmap_flip_tangent = str2var(propertyValue)
					"heightmap_flip_texture": currentResource.heightmap_flip_texture = str2var(propertyValue)
					"heightmap_max_layers": currentResource.heightmap_max_layers = propertyValue.to_int()
					"heightmap_min_layers": currentResource.heightmap_min_layers = propertyValue.to_int()
					"heightmap_scale": currentResource.heightmap_scale = propertyValue.to_float()
					"heightmap_texture": currentResource.heightmap_texture = load(propertyValue)
					"metallic": currentResource.metallic = propertyValue.to_float()
					"metallic_specular": currentResource.metallic_specular = propertyValue.to_float()
					"metallic_texture": currentResource.metallic_texture = load(propertyValue)
					"metallic_texture_channel": currentResource.metallic_texture_channel = propertyValue.to_int()
					"no_depth_test": currentResource.no_depth_test = str2var(propertyValue)
					"normal_enabled": currentResource.normal_enabled = propertyValue.to_float()
					"normal_scale": currentResource.normal_scale = propertyValue.to_float()
					"normal_texture": currentResource.normal_texture = load(propertyValue)
					"orm_texture": currentResource.orm_texture = load(propertyValue)
					"particles_anim_h_frames": currentResource.particles_anim_h_frames = propertyValue.to_int()
					"particles_anim_loop": currentResource.particles_anim_loop = str2var(propertyValue)
					"particles_anim_v_frames": currentResource.particles_anim_v_frames = propertyValue.to_int()
					"point_size": currentResource.point_size = propertyValue.to_int()
					"proximity_fade_distance": currentResource.proximity_fade_distance = propertyValue.to_float()
					"proximity_fade_enable": currentResource.proximity_fade_enable = str2var(propertyValue)
					"refraction_enabled": currentResource.refraction_enabled = str2var(propertyValue)
					"refraction_scale": currentResource.refraction_scale = propertyValue.to_float()
					"refraction_texture": currentResource.refraction_texture = load(propertyValue)
					"refraction_texture_channel": currentResource.refraction_texture_channel = propertyValue.to_int()
					"rim": currentResource.rim = propertyValue.to_float()
					"rim_enabled": currentResource.rim_enabled = str2var(propertyValue)
					"rim_texture": currentResource.rim_texture = load(propertyValue)
					"rim_tint": currentResource.rim_tint = propertyValue.to_float()
					"roughness": currentResource.roughness = propertyValue.to_float()
					"roughness_texture": currentResource.roughness_texture = load(propertyValue)
					"roughness_texture_channel": currentResource.roughness_texture_channel = propertyValue.to_int()
					"shading_mode": currentResource.shading_mode = propertyValue.to_int()
					"shadow_to_opacity": currentResource.shadow_to_opacity = str2var(propertyValue)
					"specular_mode": currentResource.specular_mode = propertyValue.to_int()
					"subsurf_scatter_enabled": currentResource.subsurf_scatter_enabled = str2var(propertyValue)
					"subsurf_scatter_strength": currentResource.subsurf_scatter_strength = propertyValue.to_float()
					"subsurf_scatter_texture": currentResource.subsurf_scatter_texture = load(propertyValue)
					"texture_filter": currentResource.texture_filter = propertyValue.to_int()
					"texture_repeat": currentResource.texture_repeat = str2var(propertyValue)
					"transmission": currentResource.transmission = Color(propertyValue)
					"transmission_enabled": currentResource.transmission_enabled = str2var(propertyValue)
					"transmission_texture": currentResource.transmission_texture = load(propertyValue)
					"transparency": currentResource.transparency = propertyValue.to_int()
					"use_point_size": currentResource.use_point_size = str2var(propertyValue)
					"uv1_offset": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv1_offset = Vector3(arr[0], arr[1], arr[2])
					"uv1_scale": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv1_scale = Vector3(arr[0], arr[1], arr[2])
					"uv1_triplanar": currentResource.uv1_triplanar = str2var(propertyValue)
					"uv1_triplanar_sharpness": currentResource.uv1_triplanar_sharpness = propertyValue.to_float()
					"uv2_offset": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv2_offset = Vector3(arr[0], arr[1], arr[2])
					"uv2_scale": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv2_scale = Vector3(arr[0], arr[1], arr[2])
					"uv2_triplanar": currentResource.uv2_triplanar = str2var(propertyValue)
					"uv2_triplanar_sharpness": currentResource.uv2_triplanar_sharpness = propertyValue.to_float()
					"vertex_color_is_srgb": currentResource.vertex_color_is_srgb = str2var(propertyValue)
					"vertex_color_use_as_albedo": currentResource.vertex_color_use_as_albedo = str2var(propertyValue)


					_: 
						print("Invalid material parameter: ", propertyName)
						#	subtract 1 so that it reports zero changes at the end
						changeCounter = changeCounter-1
				changeCounter = changeCounter+1

	#	Determine the amound of material changes done by 
	#	dividing the tocal amount of modifications with the amount of materials

	var fileCounter = currentResourcePath.size()
	if fileCounter == 1:
		print("Modified ", changeCounter/fileCounter, " properties on ", currentResourcePath[0].lstrip("res://"))
	else:	
		print("Modified ", changeCounter/fileCounter, " properties on ", fileCounter, " materials")
	changeCounter = 0
		
