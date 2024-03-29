import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_player/logic/connect_websocket.dart';
import 'package:r_player/logic/shared_preferences_logic.dart';

class MissionDetailsPage extends StatefulWidget {
  const MissionDetailsPage({super.key});

@override
  _MissionDetailsPageState createState() => _MissionDetailsPageState();
}

class _MissionDetailsPageState extends State<MissionDetailsPage> {

  //ミッション情報を格納する配列
  Map<String, dynamic> missionList = 
  {
    "mission_id": "",
    "mission_title": "",
    "mission_detail": "",
  };

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    // ユーザーIDを取得
    SharedPreferencesLogic().getUserID().then((userID) {
      if (userID != null) {
        final webSocketProvider = Provider.of<WebSocketProvider>(context , listen: false);
        webSocketProvider.connectWebSocket(userID , context); 
      }
    });
    //TODO:ミッション情報を取得
    


  }

  @override
  Widget build(BuildContext context) {
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
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Color.fromRGBO(17, 241, 255, 1),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.details,
                                      size: 24,
                                      color: Color.fromRGBO(17, 241, 255, 1),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Mission Details",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Color.fromRGBO(17, 241, 255, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Color.fromRGBO(17, 241, 255, 1),
                                        width: 6,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    '達成条件',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: const Text(
                                      'aafnalsdnnka;ndaandknfansdn;\nnfaoshdvunabnandf間flなlんjvな；dkんヴァl；んdlvなnknsdlnvaondnsjansodnfoj',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
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
