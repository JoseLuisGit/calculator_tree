import 'node.dart';
import '../consts/characters.dart';
import '../utils/stack.dart';

class ExpressionTree {
  Node _root;

  Stack<Node> stackOperands;
  Stack<Node> stackOperators;

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
}
