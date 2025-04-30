class_name KeybindResource
extends Resource

const MOVE_FORWARD : String = "forward"
const MOVE_BACKWARD : String = "backward"
const MOVE_LEFT : String = "left"
const MOVE_RIGHT : String = "right"
const JUMP : String = "jump"
const SPRINT : String = "sprint"
const CROUCH : String = "crouch"
const EXIT : String = "exit"
const INTERACT : String = "interact"
const OPEN_LIST : String = "open_list"

@export var DEFAULT_MOVE_FORWARD_KEY = InputEventKey.new()
@export var DEFAULT_MOVE_BACKWARD_KEY = InputEventKey.new()
@export var DEFAULT_MOVE_LEFT_KEY = InputEventKey.new()
@export var DEFAULT_MOVE_RIGHT_KEY = InputEventKey.new()
@export var DEFAULT_JUMP_KEY = InputEventKey.new()
@export var DEFAULT_SPRINT_KEY = InputEventKey.new()
@export var DEFAULT_CROUCH_KEY = InputEventKey.new()
@export var DEFAULT_EXIT_KEY = InputEventKey.new()
@export var DEFAULT_INTERACT_KEY = InputEventKey.new()
@export var DEFAULT_OPEN_LIST_KEY = InputEventKey.new()

var move_forward_key = InputEventKey.new()
var move_backward_key = InputEventKey.new()
var move_left_key = InputEventKey.new()
var move_right_key = InputEventKey.new()
var jump_key = InputEventKey.new()
var sprint_key = InputEventKey.new()
var crouch_key = InputEventKey.new()
var exit_key = InputEventKey.new()
var interact_key = InputEventKey.new()
var open_list_key = InputEventKey.new()
