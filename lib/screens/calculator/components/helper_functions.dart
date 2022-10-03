String nepaliToEnglish(String equation) {
  equation = equation.replaceAll('x', '*');
  equation = equation.replaceAll('÷', '/');
  equation = equation.replaceAll('१', '1');
  equation = equation.replaceAll('२', '2');
  equation = equation.replaceAll('३', '3');
  equation = equation.replaceAll('४', '4');
  equation = equation.replaceAll('५', '5');
  equation = equation.replaceAll('६', '6');
  equation = equation.replaceAll('७', '7');
  equation = equation.replaceAll('८', '8');
  equation = equation.replaceAll('९', '9');
  equation = equation.replaceAll('०', '0');

  return equation;
}

String englishToNepali(String equation) {
  equation = equation.replaceAll('1', '१');
  equation = equation.replaceAll('2', '२');
  equation = equation.replaceAll('3', '३');
  equation = equation.replaceAll('4', '४');
  equation = equation.replaceAll('5', '५');
  equation = equation.replaceAll('6', '६');
  equation = equation.replaceAll('7', '७');
  equation = equation.replaceAll('8', '८');
  equation = equation.replaceAll('9', '९');
  equation = equation.replaceAll('0', '०');
  equation = equation.replaceAll('*', 'x');
  equation = equation.replaceAll('/', '÷');

  return equation;
}
