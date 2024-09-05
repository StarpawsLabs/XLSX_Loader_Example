extends XMLParser
class_name EXCELXMLRender
func _init(data:PackedByteArray) -> void:
	open_buffer(data)

func get_sheet()->Dictionary:
	var sheet={}
	while read()==OK:
		if get_node_type()==NODE_ELEMENT and get_node_name()=="row":
			sheet.merge({int(get_attribute_value(0)):[]})
			while get_cell(sheet):pass
	return sheet
func get_cell(sheet:Dictionary) ->bool:
	var _pos_x
	var _pos_y
	var _type
	var _data
	read()
	if get_node_type()!=NODE_ELEMENT:return false
	var pos=get_attribute_value(0)
	_pos_x=0
	_pos_y=0
	for i in range(pos.length()):
		if pos[i]>='0' and pos[i]<='9':
			_pos_y=_pos_y*10+int(pos[i])
		else:
			_pos_x=_pos_x*26+pos[i].to_utf8_buffer()[0]-64
	_type=get_attribute_value(1)
	read()
	read()
	if get_node_type()!=NODE_TEXT:return false
	_data=get_node_data()
	read()
	read()
	var keys=sheet.keys()
	
	var cell_data={
		"pos_x":int(_pos_x),
		"pos_y":int(_pos_y),
		"type":_type,
		"data":float(_data)
	}
	sheet[keys[keys.size()-1]].append(cell_data)
	return true
