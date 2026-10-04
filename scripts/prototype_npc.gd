extends Node2D

var player: CharacterBody2D
var status_label: Label
var talked := false

func setup(target: CharacterBody2D, label: Label) -> void:
    player = target
    status_label = label
    queue_redraw()

func _process(_delta: float) -> void:
    if not is_instance_valid(player):
        return
    if global_position.distance_to(player.global_position) <= 70.0:
        if Input.is_action_just_pressed("interact"):
            talked = true
            status_label.text = "Guide: The old road has been quiet since the river changed."
        elif not talked:
            status_label.text = "Press E near the guide to talk."
    queue_redraw()

func _draw() -> void:
    draw_circle(Vector2.ZERO, 14.0, Color("#c9a77a"))
    draw_line(Vector2(0, 14), Vector2(0, 38), Color("#7a5b45"), 8.0)
    draw_string(ThemeDB.fallback_font, Vector2(-35, -24), "GUIDE")
