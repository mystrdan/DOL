class_name DOLPlayerProfile
extends Resource

const PROFILE_VERSION := 1

@export var profile_version := PROFILE_VERSION
@export var player_name := ""
@export var character_id := ""
@export var background_id := ""
@export var opening_choices := {}
@export var appearance := {}
@export var level := 1
@export var xp := 0
@export var skill_points := 0
@export var unlocked_skills: Array[String] = []
@export var unlocked_costumes: Array[String] = []
@export var equipped_costume := ""
@export var unlocked_appearance_options: Array[String] = []
@export var story_flags := {}
@export var discovery_flags := {}

func reset_to_defaults() -> void:
    profile_version = PROFILE_VERSION
    player_name = ""
    character_id = ""
    background_id = ""
    opening_choices = {}
    appearance = {}
    level = 1
    xp = 0
    skill_points = 0
    unlocked_skills.clear()
    unlocked_costumes.clear()
    equipped_costume = ""
    unlocked_appearance_options.clear()
    story_flags = {}
    discovery_flags = {}

func record_opening_choice(choice_id: String, value: String) -> void:
    opening_choices[choice_id] = value

func add_xp(amount: int, xp_to_next_level: int = 100) -> bool:
    if amount <= 0:
        return false
    xp += amount
    var leveled := false
    while xp >= xp_to_next_level:
        xp -= xp_to_next_level
        level += 1
        skill_points += 1
        leveled = true
    return leveled
