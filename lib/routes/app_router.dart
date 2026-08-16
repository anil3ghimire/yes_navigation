import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';
import 'package:navigation/screens/home_screen.dart';
import 'package:navigation/screens/login_screen.dart';
import 'package:navigation/screens/more_screen.dart';
import 'package:navigation/screens/product_screen.dart';
import 'package:navigation/screens/profile_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(

    
    routes: <RouteBase>[


      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.homeScreen,
            builder: (BuildContext context, GoRouterState state) {
              String islogin = state.extra.toString();
              // String isLogin = state.extra.toString();
              return HomeScreen(isLogin: islogin);
            },
          ),

          GoRoute(
            path: AppRoutes.profileScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.moreScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const MoreScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.product,
            builder: (BuildContext context, GoRouterState state) {
              return const ProductScreen();
            },
          ),
        ],
      ),
    ],

    // errorBuilder:
    errorPageBuilder: (context, state) {
      return MaterialPage(child: Text('something went wrong'));
    },
  );
}
