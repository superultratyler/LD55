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
	
	add_child(screen)
	
	if screen.is_modal:
		open_modal(screen)
	else:
		open_screen(screen)

func open_screen(screen: Screen):
	if(_active_screen):
		_active_screen.close()
		_next_screen = screen
		_active_screen.on_close.connect(_on_active_screen_off)
	else:
		_active_screen = screen
		_active_screen.open()

func _on_active_screen_off(screen : Screen):
	remove_child(screen)
	_next_screen.open()
	_next_screen.on_open.connect(_on_next_screen_on)

func _on_next_screen_on(screen : Screen):
	_active_screen = _next_screen
	_next_screen = null

func open_modal(screen: Screen):
	pass

func close_active_screen():
	_active_screen.close()

func close_modal(screen: Screen):
	for i in range(_modals.size()):
		if _modals[i] == screen:
			_modals[i].close()
			_modals[i].on_closed.connect(_on_modal_closed)

func _on_modal_closed(screen : Screen):
	screen.on_closed.disconnect(_on_modal_closed)
	_modals.erase(screen)
