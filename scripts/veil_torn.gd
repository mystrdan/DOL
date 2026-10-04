extends CharacterBody2D

@export var speed := 105.0
@export var max_health := 35
@export var contact_damage := 12
@export var knockback_decay := 520.0

var health := 35
var target: CharacterBody2D
var attack_cooldown := 0.0
var flash_timer := 0.0
var knockback_velocity := Vector2.ZERO

signal defeated
signal hit_player(amount: int)

func _ready() -> void:
    health = max_health

func set_target(value: CharacterBody2D) -> void:
    target = value

func _physics_process(delta: float) -> void:
    attack_cooldown = maxf(attack_cooldown - delta, 0.0)
    flash_timer = maxf(flash_timer - delta, 0.0)

    if knockback_velocity.length() > 1.0:
        velocity = knockback_velocity
        knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, knockback_decay * delta)
        move_and_slide()
        return

    if not is_instance_valid(target):
        return

    var offset := target.global_position - global_position
    if offset.length() > 42.0:
        velocity = offset.normalized() * speed
        move_and_slide()
    else:
        velocity = Vector2.ZERO
        if attack_cooldown <= 0.0:
            attack_cooldown = 0.9
            hit_player.emit(contact_damage)

func take_damage(amount: int) -> void:
    health = maxi(health - amount, 0)
    flash_timer = 0.10
    if health <= 0:
        defeated.emit()
        queue_free()

func hit_from(direction: Vector2) -> void:
    knockback_velocity = direction.normalized() * 210.0
    flash_timer = 0.12

func is_flashing() -> bool:
    return flash_timer > 0.0
