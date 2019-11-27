precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 surfaceNormal;

void main() {
  //gl_FragColor = vec4(1,1,1,1);
  float goochWeight = 0.5 * (1.0 + dot(normalize(surfaceNormal), normalize(lightDirection)));
  gl_FragColor = vec4((1.0 - goochWeight) * cool + goochWeight * warm, 1);
}