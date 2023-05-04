import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'mainpage.dart';
import '../signin/signin.dart';
import '../forgotpassword/forgotpass.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.purple),
              )),
              child: TextField(
                controller: _emailController,
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
                obscureText: true,
                obscuringCharacter: '*',
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.purpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  loginUser(_emailController.text, _passwordController.text);
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
                    'Log in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signin()),
                  ),
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 10.0,
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => forgotpass()),
                  ),
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 10.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(String email, String password) async {
    const String apiUrl =
        'https://trading-portal-backend-production.up.railway.app/api/auth/login';
    // Değiştirilmesi gereken API URL'si
    // POST veri
    Map<String, String> requestBody = {
      'email': email,
      'password': password,
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
      if (responseData["error"] == false) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mainpage()),
        ); /*
         void onButtonTapped(BuildContext context) {
          Navigator.of(context).push(mainpage());
        }*/
      } else {
        print('hatalı şifre veya mail');
      }
    } else {
      // Hata durumunda yanıtı kullanabiliriz
      print('Hata kodu: ${response.statusCode}');
      print('Hata mesajı: ${response.body}');
    }
  }
}
