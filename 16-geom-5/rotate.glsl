highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians
  float c = cos(theta);
  float s = sin(theta);
  
  highp vec3 x = vec3(1.0,0,0);
  highp vec3 y = vec3(0,1.0,0);
  highp vec3 z = vec3(0,0,1.0);
  return mat4(x * c + cross(n,x) * s + n * dot(x,n) * (1.0-c), 0, 
			  y * c + cross(n,y) * s + n * dot(y,n) * (1.0-c), 0,
              z * c + cross(n,z) * s + n * dot(z,n) * (1.0-c), 0,
			  0, 0, 0, 1);
}

#pragma glslify: export(rotation)