extends Screen
class_name SuspectSelectionScreen

@export var button_click_catcher : BaseButton
@export var button_close : BaseButton
@export var button_submit : BaseButton
@export var suspect_list : Control
@export var suspect_list_item_template : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create list items for all the suspects using the template list item
	for i in range(Main.instance.suspects.size()):
		var li = suspect_list_item_template.instantiate() as SuspectListItem
		print(Main.instance.suspects[i].character.display_name)
		li.set_suspect(Main.instance.suspects[i])
		suspect_list.add_child(li)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func exit():
	Main.instance.screen_manager.close_modal(self as Screen)

func _on_button_submit_pressed():
	print("Submitted!")

func _on_button_click_catcher_toggled(toggled_on):
	exit()

func _on_button_back_pressed():
	exit()
