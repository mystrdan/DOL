extends Node2D

var player: CharacterBody2D
var objective_label: Label
var status_label: Label
var health_label: Label
var debug_label: Label
var dialogue_label: Label
var restart_label: Label
var enemy: CharacterBody2D
var interactable: Area2D

var stage := 0
var veil_triggered := false
var enemy_defeated := false
var checkpoint_position := Vector2(180, 360)
var player_flash_timer := 0.0
var dialogue_timer := 0.0
var veil_pulse := 0.0

func _ready() -> void:
    _setup_input_map()
    player = $Player
    objective_label = $HUD/Objective
    status_label = $HUD/Status
    health_label = $HUD/Health
    debug_label = $HUD/Debug
    dialogue_label = $HUD/Dialogue

    restart_label = Label.new()
    restart_label.position = Vector2(32, 145)
    restart_label.text = "Defeated — press R to restart"
    restart_label.visible = false
    $HUD.add_child(restart_label)

    player.defeated.connect(_on_player_defeated)
    player.attacked.connect(_on_player_attack)
    player.action_changed.connect(_on_player_action)
    player.health_changed.connect(_on_health_changed)

    _setup_touch_controls()
    _setup_npc()
    _setup_interaction()
    _set_stage(0)
    _show_dialogue("Longlat lies ahead. The road should be ordinary.", 3.0)
    queue_redraw()

func _setup_input_map() -> void:
    _ensure_key_action("move_left", [KEY_A, KEY_LEFT])
    _ensure_key_action("move_right", [KEY_D, KEY_RIGHT])
    _ensure_key_action("move_up", [KEY_W, KEY_UP])
    _ensure_key_action("move_down", [KEY_S, KEY_DOWN])
    _ensure_key_action("attack", [KEY_J])
    _ensure_key_action("dodge", [KEY_SPACE])
    _ensure_key_action("interact", [KEY_E])
    _ensure_key_action("restart", [KEY_R])

func _ensure_key_action(action: StringName, keys: Array) -> void:
    if not InputMap.has_action(action):
        InputMap.add_action(action)
    for key in keys:
        if not _action_has_key(action, key):
            var event := InputEventKey.new()
            event.physical_keycode = key
            InputMap.action_add_event(action, event)

func _action_has_key(action: StringName, key: int) -> bool:
    for event in InputMap.action_get_events(action):
        if event is InputEventKey and event.physical_keycode == key:
            return true
    return false

func _process(delta: float) -> void:
    player_flash_timer = maxf(player_flash_timer - delta, 0.0)
    dialogue_timer = maxf(dialogue_timer - delta, 0.0)
    veil_pulse = maxf(veil_pulse - delta, 0.0)
    if dialogue_timer <= 0.0:
        dialogue_label.visible = false

func _physics_process(delta: float) -> void:
    if stage == 0 and player.position.x > 360.0:
        _set_stage(1)
    elif stage == 1 and player.position.x > 650.0:
        _set_stage(2)
    elif stage == 2 and player.position.x > 900.0:
        _trigger_veil()

    if Input.is_action_just_pressed("restart") and restart_label.visible:
        _restart_from_checkpoint()

    if enemy_defeated and stage == 3:
        _set_stage(4)

    debug_label.text = "Prototype • Position %s • State %s" % [player.position.round(), player.state]
    queue_redraw()

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
    veil_pulse = 0.45
    _set_stage(3)
    _show_dialogue("The air folds. For a moment, the landscape is somewhere else.", 3.0)
    var camera = $Player/Camera2D
    if camera.has_method("shake"):
        camera.shake(8.0, 0.24)
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
        player_flash_timer = 0.10
        if enemy.has_method("hit_from"):
            enemy.hit_from(direction)
        var camera = $Player/Camera2D
        if camera.has_method("shake"):
            camera.shake(4.0, 0.10)
        status_label.text = "The Veil-Torn recoils."

func _on_enemy_hit_player(amount: int) -> void:
    player.take_damage(amount)
    player_flash_timer = 0.12
    var camera = $Player/Camera2D
    if camera.has_method("shake"):
        camera.shake(5.0, 0.14)
    if player.health > 0:
        status_label.text = "The Veil-Torn strikes."

func _on_enemy_defeated() -> void:
    enemy_defeated = true
    _show_dialogue("It collapses. Whatever opened the boundary is still there.", 3.0)
    status_label.text = "The creature collapses. The Veil remains."

func _on_player_defeated() -> void:
    restart_label.visible = true
    objective_label.text = "Prototype ended"
    status_label.text = "You were defeated. Press R to restart."
    _show_dialogue("The road goes quiet.", 2.0)

func _restart_from_checkpoint() -> void:
    restart_label.visible = false
    veil_triggered = false
    enemy_defeated = false
    veil_pulse = 0.0
    if is_instance_valid(enemy):
        enemy.queue_free()
    player.reset_at(checkpoint_position)
    _set_stage(0)
    _show_dialogue("You return to the last safe point.", 2.0)

func _setup_npc() -> void:
    var npc := Node2D.new()
    npc.name = "SettlementGuide"
    npc.position = Vector2(290, 350)
    add_child(npc)
    npc.set_script(load("res://scripts/prototype_npc.gd"))
    npc.setup(player, status_label, _on_npc_dialogue)

func _on_npc_dialogue(line: String) -> void:
    _show_dialogue("Guide: " + line, 4.0)

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
            _show_dialogue("A worn marker stands where the old road bends. No one remembers who placed it.", 4.0)
            if stage < 1:
                _set_stage(1)

func _show_dialogue(message: String, seconds: float) -> void:
    dialogue_label.text = message
    dialogue_label.visible = true
    dialogue_timer = seconds

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

    var veil_radius := 90.0
    if veil_triggered:
        veil_radius += sin(Time.get_ticks_msec() * 0.006) * 8.0
    if veil_pulse > 0.0:
        veil_radius += veil_pulse * 35.0
    draw_circle(Vector2(1000, 360), veil_radius, Color("#333333"))
    if not veil_triggered:
        draw_arc(Vector2(1000, 360), 90.0, 0.0, TAU, 32, Color("#666666"), 2.0)
    else:
        var intensity := 1.0 + sin(Time.get_ticks_msec() * 0.012) * 0.25
        draw_arc(Vector2(1000, 360), veil_radius, 0.0, TAU, 32, Color(0.65, 0.55, 0.38, intensity), 3.0)
        draw_line(Vector2(965, 325), Vector2(1035, 395), Color("#8d6b52"), 2.0)
        draw_line(Vector2(1035, 325), Vector2(965, 395), Color("#8d6b52"), 2.0)

    draw_string(ThemeDB.fallback_font, Vector2(105, 285), "LONGLAT SETTLEMENT")
    draw_string(ThemeDB.fallback_font, Vector2(470, 300), "OLD ROAD")
    draw_string(ThemeDB.fallback_font, Vector2(720, 255), "RIVER")
    draw_string(ThemeDB.fallback_font, Vector2(930, 365), "DAMAGED VEIL")

    var player_color := Color("#d8c7a8")
    if player_flash_timer > 0.0:
        player_color = Color("#ffffff")
    draw_circle(player.position, 18.0, player_color)
    var facing := player.get("facing") as Vector2
    if facing == null:
        facing = Vector2.RIGHT
    draw_line(player.position, player.position + facing * 25.0, Color("#3b3026"), 3.0)

    if is_instance_valid(enemy):
        var enemy_color := Color("#8d6b52")
        if enemy.has_method("is_flashing") and enemy.is_flashing():
            enemy_color = Color("#ffffff")
        draw_circle(enemy.position, 20.0, enemy_color)
        draw_line(enemy.position, player.position, Color("#8d6b52"), 2.0)
