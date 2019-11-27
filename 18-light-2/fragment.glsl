precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 vNormal;

float lambertWeight(vec3 sNormal, vec3 lDirection) {
	return max(dot(sNormal, lDirection), 0.0);
}

vec3 reflectedLight(vec3 ka, vec3 kd, vec3 sNormal, vec3 lDirection) {
	return ka + kd * lambertWeight(sNormal, lDirection);
}

void main() {
  gl_FragColor = vec4(reflectedLight(ambient, diffuse, normalize(vNormal), lightDirection), 1.0);
}