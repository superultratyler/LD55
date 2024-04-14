extends Screen
class_name SuspectsScreen

@export var button_suspects_list: BaseButton

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	button_suspects_list.connect("pressed",_on_button_suspects_list_pressed)
	open()


func _on_button_suspects_list_pressed():
	print("The button was pressed!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
