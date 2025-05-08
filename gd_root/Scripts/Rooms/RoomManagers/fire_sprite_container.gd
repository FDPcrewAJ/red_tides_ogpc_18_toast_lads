extends Node3D

var sprites

func _ready() -> void:
	sprites = self.get_children()


func _process(_delta: float) -> void:
	for s in sprites:
		s.play("default")
