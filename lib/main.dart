import 'package:flutter/material.dart';
import 'pages/calculator_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {'/': (context) => CalculatorPage()},
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/');
  }
}
