@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type(
		"RandomTimer",
		"Timer",
		preload("random_timer.gd"),
		preload("random_timer.svg")
	)


func _exit_tree() -> void:
	remove_custom_type("RandomTimer")
