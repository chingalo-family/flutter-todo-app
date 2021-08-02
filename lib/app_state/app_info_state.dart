import 'package:flutter/foundation.dart';
import 'package:new_version/new_version.dart';

class AppInfoState with ChangeNotifier {
  String? _currentAppName;
  String? _currentAppVersion;
  String? _currentAppId;
  String? _currentPlatformVersion;

  String get currentAppName => _currentAppName ?? '';
  String get currentAppVersion => _currentAppVersion ?? '';
  String get currentAppId => _currentAppId ?? '';
  String get currentPlatformVersion => _currentPlatformVersion ?? '';

  void setCurrentAppInfo() async {
    try {
      final newVersion = NewVersion(
        androidId: 'chingalo.family.todo_app',
      );
      final status = await newVersion.getVersionStatus();
      print("${status!.canUpdate}");
      print("${status.localVersion}");
      print("${status.storeVersion}");
      print("${status.releaseNotes}");

      // _currentAppId = await GetVersion.appID;
      _currentAppVersion = status.localVersion;
      // _currentAppName = await GetVersion.appName;
      // _currentPlatformVersion = await GetVersion.platformVersion;
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
