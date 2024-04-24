import 'package:flutter/material.dart';
import 'package:castaneda/pantalla0327.dart/pantalla-registro0327.dart';

void main(List<String> args) {
  runApp(MyApp0327());
}

class MyApp0327 extends StatelessWidget {
  const MyApp0327({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaRegistro(),
    );
  }
}
