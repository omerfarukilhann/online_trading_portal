import 'package:flutter/material.dart';

class forgot_header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Forgot password", style: TextStyle(color: Colors.deepPurple, fontSize: 40),),
          ),
        ],
      ),
    );

  }
}