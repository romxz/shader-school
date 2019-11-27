precision mediump float;

uniform sampler2D prevState[2];
uniform vec2 stateSize;

uniform float kdiffuse;
uniform float kdamping;

//float stateA(vec2 x) {
float state0(vec2 x) {
  return texture2D(prevState[0], fract(x / stateSize)).r;
}

//float stateB(vec2 x) {
float state1(vec2 x) {
  return texture2D(prevState[1], fract(x / stateSize)).r;
}

float laplacian(vec2 x) {
  //return (stateA(x - vec2(-1,0)) + stateA(x - vec2(1,0)) + stateA(x - vec2(0,-1)) + stateA(x - vec2(0,1))) - 4.0 * stateA(x);
  return (state0(x - vec2(-1,0)) + state0(x - vec2(1,0)) + state0(x - vec2(0,-1)) + state0(x - vec2(0,1))) - 4.0 * state0(x);
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Solve for next state using a 5-point Laplacian stencil and the explicit Euler rule

  //float y = state0(coord);
  float y = (1.0 - kdamping) * (kdiffuse * laplacian(coord) + 2.0*state0(coord)) - state1(coord);

  gl_FragColor = vec4(y,y,y,1);
}
