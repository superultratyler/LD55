extends Screen
class_name IntroScreen

@export var button_continue : BaseButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_submit_pressed():
	Main.instance.screen_manager.load_screen("res://Scenes/Screens/SuspectsScreen.tscn")
