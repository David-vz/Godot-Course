extends Control

func _ready():
	var prompts = ["Dylan", "hates", "tomatoes", "strange", "fried tomato with onions", "delicious"]
	var story = "My friend %s %s %s, which is %s, since he used to think %s is %s"
	
	$DisplayText.text = story % prompts
 
