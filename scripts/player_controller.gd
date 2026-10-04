extends CharacterBody2D

@export var speed := 240.0
@export var dodge_speed := 520.0
@export var dodge_duration := 0.16
@export var dodge_cooldown := 0.55
@export var max_health := 100

var health := 100
var facing := Vector2.RIGHT
var state := "idle"
var dodge_timer := 0.0
var dodge_cooldown_timer := 0.0
var attack_timer := 0.0
var attack_cooldown := 0.0

signal attacked(position: Vector2, direction: Vector2)
signal health_changed(current: int, maximum: int)
signal action_changed(action: String)

func _ready() -> void:
    health = max_health
    health_changed.emit(health, max_health)

func _physics_process(delta: float) -> void:
    dodge_timer = maxf(dodge_timer - delta, 0.0)
    dodge_cooldown_timer = maxf(dodge_cooldown_timer - delta, 0.0)
    attack_timer = maxf(attack_timer - delta, 0.0)
    attack_cooldown = maxf(attack_cooldown - delta, 0.0)

    if dodge_timer > 0.0:
        velocity = facing * dodge_speed
    else:
        var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
        if input_vector.length() > 0.05:
            facing = input_vector.normalized()
            velocity = facing * speed
            state = "move"
        else:
            velocity = Vector2.ZERO
            state = "idle"

        if Input.is_action_just_pressed("dodge") and dodge_cooldown_timer <= 0.0:
            _start_dodge()
        elif Input.is_action_just_pressed("attack") and attack_cooldown <= 0.0:
            _attack()

    move_and_slide()

func _start_dodge() -> void:
    dodge_timer = dodge_duration
    dodge_cooldown_timer = dodge_cooldown
    state = "dodge"
    action_changed.emit("Dodge")
    
func _attack() -> void:
    attack_timer = 0.12
    attack_cooldown = 0.28
    state = "attack"
    action_changed.emit("Light attack")
    attacked.emit(global_position + facing * 42.0, facing)

func take_damage(amount: int) -> void:
    if dodge_timer > 0.0:
        return
    health = maxi(health - amount, 0)
    health_changed.emit(health, max_health)
    action_changed.emit("Hit")
    if health <= 0:
        action_changed.emit("Defeated")
        set_physics_process(false)
