extends CollisionShape2D
func _on_area_2d_body_entered(_body: Node2D) -> void:
	GameManager.stop_music(GameManager.background_music)
	get_tree().change_scene_to_file("res://Assets/Scenes/win_screen.tscn")
	
