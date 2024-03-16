import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:r_player/logic/connect_websocket.dart';
import 'package:r_player/logic/shared_preferences_logic.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  //プレイやーの情報を取得する変数
  Map<String, dynamic> playerData = {
    "player_id": "",  //ユーザーID
    "player_name": "",       //プレイヤー名
    "match_count": "", //参加回数
    "alive_count":"",  //生存回数
    "survival_rate": "", //生存率
  };

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    print('fetchData');
    // ユーザーIDを取得
    String? userID = await SharedPreferencesLogic().getUserID();

    // WebSocket接続を確立
    final webSocketProvider = Provider.of<WebSocketProvider>(context , listen: false);
    webSocketProvider.connectWebSocket(userID! , context);

    // HTTP通信を行い、プレイヤー情報を取得
    final response = await http.post(Uri.parse("https://0733cbb1-b839-4f2b-8e1a-b9da5f657f21.mock.pstmn.io/api/player/select?player_id=$userID"));

    // レスポンスのbodyを取得
    final jsonData = json.decode(response.body);

    if (jsonData['code'] == 200) {
        print(jsonData['select_player']["player_id"]);
        print(jsonData['select_player']["player_name"]);
        setState(() {
          playerData["player_id"] = jsonData['select_player']["player_id"];
          playerData["player_name"] = jsonData['select_player']["player_name"];
          playerData["match_count"] = jsonData['select_player']["match_count"];
          playerData["alive_count"] = jsonData['select_player']["alive_count"];
          double survivalRate = (playerData["alive_count"] / playerData["match_count"]) * 100;
          playerData["survival_rate"] = survivalRate.toInt();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    //userIDを取得し、WebSocket接続を確立
    SharedPreferencesLogic().getUserID().then((userID) {
      if (userID != null) {
        final webSocketProvider = Provider.of<WebSocketProvider>(context , listen: false);
        webSocketProvider.connectWebSocket(userID , context); 
      }
    });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(67, 67, 67, 1),
      body: Column(
        children: [
          Expanded(
            //アプリロゴ
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(64, 56, 64, 24),
              child: Image.asset(
                'assets/images/player_app_logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            //メイン機能
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: const Color.fromRGBO(67, 67, 67, 1),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(91, 91, 91, 1), //色
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(-4, -4),
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(43, 43, 43, 1), //色
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  minHeight: 0,
                                ),
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                      color: Color.fromRGBO(17, 241, 255, 1),
                                      fontSize: 24,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(17, 241, 255, 1),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        playerData['player_name'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(17, 241, 255, 1),
                                    width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color:
                                              Color.fromRGBO(17, 241, 255, 1),
                                          width: 6,
                                        ),
                                      ),
                                    ),
                                    child:Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '参加回数',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              playerData['match_count'].toString(),
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    17, 241, 255, 1),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Text(
                                              ' 回',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color:
                                              Color.fromRGBO(17, 241, 255, 1),
                                          width: 6,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '生存回数',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              playerData['alive_count'].toString(),
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    17, 241, 255, 1),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Text(
                                              ' 回',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color:
                                              Color.fromRGBO(17, 241, 255, 1),
                                          width: 6,
                                        ),
                                      ),
                                    ),
                                    child:Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '生存率',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              playerData['survival_rate'].toString(),
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    17, 241, 255, 1),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Text(
                                              ' %',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color:
                                              Color.fromRGBO(17, 241, 255, 1),
                                          width: 6,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'ID',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              playerData['player_id'],
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    17, 241, 255, 1),
                                                fontSize: 16,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Clipboard.setData(
                                                  const ClipboardData(
                                                    text: "IDのコピー",
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.content_copy,
                                                size: 16,
                                              ),
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/mission/result',
                                        arguments: false,
                                      );
                                    },
                                    child: Text('test'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
