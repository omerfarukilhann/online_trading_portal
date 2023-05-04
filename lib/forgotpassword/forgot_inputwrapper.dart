import 'package:flutter/material.dart';
import 'forgot_button.dart';
import 'forgot_inputfield.dart';
void main() {
  runApp(forgot_inputwrapper());
}
class forgot_inputwrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child: forgot_inputfield(),
          ),
          SizedBox(height: 40,),
          forgot_button()

        ],
      ),
    );
  }
}