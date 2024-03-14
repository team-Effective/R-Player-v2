import 'package:flutter/material.dart';
import 'package:r_player/view/connect_page.dart';
import 'package:r_player/view/home_page.dart';
import 'package:r_player/view/login_page.dart';
import 'package:r_player/view/mission_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/mission/details',
      routes: {
        '/login': (context) => const LoginPage(),
        '/connect': (context) => const ConnectPage(),
        '/home': (context) => const HomePage(),
        '/mission/details': (context) => const MissionDetailsPage(),
      },
    );
  }
}
