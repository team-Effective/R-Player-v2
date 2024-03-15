import 'package:flutter/material.dart';

class MissionListPage extends StatelessWidget {
  const MissionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> strList = [
      'テスト1',
      'テスト2',
      'テスト3',
      'テスト4',
      'テスト5',
      'テスト6',
      'テスト7',
      'テスト8',
      'テスト9',
      'テスト10',
      'テスト11',
      'テスト12',
      'テスト13',
      'テスト14',
      'テスト15',
      'テスト16',
      'テスト17',
      'テスト18',
      'テスト19',
      'テスト20',
    ];

    ScrollController gamePlayerController = ScrollController();

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
                                    Icons.list,
                                    size: 24,
                                    color: Color.fromRGBO(17, 241, 255, 1),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Mission List",
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
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(17, 241, 255, 1),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: RawScrollbar(
                                thumbColor: Colors.white,
                                thickness: 4,
                                controller: gamePlayerController,
                                thumbVisibility: true,
                                child: SingleChildScrollView(
                                  controller: gamePlayerController,
                                  child: Column(
                                    children: strList
                                        .map(
                                          (str) => InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                '/mission/details',
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.fromLTRB(
                                                  24, 12, 24, 12),
                                              child: Text(
                                                str,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
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
