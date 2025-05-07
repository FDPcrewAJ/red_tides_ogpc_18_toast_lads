extends CharacterBody3D
class_name Player

const mouse_sens = 0.2

@onready var head = $Head
@onready var neck = $Head/Neck
@onready var collision_check = $CollisionCheck
@onready var standing_collision = $StandingCollision
@onready var crouching_collision = $CrouchingCollision

# Player animation GLTF nodes
@onready var walk: Node3D = $animation_container/walk
@onready var crouch: Node3D = $animation_container/crouch
@onready var jump: Node3D = $animation_container/jump
@onready var crouch_walk: Node3D = $animation_container/crouch_walk
@onready var standing: Node3D = $animation_container/standing

@onready var footsteps: AudioStreamPlayer = $footsteps
@onready var footstep_timer: Timer = $footsteps/footstep_timer

# Player animation player nodes
var walk_anim
var crouch_anim
var jump_anim
var crouch_walk_anim

var cur_anim
var play_jump_once = false

var footstep_landed
var play_new_step = true

# If player can move or not (intro/cutscene control)
var has_control = true

# Player Movement Variables
var direction = Vector3.ZERO
const move_lerp_speed = 7.0
var current_speed = 0.0
var crouch_height = 0.4
var stand_height = 0.8

# State Machine Control
var walking = false
var sprinting = false
var crouching = false
var jumping = false

# Constants for player speed and jump
const walk_speed = 3.0
const sprint_speed = 7.0
const crouch_speed = 1.5
const jump_velocity = 4.5


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	walk_anim = walk.get_child(1)
	crouch_anim = crouch.get_child(1)
	jump_anim = jump.get_child(1)
	crouch_walk_anim = crouch_walk.get_child(1)
	
	walk_anim.play("PlayerAction")
	crouch_anim.play("PlayerAction")
	jump_anim.play("PlayerAction")
	crouch_walk_anim.play("PlayerAction")


func _input(event):
	if has_control:
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
			head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
			head.rotation.x = clamp(head.rotation.x,deg_to_rad(-60),deg_to_rad(89))


func _physics_process(delta):
	if has_control:
		# Add gravity while player isnt on the floor
		if not is_on_floor():
			velocity += get_gravity() * delta
		else:
			jumping = false
		
		# Jump, but only when the player is on the floor
		if Input.is_action_just_pressed("jump") and is_on_floor():
			if !crouching:
				velocity.y = jump_velocity
				jumping = true
				play_jump_once = true
		
		# Crouch State Control
		if Input.is_action_pressed("crouch"):
			crouching = true
		if Input.is_action_just_released("crouch"):
			crouching = false
		
		# Update hitbox and camera to crouching or not crouching
		if crouching:
			standing_collision.disabled = true
			crouching_collision.disabled = false
			head.position.y = lerp(head.position.y, crouch_height, delta * move_lerp_speed)
		elif !crouching && !collision_check.is_colliding():
			standing_collision.disabled = false
			crouching_collision.disabled = true
			head.position.y = lerp(head.position.y, stand_height, delta * move_lerp_speed)

		## Get the input direction in which player is moving 
		## (in Vector 2: 
		## Left: (-1, 0)
		## Right: (1, 0)
		## Forward: (0, -1)
		## Backward (0, 1)
		## when moving diagonally, you get a fancy decimal 0.707 something)
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		
		## Direction varible to store x and z direction that the player is moving
		## (Is not the players actual velocity, that is different and gets put in later)
		## Lerp: goes from first input to second input smoothly
		## [Input 1]: Current direction of the player, changes as the player moves. (in Vector3)
		## [Input 2]: Mouse position of the player (transform.basis), gets where the player is 
		## looking, (in Vector3) so that we know what direction we need to move in. This is then 
		## multiplied by a Vector3 conversion of the input direction, with y being 0 as we are 
		## not moving vertical. All of that is then normalized, which sets the distance of the 
		## vector3 to one.
		## [Input 3]: The rate of change is the set lerp speed, effects how slowly or quickly 
		## you speed up, multiplied by delta so that it sticks with frame time and does not go 
		## out of sync.
		direction = lerp(direction,
						(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), 
						delta * move_lerp_speed)
		
		# Update player speed
		#crouch has priortity over sprint which has priority over walk
		if crouching:
			current_speed = crouch_speed
			walking = false
			sprinting = false
		elif Input.is_action_pressed("sprint"):
			current_speed = sprint_speed
			sprinting = true
			walking = false
		else:
			walking = true
			sprinting = false
			current_speed = walk_speed
		
		# if the player is pressing a move key, move in that direction
		if direction:
			velocity.x = direction.x * current_speed
			velocity.z = direction.z * current_speed
		else:
			velocity.x = move_toward(velocity.x, 0, current_speed)
			velocity.z = move_toward(velocity.z, 0, current_speed)
	
		## Player animation Main Control
		# if the player is moving, then play a moving animation
		if abs(velocity.x) >= 0.2 or abs(velocity.z) >= 0.2:
			if play_new_step:
				if is_on_floor():
					if sprinting:
						footstep_timer.start(0.3)
						play_new_step = false
					else:
						footstep_timer.start(0.6)
						play_new_step = false
				else:
					footsteps.stop()
			# Load crouch walk animation
			if crouching:
				new_anim_vis(crouch_walk)
			else:
				# Load walk animation if not jumping
				if !jumping:
					new_anim_vis(walk)
					walk_anim.play("PlayerAction")
				# Load jump animation if jumping is true
				else:
					play_jump_anim()
		# If the player is not playing, load an idle animation
		else:
			footstep_timer.stop()
			play_new_step = true
			# Load crouch idle
			if crouching:
				new_anim_vis(crouch)
			else:
				# If jumping play jump animation
				if jumping:
					play_jump_anim()
				else:
					# Load standing idle animation
					new_anim_vis(standing)
		move_and_slide()
	else:
		footsteps.stop()
		


func new_anim_vis(new_anim):
	# Hide all animations
	walk.hide()
	crouch.hide()
	crouch_walk.hide()
	jump.hide()
	standing.hide()
	
	# Show only the new amination that needs to be played
	match new_anim:
		walk:
			new_anim.show()
		crouch:
			new_anim.show()
		crouch_walk:
			new_anim.show()
		jump:
			new_anim.show()
		standing:
			new_anim.show()


func play_jump_anim():
	new_anim_vis(jump)
	# Only play jump animation once and hold until player his the floor
	if play_jump_once:
		jump_anim.play("PlayerAction")
		play_jump_once = false


func _set_last_pos():
	position = Global.lastpos


func _set_new_pos():
	position = Global.new_position


func _on_footstep_timer_timeout() -> void:
	footsteps.play()
	play_new_step = true
