extends Node2D
class_name Combat

@onready var mage: Character = $CanvasLayer/HUD/Characters/Heroes/Mage
@onready var warrior: Character = $CanvasLayer/HUD/Characters/Heroes/Warrior
@onready var enemy: Character = $CanvasLayer/HUD/Characters/Enemies/Enemy


func _ready():
	CombatEventBus.raise_event_combat_started([mage, warrior, enemy])
