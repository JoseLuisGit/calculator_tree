import 'package:flutter/material.dart';
import 'widgets/button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black12,
          title: Text('Calculadora Simple'),
        ),
        backgroundColor: Color.fromRGBO(62, 64, 71, 1.0),
        body: Column(
          children: [
            Expanded(
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
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        '5+5-8/log(5)5+5-8/log(5)5+5-8/log(5)5+5-8/9*(5)5+5-8/log(5)5+5-8/log(5)5+5-8/log(5)5+5-8/9*(5)5+5-8/log(5)5+5-8/log(5)5+5-8/log(5)5+5-8/9*(5)5+5-8/log(5)5+5-8/log(5)5+5-8/log(5)5+5-8/9*(5)',
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
                      itemCount: 50,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Button(
                          buttonText: '$index',
                          color: Color.fromRGBO(126, 112, 112, 1.0),
                          textColor: Colors.white,
                        );
                      }),
                ),
              ),
            )
          ],
        ));
  }
}
