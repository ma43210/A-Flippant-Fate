extends AnimationPlayer
func _ready():
	play("cap_explodes")
	await get_tree().create_timer(5.5).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/evil_level.tscn")
