class_name DOLCharacterDefinition
extends Resource

@export var character_id := ""
@export var display_name := ""
@export_multiline var description := ""
@export var starting_stats := {
    "movement": 1,
    "combat": 1,
    "survival": 1
}
@export var starting_skill := ""
@export var starting_costume := ""
@export var base_appearance := {
    "skin": "default",
    "hair": "default",
    "face": "default",
    "body": "default",
    "accessory": "none"
}
@export var personality_tags: Array[String] = []
