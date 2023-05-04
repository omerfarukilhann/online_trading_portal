import 'package:flutter/material.dart';

class signin_header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Sign In", style: TextStyle(color: Colors.deepPurple, fontSize: 40),),
          ),
        ],
      ),
    );

  }
}