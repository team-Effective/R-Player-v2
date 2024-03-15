import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class Bluetooth extends ChangeNotifier {
  BluetoothDevice? _selectedDevice;
  late StreamSubscription<BluetoothDiscoveryResult> _streamSubscription;
  List<BluetoothDiscoveryResult> _results = [];
  late bool _isDiscovering = true;

  BluetoothDevice? get selectedDevice => _selectedDevice;
  List<BluetoothDiscoveryResult> get results => _results;
  bool get isDiscovering => _isDiscovering;

  void startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      if (r.device.name != null) {
        results.add(r);
        notifyListeners();
      }
    });

    _streamSubscription.onDone(() {
      _isDiscovering = false;
      notifyListeners();
    });
  }

  void restartDiscovery() {
    _results.clear();
    _isDiscovering = true;
    notifyListeners();

    startDiscovery();
  }

  void connectAndSend(BluetoothDevice device, BuildContext context) {
    BluetoothConnection.toAddress(device.address).then((_connection) {
      print('デバイスと接続中');
      _connection.output.add(Uint8List.fromList(utf8.encode('1')));
      _connection.output.allSent;
      _connection.dispose();

      // デバイス情報を提供
      setSelectedDevice(device);
    }).catchError((error) {
      print('デバイスとの接続中にエラーが発生しました');
      print(error);
      throw Exception(error);
    });
  }

  void setSelectedDevice(BluetoothDevice device) {
    _selectedDevice = device;
    notifyListeners();
  }
}
