import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_player/model/bluetooth.dart';

class MissionResultPage extends StatelessWidget {
  const MissionResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool args = ModalRoute.of(context)?.settings.arguments as bool;
    if (!args) {
      final bluetooth = context.watch<Bluetooth>();
      bluetooth.sendData();
      bluetooth.dispose();
    }
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
                      child: Column(
                        children: [
                          const Expanded(
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
                                    "Mission resoult",
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
                            child: (args)
                                ? const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mission Success',
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
                                : const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mission Failed',
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
