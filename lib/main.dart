import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_player/logic/connect_websocket.dart';
import 'package:r_player/logic/shared_preferences_logic.dart';
import 'package:r_player/view/connect_page.dart';
import 'package:r_player/view/game_result_page.dart';
import 'package:r_player/view/home_page.dart';
import 'package:r_player/view/login_page.dart';
import 'package:r_player/view/mission_details_page.dart';
import 'package:r_player/view/mission_list_page.dart';
import 'package:r_player/view/mission_result_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    String initialRoute = '/login';

    //端末に保存されているデータを取得
    SharedPreferencesLogic().getUserID().then((userID) async {
      if (userID != null) {
        //データベースに保存されているユーザーIDをと比較し、ログイン済みか判定
        final response = await http.post(Uri.parse("https://0733cbb1-b839-4f2b-8e1a-b9da5f657f21.mock.pstmn.io/api/player/select?player_id=$userID"));
        final jsonData = json.decode(response.body);
        if (jsonData['code'] == 200) {
          initialRoute = userID == jsonData['select_player']["player_id"] ? '/home' : '/login';
        }
      }
    });
    return  MultiProvider(
      providers: [
        // WebSocketProvider
        ChangeNotifierProvider(create: (_) => WebSocketProvider()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {
          '/login': (context) => LoginPage(),
          '/connect': (context) => const ConnectPage(),
          '/home': (context) => HomePage(),
          '/mission/list': (context) => const MissionListPage(),
          '/mission/details': (context) => const MissionDetailsPage(),
          '/mission/result': (context) => const MissionResultPage(true),
          '/game/result': (context) => const GameResultPage(),
        },
      ),
    );
  }
}
