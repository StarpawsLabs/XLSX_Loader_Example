@tool
extends EditorImportPlugin
func _get_importer_name():
	return "my.xlsx.plugin"

func _get_visible_name():
	return "导入为 xlsx"

func _get_recognized_extensions():
	return ["xlsx"]

func _get_save_extension():
	return "xlsxload"

func _get_resource_type():
	return "EXCEL"

func _get_preset_count():
	return 1
	
func _get_priority() -> float:
	return 1.0

func _get_import_order() -> int:
	return 100

func _get_preset_name(preset_index):
	return "Default"

func _get_import_options(path, preset_index):
	return [{"name": "my_option", "default_value": false}]
	
func _import(source_file: String, save_path: String, options: Dictionary, platform_variants: Array[String], gen_files: Array[String]) -> Error:
	var res=EXCELRender.read(source_file)
	var filename = save_path + "." + _get_save_extension()
	var f=FileAccess.open(filename,FileAccess.WRITE)
	if f==null:return FAILED
	f.store_var(res)
	f.close()
	return OK
