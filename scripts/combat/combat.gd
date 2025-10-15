extends Node2D
class_name Combat

@onready var warrior: Character = $Warrior
@onready var enemy: Character = $Enemy

func _ready():
	CombatEventBus.raise_event_combat_started([warrior, enemy])
