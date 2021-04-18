import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'pages/calculator_page.dart';

import 'provider/expression.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Expression())],
      child: MaterialApp(
          routes: {'/': (context) => CalculatorPage()},
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: '/'),
    );
  }
}
