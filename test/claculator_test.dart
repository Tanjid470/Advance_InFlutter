

import 'package:flutter_test/flutter_test.dart';

import 'calculator.dart';

void main(){
  test("Calculator Test", () {
  Calculator calculator=Calculator();
  int ans=calculator.add(5, 7);
  expect(ans, 12);
  });
}