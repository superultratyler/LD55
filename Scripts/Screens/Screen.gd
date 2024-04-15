extends Control
class_name Screen

enum SCREEN_STATE{
	OPEN,
	CLOSED,
	TRANSITIONING_CLOSED,
	TRANSITIONING_OPEN
}

signal on_closed(screen:Screen)
signal on_open(screen:Screen)

var current_screen_state

@export var is_modal : bool = false
@export var screen_transition_animations : AnimationPlayer

func _enter_tree():
	#screen_transition_animations.animation_finished.connect(_on_screen_animations_animation_finished)
	
	# Default to the Off state
	screen_transition_animations.play("Off")
	current_screen_state = SCREEN_STATE.CLOSED

	
func open():
	current_screen_state = SCREEN_STATE.TRANSITIONING_OPEN
	screen_transition_animations.play("ToOn")
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func close():
	current_screen_state = SCREEN_STATE.TRANSITIONING_CLOSED
	screen_transition_animations.play("ToOff")
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_screen_animations_animation_finished(anim_name):
	print(anim_name)
	if anim_name == "ToOff":
		print("[Screen] " + scene_file_path + " is closed")
		current_screen_state = SCREEN_STATE.CLOSED
		screen_transition_animations.play("Off")
		mouse_filter = Control.MOUSE_FILTER_STOP
		on_closed.emit(self as Screen)
	elif anim_name == "ToOn":
		print("[Screen] " + scene_file_path + " is open")
		current_screen_state = SCREEN_STATE.OPEN
		screen_transition_animations.play("On")
		mouse_filter = Control.MOUSE_FILTER_STOP
		on_open.emit(self as Screen)
