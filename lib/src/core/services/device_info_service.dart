import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';

class DeviceInfoService extends getx.GetxService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final Logger _logger = Logger();
  Map<String, dynamic>? _deviceInfo;

  @override
  void onInit() {
    _loadDeviceInfo();
  }

  Future<void> _loadDeviceInfo() async {
    try {
      _deviceInfo = await getDeviceInfo();
      _logger.i('Device info loaded: ${_deviceInfo?.keys}');
    } catch (e) {
      _logger.e('Failed to load device info: $e');
    }
  }

  Future<Map<String, dynamic>> getDeviceInfo() async {
    final Map<String, dynamic> deviceInfo = {};

    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        deviceInfo['platform'] = 'android';
        deviceInfo['device'] = androidInfo.device;
        deviceInfo['model'] = androidInfo.model;
        deviceInfo['brand'] = androidInfo.brand;
        deviceInfo['version'] = androidInfo.version.release;
        deviceInfo['sdkInt'] = androidInfo.version.sdkInt;
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;
        deviceInfo['platform'] = 'ios';
        deviceInfo['device'] = iosInfo.model;
        deviceInfo['model'] = iosInfo.model;
        deviceInfo['brand'] = 'Apple';
        deviceInfo['version'] = iosInfo.systemVersion;
        deviceInfo['utsname'] = iosInfo.utsname.machine;
      } else if (Platform.isWindows) {
        final windowsInfo = await _deviceInfoPlugin.windowsInfo;
        deviceInfo['platform'] = 'windows';
        deviceInfo['device'] = windowsInfo.computerName;
        deviceInfo['model'] = windowsInfo.computerName;
        deviceInfo['brand'] = 'Windows';
        deviceInfo['version'] = windowsInfo.displayVersion;
      } else if (Platform.isMacOS) {
        final macInfo = await _deviceInfoPlugin.macOsInfo;
        deviceInfo['platform'] = 'macos';
        deviceInfo['device'] = macInfo.computerName;
        deviceInfo['model'] = macInfo.model;
        deviceInfo['brand'] = 'Apple';
        deviceInfo['version'] = macInfo.kernelVersion;
      } else if (Platform.isLinux) {
        final linuxInfo = await _deviceInfoPlugin.linuxInfo;
        deviceInfo['platform'] = 'linux';
        deviceInfo['device'] = linuxInfo.name;
        deviceInfo['model'] = linuxInfo.name;
        deviceInfo['brand'] = 'Linux';
        deviceInfo['version'] = linuxInfo.version;
      } else {
        // Web platform or other
        deviceInfo['platform'] = 'web';
        deviceInfo['device'] = 'web';
        deviceInfo['model'] = 'web';
        deviceInfo['brand'] = 'Web';
        deviceInfo['version'] = 'unknown';
      }

      try {
        deviceInfo['platformType'] = Platform.operatingSystem;
        deviceInfo['platformVersion'] = Platform.version;
      } catch (e) {
        deviceInfo['platformType'] = 'web';
        deviceInfo['platformVersion'] = 'unknown';
      }
      deviceInfo['locale'] = getx.Get.locale?.toLanguageTag() ?? 'en-US';

    } catch (e) {
        _logger.e('Error getting device info: $e');
    }

    return deviceInfo;
  }

  Map<String, dynamic>? get deviceInfo => _deviceInfo;

  String get platform => _deviceInfo?['platform'] ?? 'unknown';
  String get model => _deviceInfo?['model'] ?? 'unknown';
  String get brand => _deviceInfo?['brand'] ?? 'unknown';
  String get version => _deviceInfo?['version'] ?? 'unknown';
  String get locale => _deviceInfo?['locale'] ?? 'en-US';
  String get platformType => _deviceInfo?['platformType'] ?? 'unknown';
}
