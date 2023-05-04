import 'package:flutter/material.dart';

class forgot_inputfield extends StatefulWidget{
  @override
  State<forgot_inputfield> createState() => _forgot_inputfieldState();
}

class _forgot_inputfieldState extends State<forgot_inputfield> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.purple),

                )
            ),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.purpleAccent),
                border: InputBorder.none,
              ),
            ),

    ),
        );
  }
}