extends Object
class_name SkillTargetsContext

var all_characters: Array[Character]
var custom_target: Character


func _init(all_characters_arg: Array[Character], custom_target_arg: Character):
	all_characters = all_characters_arg
	custom_target = custom_target_arg

func get_targets_by_faction(caster: Character, is_ally: bool, include_caster := true) -> Array[Character]:
	return all_characters.filter(func(c: Character):
		return c.is_ally_of(caster) == is_ally
	)

# TODO: Aca me podria colgar del evento de cuando muere un Character y actualizar el array?
# Porque si muere durante la cadena del efecto va a tirar NPE

#
