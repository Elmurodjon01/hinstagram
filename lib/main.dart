import 'package:flutter/material.dart';
import 'package:hinstagram/views/login_view.dart';
import 'package:hinstagram/views/main_view.dart';
import 'package:hinstagram/views/register_veiw.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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