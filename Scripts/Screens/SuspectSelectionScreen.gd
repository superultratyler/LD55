extends Screen

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
@export var is_modal : bool = false
