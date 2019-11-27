precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  float c = cos(theta);
  float s = sin(theta);
  mat2 rotMat = mat2(c, s, -s, c);
  //TODO: rotate position by theta radians about the origin
  gl_Position = vec4(rotMat * position, 0, 1.0);
  //gl_Position = vec4(position, 0, 1.0);
}
