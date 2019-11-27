mat2 matrixPower(highp mat2 m, int n) {
  
  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //
  mat2 m_n = mat2(1.0);
  mat2 m_2 = m * m;
  mat2 m_4 = m_2 * m_2;
  mat2 m_8 = m_4 * m_4;
  
  if (n >= 8) {
	n -= 8;
	m_n *= m_8;
  }
  if (n >= 4) {
	n -= 4;
	m_n *= m_4;
  }
  if (n >= 2) {
	n -= 2;
	m_n *= m_2;
  }
  if (n >= 1) {
	n -= 1;
	m_n *= m;
  }
  return m_n;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)