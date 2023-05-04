import 'package:flutter/material.dart';

class forgot_button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return

      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ElevatedButton(
          onPressed: () =>{
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 15.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Send Email',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      );


  }
}