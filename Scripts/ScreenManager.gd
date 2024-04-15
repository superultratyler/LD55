extends Node
class_name ScreenManager

var _active_screen : Screen
var _next_screen : Screen
var _modals : Array[Screen]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_screen(screen_path : String):
	var packed_scene = load(screen_path)
	var screen = packed_scene.instantiate() as Screen
	
	print("[Screen Manager] load screen "+ screen_path)
	
	if screen.is_modal:
		open_modal(screen)
	else:
		open_screen(screen)
	
	return screen

func open_screen(screen: Screen):
	if(_active_screen):
		print("Active Scene: "+_active_screen.scene_file_path)
		print("Next Scene: "+screen.scene_file_path)
		if(_active_screen.current_screen_state == _active_screen.SCREEN_STATE.OPEN):
			print("close active screen")
			
			# Close the active screen
			_active_screen.close()
			
			# Set the next screen to set as the active after the active plays off
			_next_screen = screen
			
			# Connect to the signal for on_closed to know when to transition to the next_screen
			_active_screen.on_closed.connect(_on_active_screen_off)
	else:
		print("[Screen Manager] opening init screen " + screen.scene_file_path)
		add_child(screen)
		_active_screen = screen
		_active_screen.open()

func open_modal(screen: Screen):
	
	# Can't have multiple modals of the same scene path
	if(check_if_modal_exists(screen)):
		return
	
	print("[Screen Manager] open modal " + screen.scene_file_path)
	add_child(screen)
	move_child(screen, _modals.size() + 1)
	screen.open()
	_modals.append(screen)

func close_modal(screen: Screen):
	for i in range(_modals.size()):
		if _modals[i] == screen:
			_modals[i].close()
			_modals[i].on_closed.connect(_on_modal_closed)

func _on_modal_closed(screen : Screen):
	print("Modal closed!")
	screen.on_closed.disconnect(_on_modal_closed)
	remove_child(screen)
	_modals.erase(screen)

func _on_active_screen_off(screen : Screen):
	print("[Screen Manager] removed old screeen " + screen.scene_file_path)
	screen.on_closed.disconnect(_on_active_screen_off)
	remove_child(screen)
	
	print("[Screen Manager] opening new screen " + _next_screen.scene_file_path)
	add_child(_next_screen)
	_next_screen.open()
	_next_screen.on_open.connect(_on_next_screen_on)

func _on_next_screen_on(screen : Screen):
	print("Next screen is on!")
	_active_screen = _next_screen
	_next_screen = null

func check_if_modal_exists(screen : Screen):
	for i in range(_modals.size()):
		if _modals[i].scene_file_path == screen.scene_file_path:
			return true
	return false
