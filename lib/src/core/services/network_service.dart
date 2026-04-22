import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final Logger _logger = Logger();
  
  var isConnected = true.obs;
  var connectionType = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _setupListeners();
  }

  Future<void> _checkInitialConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result.firstOrNull ?? ConnectivityResult.none);
    } catch (e) {
      _logger.e('Error checking connectivity: $e');
      isConnected.value = false;
    }
  }

  void _setupListeners() {
    _connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result.firstOrNull ?? ConnectivityResult.none);
    });
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    connectionType.value = result;
    isConnected.value = result != ConnectivityResult.none;
    
    if (isConnected.value) {
      _logger.i('Network connected: $result');
    } else {
      _logger.w('Network disconnected');
    }
  }

  Future<bool> checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
