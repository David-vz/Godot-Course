extends Control

func _ready():
	var person = "David"
	var movie = "Minions"
	
	print("Once upon a time " + person +" watched Minions and thought it was the geratest movie of the past two decades)")
	
	
	person = "Someone else"
	print("Once upon a time " + person +" watched "+movie+ " and thought it was the geratest movie of the past two decades)")
