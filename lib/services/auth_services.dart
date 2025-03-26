import 'package:flutter/material.dart';
import 'package:node_auth/models/user.dart';
import 'package:node_auth/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
      );

      print("Response Status: ${res.statusCode}");
      print("Response Body: ${res.body}");
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              "Account created! Login with the same credentials!",
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
