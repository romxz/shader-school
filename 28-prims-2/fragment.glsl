precision highp float;

uniform vec3 frontColor, backColor;

void main() {
  gl_FragColor = (gl_FrontFacing) ? vec4(frontColor,1) : vec4(backColor,1);
}