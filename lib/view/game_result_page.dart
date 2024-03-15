import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_player/logic/connect_websocket.dart';

class GameResultPage extends StatelessWidget {
  const GameResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final webSocketProvider = Provider.of<WebSocketProvider>(context, listen: false);
    webSocketProvider.closeWebSocket; // WebSocket の切断
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
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                      child: const Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.splitscreen,
                                    size: 24,
                                    color: Color.fromRGBO(17, 241, 255, 1),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Game resoult",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromRGBO(17, 241, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: (true)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Game Complete',
                                        style: TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: 32,
                                        ),
                                      ),
                                      Icon(
                                        Icons.circle_outlined,
                                        color: Colors.lightGreen,
                                        size: 80,
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Game Over',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 32,
                                        ),
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 80,
                                      ),
                                    ],
                                  ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
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
    );
  }
}
