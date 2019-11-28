precision mediump float;

uniform sampler2D state[2];       //State buffer
uniform vec2 screenSize;          //Size of screen buffer
uniform vec2 mousePosition;       //Position of mouse
uniform bvec3 mouseDown;        //Test if mouse left, right, middle is down
uniform float time;               //Time since start

const float angle = 0.1;//0.0001;
const float c = cos(angle);
const float s = sin(angle);
const vec3 n = normalize(vec3(1,1,1));
const mat3 R = mat3(c + (1.0 - c) * n.r * n.r, 
					(1.0 - c) * n.r * n.g + s * n.b, 
					(1.0 - c) * n.r * n.b - s * n.g,
					(1.0 - c) * n.r * n.g - s * n.b, 
					c + (1.0 - c) * n.g * n.g, 
					(1.0 - c) * n.g * n.b + s * n.r,
					(1.0 - c) * n.r * n.b + s * n.g, 
					(1.0 - c) * n.g * n.b - s * n.r, 
					c + (1.0 - c) * n.b * n.b);

void main() {
  vec3 paintColor = vec3(0,0,0);

  //Paint colors depending on mouse state
  float w = exp2(-0.05 * distance(gl_FragCoord.xy, mousePosition));
  if(mouseDown.x) {
    paintColor.r = w;
  }
  if(mouseDown.y) {
    paintColor.g = w;
  }
  if(mouseDown.z) {
    paintColor.b = w;
  }

  //Write out texture 
  vec2 texCoord = gl_FragCoord.xy / screenSize;
  vec4 prevColor = texture2D(state[0], texCoord);
  vec3 rotColor = R * (prevColor.rgb - 0.5 * n) + 0.5 * n;
  
  
  //gl_FragColor = 0.995*(newColor) + vec4(paintColor, 0.0);
  gl_FragColor = 0.995 * vec4(rotColor, 1.0) + vec4(paintColor, 0.0);
}
