extends Screen
class_name TitleScreen

@export var button_play: BaseButton

# Called when the node enters the scene tree for the first time.
func _ready():
	button_play.connect("pressed",_on_button_play_pressed)
	open()

func _on_button_play_pressed():
	Main.instance.screen_manager.load_screen("res://Scenes/Screens/IntroScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
