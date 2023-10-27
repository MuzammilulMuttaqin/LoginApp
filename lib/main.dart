import 'package:flutter/material.dart';
import 'package:login_app/presentation/pages/Beranda/main_page.dart';
import 'package:login_app/presentation/pages/Beranda/profile_page.dart';
import 'package:login_app/presentation/pages/login_page.dart';
import 'package:login_app/presentation/pages/register_page.dart';
import 'package:login_app/presentation/pages/splash_page.dart';
import 'package:login_app/providers/auth_provider.dart';
import 'package:login_app/providers/page_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PageProvider(),
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => ProfilePage(),
        },
      )
    );
  }
}

