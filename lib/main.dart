import 'package:flutter/material.dart';
import 'package:mvp/widgets/pages/home/home_page.dart';
import 'theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: HomePage(),
    );
  }
}
