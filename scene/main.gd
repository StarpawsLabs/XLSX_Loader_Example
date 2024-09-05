extends Control

@export var data:EXCEL
func _ready():
	var character_datas=data.get_data("character")
	for character_data in character_datas:
		var character_res=character.new(
			character_datas[character_data]["姓名"],
			character_datas[character_data]["血量"],
			character_datas[character_data]["攻击"],
			character_datas[character_data]["敌友"]
			)
		ResourceSaver.save(character_res,"res://exp/data/"+character_res.姓名+".tres")
