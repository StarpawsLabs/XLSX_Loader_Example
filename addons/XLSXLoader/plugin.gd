@tool
extends EditorPlugin

var xlsxloader
var xlsxloadloader
var xlsximporter
func _enter_tree() -> void:
	xlsxloader=load("res://addons/XLSXLoader/scr/XLSX/XLSXLoader.gd").new()
	ResourceLoader.add_resource_format_loader(xlsxloader)
	
	xlsximporter=load("res://addons/XLSXLoader/scr/XLSX/XLSXImporter.gd").new()
	add_import_plugin(xlsximporter)
	
	xlsxloadloader=load("res://addons/XLSXLoader/scr/XLSX/XLSXLOADLoader.gd").new()
	ResourceLoader.add_resource_format_loader(xlsxloadloader)
	
	get_editor_interface().get_resource_filesystem().filesystem_changed
func _exit_tree() -> void:
	ResourceLoader.remove_resource_format_loader(xlsxloader)
	ResourceLoader.remove_resource_format_loader(xlsxloadloader)
	remove_import_plugin(xlsximporter)
