precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 fragNormal;
varying vec3 fragPosition;
varying vec3 fragLightDirection;

void main() {

  fragNormal = (vec4(normal, 0) * inverseModel * inverseView).xyz;
  
  vec4 viewPosition = view * model * vec4(position, 1);
  fragPosition = viewPosition.xyz;
  gl_Position = projection * viewPosition;
  
  fragLightDirection = (view * vec4(lightPosition, 1) - viewPosition).xyz;
}