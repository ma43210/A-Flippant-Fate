extends CollisionShape2D
@export var player_controller : PlayerController

func _process(delta: float) -> void:
	if player_controller.flipped:
		if not position == Vector2(0, -10.5):
			set_position(Vector2(0, -10.5))
	else:
		if not position == Vector2(0.0, -5.5):
			set_position(Vector2(0, -5.5))
