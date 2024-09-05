extends XMLParser
class_name EXCELWorkBookRender

func _init(data:PackedByteArray) -> void:
	open_buffer(data)

func get_work_book():
	while read()==OK:#<sheets>
		if get_node_type()==NODE_ELEMENT :
			if get_node_name()=="sheets":
				return read_work_book()
	return []
func read_work_book():
	var data=[]
	while read()==OK:
		if get_node_type()==NODE_ELEMENT :
			data.append(get_attribute_value(0))
		if get_node_type()==NODE_ELEMENT_END and get_node_name()=="sheets":
			break
	return data
