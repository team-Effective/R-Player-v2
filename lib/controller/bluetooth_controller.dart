import 'package:permission_handler/permission_handler.dart';
import 'package:r_player/model/bluetooth.dart';
import 'package:r_player/service/permission_service.dart';

class BluetoothController {
  BluetoothController(Bluetooth bluetooth) : _bluetooth = bluetooth;

  final Bluetooth _bluetooth;

  PerMissionService _per_mission_service = PerMissionService();

  void requestPermission() async {
    if (_bluetooth.isDiscovering) {
      bool isGranted = await _per_mission_service.isGranted();
      if (isGranted) {
        print('許可されています');
        _bluetooth.startDiscovery();
        print(_bluetooth.results);
      } else {
        print('Bluetoothの権限が拒否されました。');
        openAppSettings();
      }
    }
  }
}
