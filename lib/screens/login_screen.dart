import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/model/auth/user_login.dart';
import 'package:navigation/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final Dio dio = Dio();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginScreen')),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 30,
          children: [
            TextFormField(
              controller: userNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            TextFormField(
              controller: passwordTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  var username = userNameTextController.text.trim().toString();
                  var password = passwordTextController.text.trim().toString();

                  print('USerNAme is $username and password is $password');

                  var userDetails = UserLogin(
                    username: username,
                    password: password,
                  );
                  login(userDetails);

                  // context.go(AppRoutes.product);
                },
                child: Text('Login'),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                await userDelete(1);
              },
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> userDelete(int id) async {
    try {
      isLoading = true;
      setState(() {});
      final response = await dio.delete('https://fakestoreapi.com/users/$id');
      if (response.statusCode == 200) {
        // print('${response.data}');
      }
    } catch (e) {
      // print('$e');
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  Future login(UserLogin userDetails) async {
    final response = await dio.post(
      "https://fakestoreapi.com/auth/login",
      data: userDetails.toMap(),
    );
    if (response.statusCode == 201) {
      var data = response.data;
      print('Token $data');
      context.pushReplacement(AppRoutes.product);
    } else {}
  }
}
