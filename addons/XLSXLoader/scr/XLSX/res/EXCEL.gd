extends Resource
class_name EXCEL
var _xlsx_data:Dictionary#原始字典数据
var _xlsx_get_data:Dictionary#解析后的字典数据
func _init() -> void:
	get_title()
	
func _to_string() -> String:
	return str(_xlsx_get_data)

func set_xlsx_data(xlsx_data:Dictionary):
	_xlsx_data=xlsx_data
	get_title()
	
func get_title():
	_xlsx_get_data={}
	for title_data in _xlsx_data:
		if _xlsx_data[title_data].has(1):
			var excel_title_data={}
			set_title(_xlsx_data[title_data][1],excel_title_data)
			var data=set_data(excel_title_data,title_data)
			_xlsx_get_data.merge(data)

func set_title(cell_data:Array,excel_data:Dictionary):#解析数据的内容
	for data in cell_data:
		excel_data.merge({data["pos_x"]:data["data"]})

func set_data(title_data:Dictionary,sheet_name:String):#解析数据的内容
	var data={}
	for row in _xlsx_data[sheet_name]:
		if row ==	1:	continue
		var information={}
		var name=''
		for cell_data in _xlsx_data[sheet_name][row]:
			var offest = cell_data["pos_x"]
			if offest==1:
				name=cell_data["data"]
			elif title_data.has(offest):
				information.merge({title_data[offest]:cell_data["data"]})
		data.merge({name:information})
	return {sheet_name:data}
	
func get_data(sheet_name:String):
	if !_xlsx_get_data.has(sheet_name):
		printerr("不存在此表格，请重试")
		return {}
	return _xlsx_get_data[sheet_name]
