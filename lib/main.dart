import 'package:flutter/material.dart';
import 'package:hinstagram/views/home_view.dart';
import 'package:hinstagram/views/login_view.dart';
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
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'register': (context) => RegisterView(),
      },
    );
  }
}