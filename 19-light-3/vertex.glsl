precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 fragNormal;
varying vec3 fragPosition;

void main() {

  fragNormal = (vec4(normal, 0) * inverseModel * inverseView).xyz;
  
  vec4 viewPosition = view * model * vec4(position, 1);
  fragPosition = viewPosition.xyz;
  gl_Position = projection * viewPosition;
}
