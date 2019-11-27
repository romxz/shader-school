precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 surfaceNormal;

void main() {
  //gl_FragColor = vec4(1,1,1,1);
  float lambertIntensity = max(dot(normalize(surfaceNormal), normalize(lightDirection)), 0.0);
  float celIntensity = ceil(lambertIntensity * numBands) / numBands;
  gl_FragColor = vec4(diffuse * celIntensity, 1);
}