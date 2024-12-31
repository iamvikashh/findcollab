import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'storage_service.dart';

class BaseApiService extends GetxService {
  late final dio.Dio _dio;
  final String baseUrl =
      'https://findcollab.com'; // Move this to environment config later

  @override
  void onInit() {
    super.onInit();
    _initializeDio();
  }

  void _initializeDio() {
    _dio = dio.Dio(
      dio.BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors for logging, token handling, etc.
    _dio.interceptors.add(dio.InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  void _onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    // Add auth token if available
    final String? token = Get.find<StorageService>().getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  void _onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  void _onError(dio.DioException err, dio.ErrorInterceptorHandler handler) {
    // Handle common errors (401, 403, etc.)
    switch (err.response?.statusCode) {
      case 401:
        // Handle unauthorized
        Get.offAllNamed('/login');
        break;
      case 403:
        // Handle forbidden
        break;
      default:
        break;
    }
    handler.next(err);
  }

  // Common HTTP methods
  Future<dio.Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dio.Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dio.Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dio.Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is dio.DioException) {
      switch (error.type) {
        case dio.DioExceptionType.connectionTimeout:
        case dio.DioExceptionType.sendTimeout:
        case dio.DioExceptionType.receiveTimeout:
          return TimeoutException('Connection timeout');
        case dio.DioExceptionType.badResponse:
          return ApiException(
            error.response?.statusCode ?? 500,
            error.response?.data?['message'] ?? 'Server error',
          );
        default:
          return ApiException(500, 'Something went wrong');
      }
    }
    return Exception('Unknown error occurred');
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() => message;
}

class TimeoutException implements Exception {
  final String message;

  TimeoutException(this.message);

  @override
  String toString() => message;
}
