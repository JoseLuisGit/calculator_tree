class Node {
  String information;
  Node nodeRight;
  Node nodeLeft;

  Node.information(information) {
    this.nodeLeft = null;
    this.nodeRight = null;
    this.information = information;
  }
  Node.all({information, nodeRight, nodeLeft}) {
    this.information = information;
    this.nodeRight = nodeRight;
    this.nodeLeft = nodeLeft;
  }
  Node() {
    this.information = '';
    this.nodeRight = null;
    this.nodeLeft = null;
  }

  String get getInformation => this.information;
  Node get getNodeRight => this.nodeRight;
  Node get getNodeLeft => this.nodeLeft;

  set setInformation(information) => this.information = information;
  set setNodeRight(nodeRight) => this.nodeRight = nodeRight;
  set setNodeLeft(nodeLeft) => this.nodeLeft = nodeLeft;
}
