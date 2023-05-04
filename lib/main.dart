import 'package:flutter/material.dart';

import 'login/registiration.dart';
import 'package:http/http.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: registiration(),
    );
  }
}