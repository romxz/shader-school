precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 fragNormal;
varying vec3 fragPosition;
varying vec3 fragLightDirection[4];

float lambertWeight(vec3 surfaceNormal, vec3 lightDirection) {
	return max(dot(surfaceNormal, lightDirection), 0.0);
}

float phongWeight(vec3 surfaceNormal, vec3 lightDirection, vec3 viewDirection, float shininess) {
	vec3 reflectedLight = reflect(lightDirection, surfaceNormal);
	float eyeLight = max(dot(reflectedLight, viewDirection), 0.0);
	return pow(eyeLight, shininess);
}

vec3 phongLight(vec3 kd, vec3 ks, float shininess,
				vec3 surfaceNormal, vec3 lightDirection, vec3 viewDirection) {	
	return kd * lambertWeight(surfaceNormal, lightDirection) + 
			ks * phongWeight(surfaceNormal, lightDirection, viewDirection, shininess);
}

void main() {
  vec3 light = ambient;
  for (int i=0; i<4; i++) {
    light += phongLight(lights[i].diffuse, lights[i].specular, lights[i].shininess,
			   normalize(fragNormal), normalize(fragLightDirection[i]), normalize(fragPosition));
  }
  gl_FragColor = vec4(light, 1);
}