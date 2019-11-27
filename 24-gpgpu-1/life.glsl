precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;


  //TODO: Compute the next state for the cell at coord
  //float s_d = state(coord);
  float s = state(coord);
  float numAlive = 0.0;
  
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
	  vec2 neighborCoord = fract((coord + vec2(i,j)) / stateSize);// + fract();
	  numAlive += texture2D(prevState, neighborCoord).r;
    }
  }
  
  s = numAlive > 3.0+s || numAlive < 3.0 ? 0.0 : 1.0;
  gl_FragColor = vec4(s,s,s, 1.0);
  //gl_FragColor = vec4(s_d,s_d,s_d, 1.0);
  //gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
}
