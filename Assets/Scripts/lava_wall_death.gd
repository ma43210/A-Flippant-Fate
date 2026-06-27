extends CollisionShape2D

	
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		get_tree().reload_current_scene()
