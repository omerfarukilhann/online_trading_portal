import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Log In", style: TextStyle(color: Colors.deepPurple, fontSize: 40),),
      ),
        ],
      ),
    ),
    );

  }
}