import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:logger/logger.dart';
import '../config/env_config.dart';
import 'storage_service.dart';
import 'device_info_service.dart';

class ApiService {
  late Dio _dio;
  final Logger _logger = Logger();
  final StorageService _storageService;
  final DeviceInfoService _deviceInfoService;
  final String _env;
  final List<CancelToken> _cancelTokens = [];

  ApiService({
    StorageService? storageService,
    DeviceInfoService? deviceInfoService,
    String env = EnvConfig.dev,
  }) : _storageService = storageService ?? Get.find<StorageService>(),
       _deviceInfoService = deviceInfoService ?? Get.find<DeviceInfoService>(),
       _env = env {
    _initializeDio();
    _setupInterceptors();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.getBaseUrl(_env),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  void _setupInterceptors() {
    _dio.interceptors.clear();

    // 认证拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) =>
            (RequestOptions options, RequestInterceptorHandler handler) async {
              // 添加设备信息到 header
              final deviceInfo = _deviceInfoService.deviceInfo;
              if (deviceInfo != null) {
                options.headers['X-Device-Platform'] =
                    deviceInfo['platform'] ?? 'unknown';
                options.headers['X-Device-Model'] =
                    deviceInfo['model'] ?? 'unknown';
                options.headers['X-Device-Brand'] =
                    deviceInfo['brand'] ?? 'unknown';
                options.headers['X-Device-Version'] =
                    deviceInfo['version'] ?? 'unknown';
                options.headers['X-Device-Locale'] =
                    deviceInfo['locale'] ?? 'en-US';
              }

              // 添加认证 token
              final token = await _storageService.getSecureString('auth_token');

              if (token != null && token.isNotEmpty) {
                options.headers['Authorization'] = 'Bearer $token';
                _logger.d('Auth token added to request');
              } else {
                _logger.d('No auth token available');
              }

              return handler.next(options);
            },
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          if (err.response?.statusCode == 401) {
            _logger.w('Unauthorized error detected');
            await _handleUnauthorizedError();
          }

          return handler.next(err);
        },
      ),
    );

    // 日志拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          _logger.d('Request: ${options.method} ${options.uri}');
          _logger.d('Headers: ${options.headers}');
          if (options.data != null) {
            _logger.d('Data: ${options.data}');
          }

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          _logger.d('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },

        onError: (DioException err, ErrorInterceptorHandler handler) {
          _logger.e('Error: ${err.message}');
          if (err.response != null) {
            _logger.e('Error Data: ${err.response?.data}');
            _logger.e('Error Status: ${err.response?.statusCode}');
          }

          return handler.next(err);
        },
      ),
    );
  }

  Future<void> _handleUnauthorizedError() async {
    _logger.e('User unauthorized, clearing auth data');

    await _storageService.removeSecureString('auth_token');
    await _storageService.removeSecureString('user');

    if (Get.currentRoute != '/login') {
      Get.offAllNamed('/login');
    }
  }

  // CancelToken _createCancelToken() {
  //   final cancelToken = CancelToken();
  //   _cancelTokens.add(cancelToken);
  //   return cancelToken;
  // }

  void cancelAllRequests() {
    for (final token in _cancelTokens) {
      if (!token.isCancelled) {
        token.cancel('All requests cancelled');
      }
    }
    _cancelTokens.clear();
  }

  // 简化的请求方法
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Dio get dio => _dio;
}
