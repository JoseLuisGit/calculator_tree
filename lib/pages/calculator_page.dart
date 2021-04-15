import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          child: Center(
              child: Text(
            'Calculadora Simple',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          )),
          height: size.height * 0.1,
        ),
        Card(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            maxLines: 8,
            style: TextStyle(fontSize: 25.0),
            decoration: InputDecoration.collapsed(
                border: OutlineInputBorder(),
                hintText: "Introduzca su operación"),
          ),
        )),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('$index')),
                    );
                  }),
            ),
          ),
        )
      ],
    ));
  }
}
