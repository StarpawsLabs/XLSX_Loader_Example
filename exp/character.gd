extends Resource
class_name character
@export var 姓名:String
@export var 血量:int
@export var 攻击:float
@export var 敌友:是敌是友

func _init(_姓名:String,_血量:int,_攻击:float,_敌友:String) -> void:
	姓名=_姓名
	血量=_血量
	攻击=_攻击
	var keys:Array=是敌是友.keys()
	var values:Array=是敌是友.values()
	敌友=values[keys.find(_敌友)]
enum 是敌是友
{
	敌,
	友
}
