extends CollisionShape2D
@export var player_controller : PlayerController

func _process(_delta: float) -> void:
	if player_controller.flipped:
		if not position == Vector2(0, -12):
			set_position(Vector2(0, -12))
	else:
		if not position == Vector2(0.0, -4):
			set_position(Vector2(0, -4))
