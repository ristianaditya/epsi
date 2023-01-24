import 'package:epsi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:epsi/pages/welcomeScreen.dart';
import 'package:epsi/pages/loginScreen.dart';
import 'package:epsi/pages/registerScreen.dart';
import 'package:epsi/pages/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';

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
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'EPSI',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/home': (context) => const mainScreen(),
          '/login': (context) => const loginScreen(),
          '/register': (context) => const registerScreen(),
        },
      ),
    );
  }
}
