import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/button.dart';

import '../provider/expression.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> buttons = [
      'C',
      '(',
      ')',
      'DEL',
      '7',
      '8',
      '9',
      '/',
      '4',
      '5',
      '6',
      'x',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '^',
      '+',
    ];

    final expression = Provider.of<Expression>(context);

    bool isOperator(String x) {
      return (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=');
    }

    ScrollController _scrollController = ScrollController();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(
            '=',
            style: TextStyle(color: Colors.white, fontSize: 35.0),
          ),
          onPressed: () {},
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black12,
          title: Text('Calculadora Simple'),
        ),
        backgroundColor: Color.fromRGBO(62, 64, 71, 1.0),
        body: OrientationBuilder(
          builder: (context, orientation) => Column(
            children: [
              Expanded(
                flex: orientation == Orientation.portrait ? 1 : 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(110, 111, 105, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          expression.expression,
                          style: TextStyle(fontSize: 40, fontFamily: 'DsDigit'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                orientation == Orientation.portrait ? 4 : 8,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          // Clear Button
                          if (index == 0) {
                            return Button(
                              buttontapped: () {
                                expression.clearExpression();
                                _scrollController.jumpTo(
                                    _scrollController.position.maxScrollExtent);
                              },
                              buttonText: buttons[index],
                              color: Colors.blue,
                              textColor: Colors.white,
                            );
                          }

                          // ( button
                          else if (index == 1) {
                            return Button(
                              buttonText: buttons[index],
                              color: Colors.blue,
                              textColor: Colors.white,
                              buttontapped: () {
                                expression.addOper(buttons[index]);
                                _scrollController.jumpTo(
                                    _scrollController.position.maxScrollExtent);
                              },
                            );
                          }
                          // ) Button
                          else if (index == 2) {
                            return Button(
                              buttonText: buttons[index],
                              color: Colors.blue,
                              textColor: Colors.white,
                              buttontapped: () {
                                expression.addOper(buttons[index]);
                                _scrollController.jumpTo(
                                    _scrollController.position.maxScrollExtent);
                              },
                            );
                          }
                          // Delete Button
                          else if (index == 3) {
                            return Button(
                              buttonText: buttons[index],
                              color: Colors.blue,
                              textColor: Colors.white,
                              buttontapped: () {
                                expression.deleteExpression();
                              },
                            );
                          }

                          //  other buttons
                          else {
                            return Button(
                              buttontapped: () {
                                expression.addOper(buttons[index]);
                                _scrollController.jumpTo(
                                    _scrollController.position.maxScrollExtent);
                              },
                              buttonText: buttons[index],
                              color: isOperator(buttons[index])
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(114, 114, 117, 1.0),
                              textColor: isOperator(buttons[index])
                                  ? Colors.white
                                  : Colors.white,
                            );
                          }
                        }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
