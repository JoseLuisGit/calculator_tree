import 'dart:collection';

class Stack<T> {
  final _stack = Queue<T>();

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T element = _stack.last;
    _stack.removeLast();
    return element;
  }

  T peek() {
    return _stack.last;
  }

  void clear() {
    _stack.clear();
  }

  bool get isEmpty => _stack.isEmpty;
}
