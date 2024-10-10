import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      initialRoute: LoginPage.route,
      debugShowCheckedModeBanner: false,
      routes: {
        ProfilePage.route: (context) => const ProfilePage(),
        HomePage.route: (context) => const HomePage(),
        LoginPage.route: (context) => LoginPage(),
        ChatPage.route: (context) => ChatPage()
      },
    );
  }
}
