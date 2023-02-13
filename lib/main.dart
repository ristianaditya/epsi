import 'package:epsi/providers/auth_provider.dart';
import 'package:epsi/providers/posyandu_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:epsi/pages/welcomeScreen.dart';
import 'package:epsi/pages/loginScreen.dart';
import 'package:epsi/pages/registerScreen.dart';
import 'package:epsi/pages/registerDetailScreen.dart';
import 'package:epsi/pages/anakRegisterScreen.dart';
import 'package:epsi/pages/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:epsi/providers/anak_provider.dart';
import 'package:epsi/providers/raport_provider.dart';
import 'package:epsi/providers/berita_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:epsi/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var verifikasi = prefs.getString("verifikasi");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(token, verifikasi));
}

class MyApp extends StatelessWidget {
  final String? token;
  final String? verifikasi;
  const MyApp(this.token, this.verifikasi, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AnakProvider()),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(create: (context) => PosyanduProvider()),
        ChangeNotifierProvider(create: (context) => BeritaProvider()),
        ChangeNotifierProvider(create: (context) => RaportProvider()),
      ],
      child: MaterialApp(
        title: 'EPSI',
        debugShowCheckedModeBanner: false,
        initialRoute: (token == null)
            ? '/'
            : (verifikasi == 'true')
                ? '/home'
                : '/login',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/home': (context) =>
              mainScreen(analytics: analytics, observer: observer),
          '/detailRegister': (context) => const RegisterDetailScreen(),
          '/anakRegister': (context) => const AnakRegisterScreen(),
          '/login': (context) => const loginScreen(),
          '/register': (context) => const registerScreen(),
        },
        navigatorObservers: [observer],
      ),
    );
  }
}
