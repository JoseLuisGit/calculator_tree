import 'dart:math' as math;

import 'node.dart';

import '../consts/characters.dart';
import '../utils/stack.dart';

class ExpressionTree {
  Node _root;

  Stack<Node> stackOperands = Stack<Node>();
  Stack<String> stackOperators;

  ExpressionTree() {
    stackOperands = Stack<Node>();
    stackOperators = Stack<String>();
  }
  Node get getRoot => this._root;
  set setRoot(Node root) => this._root = root;

  bool isLeaf(Node node) =>
      node.getNodeLeft == null && node.getNodeRight == null;

  void _saveSubTree() {
    Node right = stackOperands.pop();
    Node left = stackOperands.pop();
    stackOperands.push(new Node.all(
        information: stackOperators.pop(), nodeLeft: left, nodeRight: right));
  }

  Node buildTree(String expression) {
    try {
      expression = _fixExpression(expression);
      RegExp regExp = RegExp(r'[\d{.}]'); //expression number more point
      for (var i = 0; i < expression.length; i++) {
        String token = "";
        while (i < expression.length && regExp.hasMatch(expression[i])) {
          token += expression[i];
          i++;
        }

        if (token == "") {
          token = expression[i];
        } else {
          i--;
        }
        print(token);
        //is operands
        if (!Character.operators.contains(token)) {
          Node node = new Node.information(token);
          this.stackOperands.push(node);
          //
        } else if (token == ")") {
          while (!stackOperators.isEmpty && stackOperators.peek() != '(') {
            _saveSubTree();
          }
          stackOperators.pop();
        } else {
          if (token != "(" && !stackOperators.isEmpty) {
            String oper = stackOperators.peek();

            while (oper != "(" &&
                !stackOperators.isEmpty &&
                Character.operators.indexOf(oper) >=
                    Character.operators.indexOf(token)) {
              _saveSubTree();
              if (!stackOperators.isEmpty) {
                oper = stackOperators.peek();
              }
            }
          }
          stackOperators.push(token);
        }
      }

      _root = stackOperands.peek();
      while (!stackOperators.isEmpty) {
        if (stackOperators.peek() == "(") {
          stackOperators.pop();
        } else {
          _saveSubTree();
          _root = stackOperands.peek();
        }
      }
      return _root;
    } catch (e) {
      _root = null;
      print(e);
      return _root;
    }
  }

  double evaluate() {
    return _evaluate(_root);
  }

  double _evaluate(Node node) {
    double result = 0;
    if (node == null) {
      return result;
    } else {
      if (this.isLeaf(node)) {
        result = double.parse(node.getInformation);
      } else {
        double resultRight = _evaluate(node.getNodeRight);
        double resultLeft = _evaluate(node.getNodeLeft);

        switch (node.getInformation[0]) {
          case '+':
            result = resultLeft + resultRight;
            break;
          case '-':
            result = resultLeft - resultRight;
            break;
          case 'x':
            result = resultLeft * resultRight;
            break;
          case '/':
            result = resultLeft / resultRight;
            break;
          case '^':
            result = math.pow(resultLeft, resultRight);
            break;
          //logaritmo natural
          case 'l':
            result = math.log(resultRight);
            break;
          case 'i':
            result = math.log(resultRight) / math.log(10);
            break;
          case 's':
            result = math.sin(resultRight);
            break;
          case 'c':
            result = math.cos(resultRight);
            break;
          default:
            break;
        }
      }
      return result;
    }
  }

  printPost() {
    return _printPost(_root);
  }

  _printPost(Node r) {
    if (r != null) {
      _printPost(r.getNodeLeft);
      _printPost(r.getNodeRight);
      print(r.getInformation);
    }
  }

  _fixExpression(String expression) {
    expression = expression.replaceAll('ln', '0l');
    expression = expression.replaceAll('cos', '0c');
    expression = expression.replaceAll('sen', '0s');
    expression = expression.replaceAll('log', '0i');
    return expression;
  }
}
