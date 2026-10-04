extends Area2D

@export var prompt := "Inspect"
@export_multiline var message := "There is something unusual here."
var player_near := false

signal interacted(message: String)

func _ready() -> void:
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if event.is_action_pressed("interact") and player_near:
        interacted.emit(message)

func _process(_delta: float) -> void:
    if player_near and Input.is_action_just_pressed("interact"):
        interacted.emit(message)

func _on_body_entered(body: Node2D) -> void:
    if body.name == "Player":
        player_near = true

func _on_body_exited(body: Node2D) -> void:
    if body.name == "Player":
        player_near = false
