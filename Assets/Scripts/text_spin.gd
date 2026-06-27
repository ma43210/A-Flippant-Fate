extends Area2D
@export var text : RichTextLabel
@export var player_controller : PlayerController
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flip_grav"):
		for i in 1000:
			if GameManager.escape == false:
				await get_tree().create_timer(0.001).timeout
				text.rotation_degrees += 5
