import 'package:flutter/material.dart';

class Expression with ChangeNotifier {
  String expression = '';

  clearExpression() {
    this.expression = '';
    notifyListeners();
  }

  addOper(oper) {
    this.expression += oper;
    notifyListeners();
  }

  deleteExpression() {
    if (this.expression != '') {
      this.expression =
          this.expression.substring(0, this.expression.length - 1);
      notifyListeners();
    }
  }
}
