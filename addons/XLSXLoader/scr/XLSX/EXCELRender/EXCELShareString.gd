extends XMLParser
class_name EXCELShareString

func _init(data:PackedByteArray) -> void:
	open_buffer(data)

func get_share_string():
	var share_string=[]
	while read()==OK:
		if get_node_type()==NODE_ELEMENT and get_node_name()=="si":
			read()
			read()
			share_string.append(get_node_data())
	return share_string
