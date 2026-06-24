extends Node2D
@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D


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
		animation_player.play("move")
	else:
		animation_player.play("idle")
	
	if player_controller.velocity.y < 0.0:
		if not player_controller.flipped:
			animation_player.play("jump")
		elif player_controller.flipped:
			animation_player.play("fall")
	elif player_controller.velocity.y > 0.0:
			if player_controller.flipped:
				animation_player.play("jump")
			elif not player_controller.flipped:
				animation_player.play("fall")
