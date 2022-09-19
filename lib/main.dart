import 'package:flutter/material.dart';
import 'package:hinstagram/views/home_view.dart';
import 'package:hinstagram/views/login_view.dart';
import 'package:hinstagram/views/main_view.dart';
import 'package:hinstagram/views/register_veiw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'main',
      routes: {
        'login': (context) => const LoginView(),
        'register': (context) => const RegisterView(),
        'main': (context) => const MainView(),
      },
    );
  }
}