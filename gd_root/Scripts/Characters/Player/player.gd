extends CharacterBody3D
class_name Player

const mouse_sens = 0.5

@onready var head = $Head
@onready var neck = $Head/Neck
@onready var pause_menu = $PauseMenu

# Wether or not to allow user to control the player
var allow_control = true

# Player Movement Variables
var direction = Vector3.ZERO
const move_lerp_speed = 7.0
var current_speed = 0.0

# Constants for player speed and jump
const walk_speed = 3.0
const sprint_speed = 7.0
const jump_velocity = 4.5



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if allow_control:
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
			head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
			head.rotation.x = clamp(head.rotation.x,deg_to_rad(-89),deg_to_rad(89))



func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction in which player is moving 
	# (in Vector 2: 
	# Left: (-1, 0)
	# Right: (1, 0)
	# Forward: (0, -1)
	# Backward (0, 1)
	# when moving diagonally, you get a fancy decimal 0.707 something)
	var input_dir := Input.get_vector("a", "d", "w", "s")
	
	# Direction varible to store x and z direction that the player is moving
	# (Is not the players actual velocity, that is different and gets put in later)
	# Lerp: goes from first input to second input smoothly
	# [Input 1]: Current direction of the player, changes as the player moves. (in Vector3)
	# [Input 2]: Mouse position of the player (transform.basis), gets where the player is looking, (in Vector3)
	# so that we know what direction we need to move in. This is then multiplied by a Vector3 conversion
	# of the input direction, with y being 0 as we are not moving vertical.
	# All of that is then normalized, which sets the distance of the vector3 to one.
	# [Input 3]: The rate of change is the set lerp speed, effects how slowly or quickly you speed up,
	# multiplied by delta so that it sticks with frame time and does not go out of sync.
	direction = lerp(direction,
					(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), 
					delta * move_lerp_speed)
	
	if Input.is_action_pressed("shift"):
		current_speed = sprint_speed
	else:
		current_speed = walk_speed
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)
		
	if Input.is_action_just_pressed("esc"):
		allow_control = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_menu.show()

	move_and_slide()


func _on_pause_menu_resume() -> void:
	pause_menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _set_last_pos() -> void:
	position = Global.lastpos
