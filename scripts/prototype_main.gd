extends Node2D

const SPEED := 240.0
var player: CharacterBody2D
var objective_label: Label
var status_label: Label
var debug_label: Label

func _ready() -> void:
    player = $Player
    objective_label = $HUD/Objective
    status_label = $HUD/Status
    debug_label = $HUD/Debug
    objective_label.text = "DOL — Longlat Marches prototype"
    status_label.text = "Arrival — move through the greybox."
    queue_redraw()

func _physics_process(_delta: float) -> void:
    var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
    player.velocity = input_vector * SPEED
    player.move_and_slide()
    if Input.is_action_just_pressed("attack"):
        status_label.text = "Light attack input received."
    elif Input.is_action_just_pressed("dodge"):
        status_label.text = "Dodge input received."
    elif Input.is_action_just_pressed("interact"):
        status_label.text = "Interaction input received."
    debug_label.text = "Prototype bootstrap • Position: %s" % player.position.round()

func _draw() -> void:
    draw_rect(Rect2(0, 0, 1280, 720), Color("#171717"))
    draw_rect(Rect2(80, 250, 280, 220), Color("#242424"))
    draw_rect(Rect2(390, 310, 260, 90), Color("#303030"))
    draw_rect(Rect2(680, 220, 180, 300), Color("#262626"))
    draw_circle(Vector2(1000, 360), 90.0, Color("#333333"))
    draw_string(ThemeDB.fallback_font, Vector2(105, 285), "LONGLAT SETTLEMENT")
    draw_string(ThemeDB.fallback_font, Vector2(470, 300), "OLD ROAD")
    draw_string(ThemeDB.fallback_font, Vector2(720, 255), "RIVER")
    draw_string(ThemeDB.fallback_font, Vector2(930, 365), "VEIL")
