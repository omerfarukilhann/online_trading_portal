import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class signin_inputfield extends StatefulWidget {
  @override
  State<signin_inputfield> createState() => _InputFieldState();
}

class _InputFieldState extends State<signin_inputfield> {
  final _namecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _phonenumcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
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
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.purple),
            )),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: "Enter your email",
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
              controller: _phonenumcontroller,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
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
              obscureText: true,
              obscuringCharacter: '*',
              controller: _passwordcontroller,
              decoration: InputDecoration(
                hintText: "Enter your password",
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
              child: ElevatedButton(
                onPressed: () => {
                  registerUser(
                      _namecontroller.text,
                      _lastnamecontroller.text,
                      _emailcontroller.text,
                      _passwordcontroller.text,
                      _phonenumcontroller.text)
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
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> registerUser(String firstName, String lastName, String email,
      String password, String phoneNumber) async {
    const String apiUrl =
        'https://trading-portal-backend-production.up.railway.app/api/auth/register';
    // Değiştirilmesi gereken API URL'si
    // POST veri
    Map<String, String> requestBody = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      "phoneNumber": phoneNumber,
    };

    // API'ye POST isteği gönderme
    final response = await http.post(Uri.parse(apiUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'});

    // Başarılı bir yanıt alındıysa
    if (response.statusCode == 200) {
      // Yanıtı JSON formatında çözme
      Map<String, dynamic> responseData = json.decode(response.body);
      // Yanıtı kullanabiliriz
      print('Kullanıcı başarıyla kaydedildi');
    } else {
      // Hata durumunda yanıtı kullanabiliriz
      print('Hata kodu: ${response.statusCode}');
      print('Hata mesajı: ${response.body}');
    }
  }
}
