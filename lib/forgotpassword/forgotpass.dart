import 'package:flutter/material.dart';
import 'forgot_header.dart';
import 'forgot_inputwrapper.dart';
class forgotpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("WELCOME"),
        backgroundColor: Colors.white10,
      ),*/
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                  Colors.white,
                  Colors.white70,
                  Colors.white60,
                ])
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                forgot_header(),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )
                  ),
                  child: forgot_inputwrapper(),

                ),
                )
              ],
            )
        )

    );


  }
}
