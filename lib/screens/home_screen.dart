import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.isLogin});
  final String? isLogin;

  @override
  Widget build(BuildContext context) {
    // final data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen ")),
      body: Column(
        spacing: 20,
        mainAxisAlignment: .center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.profileScreen);
              },
              child: Text('ProfileScreen $isLogin'),
            ),
          ),

          InkWell(
            onTap: () {
              context.go(AppRoutes.profileScreen);
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
