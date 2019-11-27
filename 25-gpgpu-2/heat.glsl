precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

float laplacian(vec2 x) {
  return (state(x - vec2(-1,0)) + state(x - vec2(1,0)) + state(x - vec2(0,-1)) + state(x - vec2(0,1))) - 4.0 * state(x);
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule
  //float y = state(coord);
  float y = (1.0 - kdamping) * (kdiffuse * laplacian(coord) + state(coord));

  gl_FragColor = vec4(y,y,y,1);
}
