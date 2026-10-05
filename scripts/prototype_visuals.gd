extends Node2D

var veil_active := false

func set_veil_active(active: bool) -> void:
    veil_active = active
    queue_redraw()

func _draw() -> void:
    # Functional greybox: settlement, road, river, community landscape, Veil.
    draw_rect(Rect2(80, 250, 280, 220), Color("#242424"))
    draw_rect(Rect2(100, 275, 90, 55), Color("#303030"))
    draw_rect(Rect2(210, 290, 110, 70), Color("#2d2d2d"))
    draw_circle(Vector2(220, 405), 34.0, Color("#2f2f2f"))

    # Old road: strongest navigation line.
    var road := PackedVector2Array([
        Vector2(350, 335), Vector2(650, 315),
        Vector2(730, 340), Vector2(900, 350),
        Vector2(900, 405), Vector2(730, 395),
        Vector2(650, 370), Vector2(350, 385)
    ])
    draw_colored_polygon(road, Color("#303030"))

    # River with banks and a readable crossing.
    draw_rect(Rect2(675, 190, 115, 340), Color("#202a2c"))
    draw_rect(Rect2(650, 320, 165, 70), Color("#3a3831"))
    draw_line(Vector2(675, 190), Vector2(675, 530), Color("#55504a"), 3.0)
    draw_line(Vector2(790, 190), Vector2(790, 530), Color("#55504a"), 3.0)

    # Community landscape: quieter area before the Veil.
    draw_circle(Vector2(850, 360), 92.0, Color("#292c28"))
    draw_circle(Vector2(850, 360), 48.0, Color("#32352f"))
    draw_arc(Vector2(850, 360), 92.0, 0.0, TAU, 40, Color("#55534b"), 2.0)

    # Route landmarks.
    draw_rect(Rect2(505, 338, 10, 35), Color("#5a5145"))
    draw_line(Vector2(510, 338), Vector2(520, 328), Color("#5a5145"), 3.0)

    # Before the event, the Veil is only a subtle environmental irregularity.
    # Once triggered, it becomes the first unmistakable supernatural landmark.
    if veil_active:
        draw_arc(Vector2(1000, 360), 90.0, 0.0, TAU, 48, Color("#7b624e"), 3.0)
        draw_arc(Vector2(1000, 360), 62.0, 0.3, TAU - 0.3, 40, Color("#4e4137"), 2.0)
        draw_line(Vector2(930, 300), Vector2(1070, 420), Color("#5f4c3f"), 2.0)
        draw_line(Vector2(1070, 300), Vector2(930, 420), Color("#5f4c3f"), 2.0)
    else:
        draw_arc(Vector2(1000, 360), 48.0, 0.0, TAU, 36, Color("#44403a"), 1.0)
        draw_line(Vector2(980, 360), Vector2(1020, 360), Color("#4a463f"), 2.0)

func _ready() -> void:
    z_index = -1
    queue_redraw()
