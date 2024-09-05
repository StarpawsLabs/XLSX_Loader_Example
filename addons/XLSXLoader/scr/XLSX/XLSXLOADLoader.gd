extends ResourceFormatLoader

func _get_recognized_extensions() -> PackedStringArray:
	return ["xlsxload"]

func _get_resource_type(path: String) -> String:
	if path.get_extension() == "xlsxload":
		return "EXCEL"
	return ""
func _load(path: String, original_path: String, use_sub_threads: bool, cache_mode: int) -> Variant:
	var res=EXCEL.new()
	var f=FileAccess.open(path,FileAccess.READ)
	var data=f.get_var() as Dictionary
	res.set_xlsx_data(data)
	return res
func _handles_type(type: StringName) -> bool:
	return type=="EXCEL"
func _recognize_path(path: String, type: StringName) -> bool:
	return path.get_extension() == "xlsxload"
	
