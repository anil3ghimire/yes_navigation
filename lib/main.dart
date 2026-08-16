import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // initialRoute: '/',
      title: 'Flutter Demo',
      routerConfig: AppRouter.router,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // routes: {
      //   Routes.loginScreen: (context) => LoginScreen(),
      //   Routes.homeScreen: (context) => HomeScreen(),
      //   Routes.profileScreen: (context) => ProfileScreen(),
      // },
    );
  }
}
