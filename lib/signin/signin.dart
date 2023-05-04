import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signin_header.dart';
import 'signin_inputwrapper.dart';

class signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
        title: Text("WELCOME"),
        backgroundColor: Colors.white10,
      ),*/
        body: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.white,
            Colors.white70,
            Colors.white60,
          ])),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              signin_header(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: signin_inputwrapper(),
                ),
              )
            ],
          )),
    ));
  }
}

class signin_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: () => {
          registerUser(
              "ceren", "özakıncı", "ozakıncı@gmail.com", "123456", "55555555")
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
