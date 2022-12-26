import 'package:epsi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:epsi/welcomeScreen.dart';
import 'package:epsi/loginScreen.dart';
import 'package:epsi/registerScreen.dart';
import 'package:epsi/homeScreen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'EPSI',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/home': (context) => const homeScreen(),
          '/login': (context) => const loginScreen(),
          '/register': (context) => const registerScreen(),
        },
      ),
    );
  }
}
