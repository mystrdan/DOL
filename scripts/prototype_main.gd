extends Node2D

var player: CharacterBody2D
var objective_label: Label
var status_label: Label
var health_label: Label
var debug_label: Label
var enemy: CharacterBody2D
var stage := 0
var veil_triggered := false
var enemy_defeated := false
var interactable: Area2D

func _ready() -> void:
    player = $Player
    objective_label = $HUD/Objective
    status_label = $HUD/Status
    health_label = $HUD/Health
    debug_label = $HUD/Debug

    player.attacked.connect(_on_player_attack)
    player.action_changed.connect(_on_player_action)
    player.health_changed.connect(_on_health_changed)

    _setup_touch_controls()
    _setup_interaction()
    _set_stage(0)
    queue_redraw()

func _physics_process(_delta: float) -> void:
    if stage == 0 and player.position.x > 360.0:
        _set_stage(1)
    elif stage == 1 and player.position.x > 650.0:
        _set_stage(2)
    elif stage == 2 and player.position.x > 900.0:
        _trigger_veil()

    if enemy_defeated and stage == 3:
        _set_stage(4)

    debug_label.text = "Prototype • Position %s • State %s" % [player.position.round(), player.state]

func _set_stage(value: int) -> void:
    stage = value
    match stage:
        0:
            objective_label.text = "Reach the old road"
            status_label.text = "Arrival — move through the settlement."
        1:
            objective_label.text = "Follow the old road to the river"
            status_label.text = "The road is quiet. Something feels wrong."
        2:
            objective_label.text = "Approach the sacred landscape"
            status_label.text = "The river is unusually still."
        3:
            objective_label.text = "Survive the Veil-Torn"
            status_label.text = "The boundary tears. Something crosses."
        4:
            objective_label.text = "Return toward Longlat"
            status_label.text = "The road looks familiar. It does not feel the same."
    queue_redraw()

func _trigger_veil() -> void:
    if veil_triggered:
        return
    veil_triggered = true
    _set_stage(3)
    _spawn_enemy()

func _spawn_enemy() -> void:
    var script_resource = load("res://scripts/veil_torn.gd")
    enemy = CharacterBody2D.new()
    enemy.name = "VeilTorn"
    enemy.set_script(script_resource)
    enemy.position = Vector2(1010, 360)

    var shape := CollisionShape2D.new()
    var circle := CircleShape2D.new()
    circle.radius = 20.0
    shape.shape = circle
    enemy.add_child(shape)
    add_child(enemy)

    enemy.set_target(player)
    enemy.hit_player.connect(_on_enemy_hit_player)
    enemy.defeated.connect(_on_enemy_defeated)
    queue_redraw()

func _on_player_attack(hit_position: Vector2, direction: Vector2) -> void:
    if not is_instance_valid(enemy):
        return
    if enemy.global_position.distance_to(hit_position) <= 65.0:
        enemy.take_damage(15)
        status_label.text = "The Veil-Torn recoils."

func _on_enemy_hit_player(amount: int) -> void:
    player.take_damage(amount)
    if player.health > 0:
        status_label.text = "The Veil-Torn strikes."

func _on_enemy_defeated() -> void:
    enemy_defeated = true
    status_label.text = "The creature collapses. The Veil remains."

func _on_player_action(action: String) -> void:
    if action == "Defeated":
        objective_label.text = "Prototype ended"
        status_label.text = "You were defeated. Restart to try again."
    elif action == "Hit":
        status_label.text = "You were hit."

func _on_health_changed(current: int, maximum: int) -> void:
    health_label.text = "Health %d / %d" % [current, maximum]

func _setup_interaction() -> void:
    interactable = Area2D.new()
    interactable.name = "OldRoadMarker"
    interactable.position = Vector2(520, 355)
    var collision := CollisionShape2D.new()
    var circle := CircleShape2D.new()
    circle.radius = 55.0
    collision.shape = circle
    interactable.add_child(collision)
    add_child(interactable)
    interactable.body_entered.connect(_on_marker_entered)
    interactable.body_exited.connect(_on_marker_exited)

func _on_marker_entered(body: Node2D) -> void:
    if body == player:
        status_label.text = "Press E to inspect the old road marker."

func _on_marker_exited(body: Node2D) -> void:
    if body == player and stage == 1:
        status_label.text = "The road is quiet. Something feels wrong."

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("interact") and is_instance_valid(interactable):
        if player.global_position.distance_to(interactable.global_position) <= 65.0:
            status_label.text = "The marker is older than Longlat's living memory."
            if stage < 1:
                _set_stage(1)

func _setup_touch_controls() -> void:
    _bind_button($HUD/TouchControls/Up, "move_up")
    _bind_button($HUD/TouchControls/Down, "move_down")
    _bind_button($HUD/TouchControls/Left, "move_left")
    _bind_button($HUD/TouchControls/Right, "move_right")
    _bind_button($HUD/TouchControls/Attack, "attack")
    _bind_button($HUD/TouchControls/Dodge, "dodge")

func _bind_button(button: Button, action: String) -> void:
    button.button_down.connect(func(): Input.action_press(action))
    button.button_up.connect(func(): Input.action_release(action))

func _draw() -> void:
    draw_rect(Rect2(0, 0, 1280, 720), Color("#171717"))
    draw_rect(Rect2(80, 250, 280, 220), Color("#242424"))
    draw_rect(Rect2(390, 310, 260, 90), Color("#303030"))
    draw_rect(Rect2(680, 220, 180, 300), Color("#262626"))
    draw_circle(Vector2(1000, 360), 90.0, Color("#333333"))

    draw_string(ThemeDB.fallback_font, Vector2(105, 285), "LONGLAT SETTLEMENT")
    draw_string(ThemeDB.fallback_font, Vector2(470, 300), "OLD ROAD")
    draw_string(ThemeDB.fallback_font, Vector2(720, 255), "RIVER")
    draw_string(ThemeDB.fallback_font, Vector2(930, 365), "DAMAGED VEIL")

    draw_circle(player.position, 18.0, Color("#d8c7a8"))
    if is_instance_valid(enemy):
        draw_circle(enemy.position, 20.0, Color("#8d6b52"))
        draw_line(enemy.position, player.position, Color("#8d6b52"), 2.0)
