import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_player/Controller/bluetooth_controller.dart';
import 'package:r_player/model/bluetooth.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  void initState() {
    super.initState();
    context.read<BluetoothController>().requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final bluetooth = context.watch<Bluetooth>();
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
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.connected_tv,
                                      size: 24,
                                      color: Color.fromRGBO(17, 241, 255, 1),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Connect",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Color.fromRGBO(17, 241, 255, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  flex: 1,
                                  child: bluetooth.isDiscovering
                                      ? FittedBox(
                                          child: Container(
                                            margin: const EdgeInsets.all(24.0),
                                            child: const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color.fromRGBO(17, 241, 255, 1),
                                              ),
                                            ),
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            bluetooth.restartDiscovery();
                                          },
                                          icon: const Icon(
                                            Icons.refresh,
                                            color:
                                                Color.fromRGBO(17, 241, 255, 1),
                                            size: 24,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              width: double.infinity,
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
                                    children: bluetooth.results
                                        .map(
                                          (str) => InkWell(
                                            onTap: () {
                                              bluetooth.connectAndSend(str.device, context);
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                '/home',
                                                (route) => false,
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.fromLTRB(
                                                  24, 12, 24, 12),
                                              child: Text(
                                                str.device.name ??
                                                    "Unknown device",
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
