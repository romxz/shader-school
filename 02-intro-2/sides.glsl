
void sideLengths(
  highp float hypotenuse, 
  highp float angleInDegrees, 
  out highp float opposite, 
  out highp float adjacent) {
  
  //TODO: Calculate side lengths here
  const highp float PI = 3.14159265359;
  opposite = hypotenuse * sin( angleInDegrees * PI / 180.0 );
  adjacent = hypotenuse * cos( angleInDegrees * PI / 180.0 );
}

//Do not change this line
#pragma glslify: export(sideLengths)