import 'package:flutter/material.dart';

import 'package:calculator/models/expression_tree.dart';

class Expression with ChangeNotifier {
  String expression = '';
  String result = '';
  bool error = false;
  clearExpression() {
    this.expression = '';
    this.result = '';
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

  evaluate() {
    ExpressionTree expressionTree = ExpressionTree();

    expressionTree.buildTree(this.expression);
    this.result = expressionTree.evaluate().toString();
    notifyListeners();
  }
}
