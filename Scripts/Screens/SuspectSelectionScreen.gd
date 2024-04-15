extends Screen
class_name SuspectSelectionScreen

@export var button_close : BaseButton
@export var suspect_list : Control
@export var suspect_list_item_template : SuspectListItem
@export var suspects : Array[DialogicCharacter]


# Called when the node enters the scene tree for the first time.
func _ready():
	# Create list items for all the suspects using the template list item
	for i in range(suspects.size()):
		var li = suspect_list_item_template.duplicate() as SuspectListItem
		li.suspect_name_label.text = suspects[i].display_name
		suspect_list.add_child(li)
	
	# Remove the template list item
	suspect_list.remove_child(suspect_list_item_template)
	
	button_close.connect("pressed",_on_button_close_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_close_pressed():
	Main.instance.screen_manager.close_modal(self as Screen)
	#Main.instance.screen_manager.load_screen("res://Scenes/Screens/SuspectsScreen.tscn")
