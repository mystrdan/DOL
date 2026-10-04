extends Node2D

var player: CharacterBody2D
var status_label: Label
var dialogue_callback: Callable
var talked := false
var prompt_cooldown := 0.0

func setup(target: CharacterBody2D, label: Label, callback: Callable = Callable()) -> void:
    player = target
    status_label = label
    dialogue_callback = callback
    queue_redraw()

func _process(delta: float) -> void:
    prompt_cooldown = maxf(prompt_cooldown - delta, 0.0)
    if not is_instance_valid(player):
        return

    var nearby := global_position.distance_to(player.global_position) <= 70.0
    if nearby:
        if Input.is_action_just_pressed("interact"):
            talked = true
            var line := "The old road has been quiet since the river changed."
            status_label.text = "Guide: " + line
            if dialogue_callback.is_valid():
                dialogue_callback.call(line)
        elif not talked and prompt_cooldown <= 0.0:
            status_label.text = "Press E near the guide to talk."
            prompt_cooldown = 0.5

    queue_redraw()

func _draw() -> void:
    draw_circle(Vector2.ZERO, 14.0, Color("#c9a77a"))
    draw_line(Vector2(0, 14), Vector2(0, 38), Color("#7a5b45"), 8.0)
    draw_string(ThemeDB.fallback_font, Vector2(-35, -24), "GUIDE")
