extends Node
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
@export var audio_stream_player : AudioStreamPlayer

func _ready():
	screen_transition_animations.animation_changed.connect(_on_screen_transition_anim_change)
	screen_transition_animations.animation_set_next("ToOff", "Off")
	screen_transition_animations.animation_set_next("ToOn", "On")
	screen_transition_animations.get_animation("Off").loop_mode = Animation.LOOP_LINEAR
	screen_transition_animations.get_animation("On").loop_mode = Animation.LOOP_LINEAR
	
	# Default to the Off state
	screen_transition_animations.play("Off")
	current_screen_state = SCREEN_STATE.CLOSED

	
func open():
	current_screen_state = SCREEN_STATE.TRANSITIONING_OPEN
	screen_transition_animations.play("ToOn")

func close():
	current_screen_state = SCREEN_STATE.TRANSITIONING_CLOSED
	screen_transition_animations.play("ToOff")

func _on_screen_transition_anim_change(anim_name):
	print(anim_name)
	if anim_name == "Off":
		current_screen_state = SCREEN_STATE.CLOSED
		on_closed.emit(self as Screen)
	if anim_name == "On":
		current_screen_state = SCREEN_STATE.OPEN
		on_open.emit(self as Screen)
