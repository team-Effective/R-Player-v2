import 'package:permission_handler/permission_handler.dart';

class PerMissionService {

  Future<bool> isGranted() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();
    return statuses.containsValue(PermissionStatus.granted);
  }
}
