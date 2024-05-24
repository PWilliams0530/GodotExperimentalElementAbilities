# spell.gd
extends Resource

class_name SpellBase

var name: String
var element: String
var power: int
var cooldown: float
var aoe_radius: float
var aoe_damage: int
var missle_size: float
var missle_speed: float

func _init(name: String, element: String, power: int, cooldown: float, aoe_radius: float = 0, aoe_damage: int = 0, missle_size: float = 0, missle_speed: float = 0):
	self.name = name
	self.element = element
	self.power = power
	self.cooldown = cooldown
	self.aoe_radius = aoe_radius
	self.aoe_damage = aoe_damage
	self.missle_size = missle_size
	self.missle_speed = missle_speed

func cast(caster,target_position: Vector2):
	print("Casting spell: %s" % name)
	# Implement spell casting logic here
	if aoe_radius > 0:
		apply_aoe(caster,target_position)

func apply_aoe(caster, position: Vector2):
	print("Applying AOE effect at position: %s" % position)
	# Implement AOE logic here (e.g., apply damage to all enemies within aoe_radius)
