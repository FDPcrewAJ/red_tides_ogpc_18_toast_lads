extends RigidBody3D

@export var float_force = 1.0
@export var water_drag = 0.05
@export var water_angular_drag = 0.05

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var water = get_parent().get_node("water_plane")
@onready var probes = $probe_container.get_children()

var submerged = false

func _physics_process(_delta):
	submerged = false
	for p in probes:
		var depth = water.get_height(p.global_position) - p.global_position.y 
		if depth > 0:
			submerged = true
			apply_force(Vector3.UP * float_force * gravity * depth, p.global_position - global_position)

func _integrate_forces(state: PhysicsDirectBodyState3D):
	if submerged:
		state.linear_velocity *=  1 - water_drag
		state.angular_velocity *= 1 - water_angular_drag 
