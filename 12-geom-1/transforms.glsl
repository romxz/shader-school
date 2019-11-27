precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

void main() {

  //TODO: Apply the model-view-projection matrix to `position`
  gl_Position = projection * view * model * vec4(position, 1);
  //gl_Position = view * model * vec4(position, 1);
  //gl_Position = model * vec4(position, 1);
  //gl_Position = vec4(position, 1);
}