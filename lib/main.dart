import 'package:flutter/material.dart';
import 'package:r_player/Controller/bluetooth_controller.dart';
import 'package:r_player/model/bluetooth.dart';
import 'package:r_player/view/connect_page.dart';
import 'package:r_player/view/game_result_page.dart';
import 'package:r_player/view/home_page.dart';
import 'package:r_player/view/login_page.dart';
import 'package:r_player/view/mission_details_page.dart';
import 'package:r_player/view/mission_list_page.dart';
import 'package:r_player/view/mission_result_page.dart';
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
        ChangeNotifierProvider<Bluetooth>(
          create: (context) => Bluetooth(),
        ),
        ProxyProvider<Bluetooth, BluetoothController>(
          update: (_, bluetooth, __) => BluetoothController(bluetooth),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/connect': (context) => const ConnectPage(),
          '/home': (context) => const HomePage(),
          '/mission/list': (context) => const MissionListPage(),
          '/mission/details': (context) => const MissionDetailsPage(),
          '/mission/result': (context) => const MissionResultPage(),
          '/game/result': (context) => const GameResultPage(),
        },
      ),
    );
  }
}
