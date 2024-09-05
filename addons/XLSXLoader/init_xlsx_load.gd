extends Node


func _init() -> void:
	ResourceLoader.add_resource_format_loader(load("res://addons/XLSXLoader/scr/XLSX/XLSXLoader.gd").new())
	ResourceLoader.add_resource_format_loader(load("res://addons/XLSXLoader/scr/XLSX/XLSXLOADLoader.gd").new())
