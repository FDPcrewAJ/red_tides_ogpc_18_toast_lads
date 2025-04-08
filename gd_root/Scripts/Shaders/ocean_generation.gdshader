shader_type spatial;
render_mode cull_front,shadows_disabled;

#define MAX_STEPS 50
#define MAX_DISTANCE 50.
#define SURFACE_DISTANCE .001

float SDBox(vec3 p, vec3 half_size) {
	vec3 box_dist = abs(p) - half_size;
	float extd = length(max(box_dist, 0));
	float intd = min(max(box_dist.x, max(box_dist.y, box_dist.z)), 0);
	return extd + intd;
}

uniform sampler2D noise_tex;

float SDF(vec3 p) {
	float noise1 = texture(noise_tex, p.xz + (TIME * 0.3)).r * 0.08;
	float noise2 = texture(noise_tex, p.xz - (TIME * 0.02) + vec2(0.1, 0.3)).r * 0.06;
	p.y -= noise1 + noise2;
	float d = SDBox(p, vec3(5, 1, 5));
	return d;
}


vec3 GetNormals(vec3 p) {
	vec2 e = vec2(.01, 0);
	vec3 normals = SDF(p) - vec3(
		SDF(p - e.xyy),
		SDF(p - e.yxy),
		SDF(p - e.yyx)
	);
	return normalize(normals);
}


float RayMarcher(vec3 ro, vec3 rd) {
	float dfo = 0.;
	for(int i = 0; i < MAX_STEPS; i++) {
		vec3 p = ro + rd * dfo;
		float ds = SDF(p);
		dfo += ds;
		if(ds < SURFACE_DISTANCE || dfo > MAX_DISTANCE) break;
	}
	return dfo;
}


varying vec3 vertex_ls;
varying mat3 model_view_matrix;

uniform vec3 water_color : source_color;
uniform float metallic : hint_range(0.0, 1.0, 0.01) = 0.5;
uniform float roughness : hint_range(0.0, 1.0, 0.01) = 0.5;

void vertex() {
	vertex_ls = VERTEX;
	model_view_matrix = mat3(MODELVIEW_MATRIX);
}


void fragment() {
	vec3 ray_origin = (inverse(MODEL_MATRIX) * vec4(CAMERA_POSITION_WORLD, 1)).xyz;
	vec3 ray_dir = normalize(vertex_ls - ray_origin);
	float d = RayMarcher(ray_origin, ray_dir);
	if(d > MAX_DISTANCE) discard;
	vec3 p = ray_origin + ray_dir * d;
	vec3 normals = model_view_matrix * GetNormals(p);
	ALBEDO = water_color;
	METALLIC = metallic;
	ROUGHNESS = roughness;
	NORMAL = normals;
}
