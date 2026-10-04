extends Camera2D

var shake_time := 0.0
var shake_strength := 0.0
var base_offset := Vector2.ZERO

func _ready() -> void:
    base_offset = offset

func _process(delta: float) -> void:
    if shake_time > 0.0:
        shake_time = maxf(shake_time - delta, 0.0)
        var fade := shake_time / 0.16
        offset = base_offset + Vector2(
            randf_range(-shake_strength, shake_strength),
            randf_range(-shake_strength, shake_strength)
        ) * fade
    else:
        offset = base_offset

func shake(strength: float = 5.0, duration: float = 0.16) -> void:
    shake_strength = strength
    shake_time = duration
