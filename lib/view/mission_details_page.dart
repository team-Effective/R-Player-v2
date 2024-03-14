import 'package:flutter/material.dart';

class MissionDetailsPage extends StatelessWidget {
  const MissionDetailsPage({super.key});

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
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Row(
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
