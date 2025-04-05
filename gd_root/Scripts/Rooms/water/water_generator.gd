extends MeshInstance3D

# X and Z size of the mesh
@export var xSize = 20
@export var zSize = 20

# Height and intenisty adjustments
@export var terrain_height = 5
@export var noise_intensity = 0.2
@export var vert_distance = 5

# Control variables to update and reset changed meshes
@export var update = false
@export var clear_vert_vis = false

var time = 0.0
var speed = 0.2

var jitter = 10


func _ready():
	generate_terrain()

func generate_terrain():
	var a_mesh:ArrayMesh
	var surftool = SurfaceTool.new()
	
	var noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.frequency = 0.1
	
	surftool.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	for z in range(zSize + 1):
		for x in range(xSize + 1):
			var y = clamp(noise.get_noise_2d((x * noise_intensity + time) / jitter, (z * noise_intensity + time) / jitter) * terrain_height, 0.0, 0.5)
			
			var uv = Vector2()
			uv.x = inverse_lerp(0, xSize, x)
			uv.y = inverse_lerp(0, zSize, z)
			surftool.set_uv(uv)
			
			surftool.add_vertex(vert_distance * Vector3(x,y,z))
			#draw_sphere(vert_distance * Vector3(x,y,z))
	
	var vert = 0
	for z in zSize:
		for x in xSize:
			surftool.add_index(vert + 0)
			surftool.add_index(vert + 1)
			surftool.add_index(vert + xSize + 1)
			surftool.add_index(vert + xSize + 1)
			surftool.add_index(vert + 1)
			surftool.add_index(vert + xSize + 2)
			vert += 1
		vert += 1
	
	surftool.generate_normals()
	a_mesh = surftool.commit()
	mesh = a_mesh
	



func draw_sphere(pos:Vector3):
	var ins = MeshInstance3D.new()
	add_child(ins)
	ins.position = pos
	var sphere = SphereMesh.new()
	sphere.radius = 0.1
	sphere.height = 0.2
	ins.mesh = sphere


func _process(_delta):
	if Engine.get_process_frames() % 20 == 0:
		generate_terrain()
		time += speed
	if update:
		generate_terrain()
		update = false
	if clear_vert_vis:
		for i in get_children():
			i.queue_free()
		clear_vert_vis = false
