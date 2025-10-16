extends Object
class_name EnumsHelper


static func enum_to_string(enum_dict: Dictionary, value: int) -> String:
	for k in enum_dict:
		if enum_dict[k] == value:
			return k
	
	push_error("EnumsHelper. Enum no encontrado.")
	return "Unknown!!!"
