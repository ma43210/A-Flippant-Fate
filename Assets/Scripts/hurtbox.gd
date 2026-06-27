extends Area2D
class_name HurtBox
@export var player_controller : PlayerController
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		if GameManager.escape == false:
			player_controller.dead = true
		else:
			get_tree().reload_current_scene()
