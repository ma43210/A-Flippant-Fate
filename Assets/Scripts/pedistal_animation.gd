extends CollisionShape2D
@export var sprite : Sprite2D
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		if GameManager.escape == false:
			GameManager.escape = true
			sprite.visible = true
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://Assets/Scenes/cap_explodes_cutscene.tscn")
