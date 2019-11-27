precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model, view, projection;

uniform mat4 inverseModel, inverseView, inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 fragNormal;
varying vec3 fragPosition;
varying vec3 fragLightDirection[4];

void main() {

  fragNormal = (vec4(normal, 0) * inverseModel * inverseView).xyz;
  
  vec4 viewPosition = view * model * vec4(position, 1);
  fragPosition = viewPosition.xyz;
  gl_Position = projection * viewPosition;

  for (int i=0; i<4; i++) {
    fragLightDirection[i] = (view * vec4(lights[i].position, 1)).xyz - viewPosition.xyz;
  }
}