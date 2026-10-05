class_name DOLSaveManager
extends RefCounted

const PROFILE_PATH := "user://player_profile.tres"

static func save_profile(profile: DOLPlayerProfile) -> Error:
    if profile == null:
        return ERR_INVALID_PARAMETER
    return ResourceSaver.save(profile, PROFILE_PATH)

static func load_profile() -> DOLPlayerProfile:
    if not FileAccess.file_exists(PROFILE_PATH):
        return null
    var resource := ResourceLoader.load(PROFILE_PATH)
    if resource is DOLPlayerProfile:
        return resource
    return null

static func has_profile() -> bool:
    return FileAccess.file_exists(PROFILE_PATH)

static func delete_profile() -> Error:
    if not FileAccess.file_exists(PROFILE_PATH):
        return OK
    return DirAccess.remove_absolute(PROFILE_PATH)
