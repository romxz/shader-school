precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 fragNormal;
varying vec3 fragPosition;

float lambertWeight(vec3 surfaceNormal, vec3 lightDirection) {
	return max(dot(surfaceNormal, lightDirection), 0.0);
}

float phongWeight(vec3 surfaceNormal, vec3 lightDirection, vec3 viewDirection, float shininess) {
	vec3 reflectedLight = reflect(lightDirection, surfaceNormal);
	float eyeLight = max(dot(reflectedLight, viewDirection), 0.0);
	return pow(eyeLight, shininess);
}

vec3 phongLight(vec3 ka, vec3 kd, vec3 ks, float shininess,
				vec3 surfaceNormal, vec3 lightDirection, vec3 viewDirection) {	
	return ka + 
		kd * lambertWeight(surfaceNormal, lightDirection) + 
		ks * phongWeight(surfaceNormal, lightDirection, viewDirection, shininess);
}

void main() {
  gl_FragColor = vec4(
	phongLight(ambient, diffuse, specular, shininess,
			   normalize(fragNormal), lightDirection, normalize(fragPosition)),
	1);
}