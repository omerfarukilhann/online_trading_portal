import 'package:flutter/material.dart';

class add_product extends StatefulWidget {
  @override
  State<add_product> createState() => _add_productState();
}

class _add_productState extends State<add_product> {
  final _namecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.purple),
            )),
            child: TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle: TextStyle(color: Colors.purpleAccent),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.purple),
            )),
            child: TextField(
              controller: _lastnamecontroller,
              decoration: InputDecoration(
                hintText: "Enter your last name",
                hintStyle: TextStyle(color: Colors.purpleAccent),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
        ],
      ),
    );
  }
}
