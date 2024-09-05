class_name EXCELRender
## 返回excel字典，如果文件没有读取成功，则返回空字典
static func read(path:String)->Dictionary:
	if !FileAccess.file_exists(path) :return {}
	var zipReader=ZIPReader.new()
	zipReader.open(path)
	var file_data={}
	var sheet_keys=[]
	var data_array=[]
	for file in zipReader.get_files():
		var argvs=file.split('/')
		if argvs[0]=="xl" and argvs[1]=="worksheets" and argvs.size()==3:
			var data=zipReader.read_file(file)
			read_sheet_file(data,file_data,argvs[2].get_basename())
		if argvs[0]=="xl" and argvs[1]=="workbook.xml" and argvs.size()==2:
			var data=zipReader.read_file(file)
			sheet_keys=read_sheet_key_datas(data)
		if argvs[0]=="xl" and argvs[1]=="sharedStrings.xml" and argvs.size()==2:
			var data=zipReader.read_file(file)
			data_array=read_share_string(data)
	var res_data={}
	for sheet in file_data:
		for row_data in file_data[sheet]:
			for cell in file_data[sheet][row_data]:
				if cell["type"]=='s':
					cell["data"]=data_array[cell["data"]]
		res_data.merge({sheet_keys[int(sheet.lstrip("sheet"))-1]:file_data[sheet]})#给好表格名

	return res_data

static func read_sheet_file(data:PackedByteArray,file_data:Dictionary,name:String):
	var xml=EXCELXMLRender.new(data)
	file_data.merge( {name:xml.get_sheet()})
static func read_sheet_key_datas(data:PackedByteArray):
	var xml_sheet_keys=EXCELWorkBookRender.new(data)
	return xml_sheet_keys.get_work_book()

static func read_share_string(data:PackedByteArray):
	var share_string=EXCELShareString.new(data)
	return share_string.get_share_string()
