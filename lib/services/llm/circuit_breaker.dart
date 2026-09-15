import 'package:dio/dio.dart';

/// 简单熔断器：连续失败 N 次后熔断，冷却时间后半开重试。
class CircuitBreaker {
  final int failureThreshold;
  final Duration cooldown;

  int _consecutiveFailures = 0;
  DateTime? _openedAt;

  CircuitBreaker({
    this.failureThreshold = 3,
    this.cooldown = const Duration(milliseconds: 60000),
  });

  /// 是否允许请求（熔断打开且未到冷却期时拒绝）。
  bool get allow {
    final opened = _openedAt;
    if (_consecutiveFailures < failureThreshold) return true;
    if (opened != null && DateTime.now().difference(opened) >= cooldown) {
      return true; // 半开，允许试探
    }
    return false;
  }

  bool get isOpen => !allow;

  /// 熔断剩余冷却秒数（用于 UI 提示）。
  int get remainingCooldownSeconds {
    final opened = _openedAt;
    if (opened == null) return 0;
    final left = cooldown - DateTime.now().difference(opened);
    return left.isNegative ? 0 : left.inSeconds;
  }

  void recordSuccess() {
    _consecutiveFailures = 0;
    _openedAt = null;
  }

  void recordFailure() {
    _consecutiveFailures++;
    if (_consecutiveFailures >= failureThreshold) {
      _openedAt ??= DateTime.now();
    }
  }

  void reset() {
    _consecutiveFailures = 0;
    _openedAt = null;
  }
}

/// 构造带超时与错误归一的 Dio 实例。
Dio buildDio({
  required String baseUrl,
  Map<String, String> headers = const {},
  Duration timeout = const Duration(seconds: 120),
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: timeout,
      headers: headers,
      responseType: ResponseType.stream,
      validateStatus: (code) => code != null && code >= 200 && code < 300,
    ),
  );
  return dio;
}

/// 将 Dio 异常转为可读信息。
String describeDioError(Object e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return '连接失败（服务不可达）';
      case DioExceptionType.receiveTimeout:
        return '响应超时';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        final data = e.response?.data;
        return 'HTTP $code${data != null ? ': $data' : ''}';
      default:
        return e.message ?? '网络错误';
    }
  }
  return e.toString();
}
