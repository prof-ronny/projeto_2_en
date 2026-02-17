void main() {
  print('Welcome to the Simple Dart Calculator!');

  double num1 = 10;
  double num2 = 5;
  String operation = '+'; // Change to -, *, or /

  double result;

  switch (operation) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      result = num2 != 0
          ? num1 / num2
          : double.nan;
      break;
    default:
      print('Invalid operation');
      return;
  }

  print('The result is: $result');
}
