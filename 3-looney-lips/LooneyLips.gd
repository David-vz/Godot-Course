extends Control

var player_words = []
var current_story = {}


onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	set_current_story()
	display_introduction()
	check_player_words_length()
	PlayerText.grab_focus()
	
func set_current_story():
	
	var stories = get_from_json("StoryBook.json")
	randomize()
	
	current_story = stories[randi() % stories.size()]
	
#	var stories = $StoryBook.get_child_count()
#	var selected_story = randi() % stories
#	current_story.prompts = $StoryBook.get_child(selected_story).prompts
#	current_story.story = $StoryBook.get_child(selected_story).story

func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()	
	
func display_introduction():
	DisplayText.text = "Welcome to game of madlibs! You'll be prompted to add specific types of words in the input below and when done you'll be shown a funny story.   "

func add_to_player_words():
#	clear words and show prompt if a story is completed
	if is_story_done():
		player_words = []
		DisplayText.text=""
		prompt_player()
	else:
		player_words.append(PlayerText.text)
		DisplayText.text=""
		PlayerText.clear()
		check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()
	
func check_player_words_length():
	if is_story_done():
#		tell_story()
		end_game()
		
			
	else:
		prompt_player()
#		tell_story()
	
func tell_story():
	DisplayText.text = current_story.story % player_words
	

func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"
	
func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = 'Again!'
	tell_story()
	pass
