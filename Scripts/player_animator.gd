extends Node2D
@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D
var current_second = 0.0

func _process(_delta: float) -> void:
	if  player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true
	
	if player_controller.flipped:
		sprite.flip_v = true
	else:
		sprite.flip_v = false
	
	if abs(player_controller.velocity.x) > 0.0:
		if player_controller.velocity.y == 0.0:
			if $AnimationPlayer.current_animation != "move" and $AnimationPlayer.current_animation != "jump" and $AnimationPlayer.current_animation != "jump":
				current_second = animation_player.get_current_animation_position()
				animation_player.play("move")
				animation_player.seek(current_second + 0.5)
	elif player_controller.velocity.y == 0.0:
		animation_player.play("idle")

	if player_controller.velocity.y < 0.0:
		if not player_controller.flipped:
			if $AnimationPlayer.current_animation != "jump":
				current_second = animation_player.get_current_animation_position()
				animation_player.play("jump")
				animation_player.seek(current_second + 0.5)
		elif player_controller.flipped:
			if $AnimationPlayer.current_animation != "fall":
				current_second = animation_player.get_current_animation_position()
				animation_player.play("fall")
				animation_player.seek(current_second + 0.5)
	elif player_controller.velocity.y > 0.0:
		if player_controller.flipped:
			if $AnimationPlayer.current_animation != "jump":
				current_second = animation_player.get_current_animation_position()
				animation_player.play("jump")
				animation_player.seek(current_second + 0.5)
		elif not player_controller.flipped:
			if $AnimationPlayer.current_animation != "fall":
				current_second = animation_player.get_current_animation_position()
				animation_player.play("fall")
				animation_player.seek(current_second + 0.5)
		
