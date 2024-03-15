import 'package:flutter/material.dart';
import 'package:r_player/view/game_result_page.dart';
import 'package:r_player/view/mission_details_page.dart';
import 'package:r_player/view/mission_result_page.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ConnectionWebsocketStatus {
  WebSocketChannel? _channel;
  String? _clientId;

  void onConnectionWebsocketStatus(
      WebSocketChannel channel, String clientId, BuildContext context) {
    _channel = channel;
    _clientId = clientId;
    _channel!.stream.listen(
      (message) {
        // メッセージを受信したときの処理
        print('WebSocket message: $message');
        // 受信したメッセージを元に画面遷移の処理を行う
        if (message == "成功" || message == "失敗") {
          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(
            builder: (context) => MissionResultPage(message == "成功" ? true : false),
          ));
        } else if (message == "ミッション作成") {
          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(
            builder: (context) => const MissionDetailsPage(),
          ));
        } else if (message == "ミッション終了") {
          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(
            builder: (context) => const MissionResultPage(false),
          ));
        } else if (message == "ゲームクリア") {
          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(
            builder: (context) => const GameResultPage(),
          ));
        }
      },
      onDone: () {
        // 接続が切れたときの処理
        print('再接続中...');
        _reconnect(context);
      },
      onError: (error) {
        // エラーが発生したときの処理
        print('WebSocket error: $error');
        _reconnect(context);
      },
    );
  }

  void _reconnect(BuildContext context) {
    // 以前の WebSocket インスタンスを再利用して再接続する
    _channel = IOWebSocketChannel.connect(Uri.parse("ws://localhost:8000/ws/$_clientId"));
    // 再接続後に新しい WebSocket インスタンスで監視を再開する
    onConnectionWebsocketStatus(_channel!, _clientId!, context);
  }
}
