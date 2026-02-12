import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Pages/HomePage.dart';
import 'SubFunctions/SecureStorage.dart';
import 'SubFunctions/StudentInfo.dart';

Future<void> login(String username, String password, BuildContext context) async {
  try {
    var url = Uri.parse('http://192.168.1.131:8000/api/student-auth/');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': username, // Ensure this matches the backend's expected key
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);

        // Assuming `data['Token']` and `data['student']` are correctly provided by your backend
        await SecureStorage().storeToken(data['token']); // Make sure this is 'token', not 'Token'

        if (data['detail'] == 'successfully logged in') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
        } else {
          _showDialog(context, "Échec de la connexion", "Nom d'utilisateur ou mot de passe incorrect.");
        }
      } catch (error) {
        print("Error processing data: $error");
        _showDialog(context, "Erreur du serveur", "Veuillez réessayer plus tard.");
      }
    } else {
      _showDialog(context, "Erreur du serveur", "Veuillez réessayer plus tard.");
    }
  } catch (e) {
    _showDialog(context, "Erreur", "Une erreur est survenue lors de la tentative de connexion. Veuillez vérifier votre connexion Internet et réessayer.");
    print(e.toString());
  }
}

void _showDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("Fermer"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
