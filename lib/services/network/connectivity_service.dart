import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 网络状态服务：connectivity_plus + 可选探活。
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  /// 最近一次已知状态（无网络接口 = 离线）。
  Future<bool> isOnline() async {
    try {
      final results = await _connectivity.checkConnectivity();
      return !results.contains(ConnectivityResult.none);
    } catch (_) {
      return false; // 检测失败按离线处理（保守路由到本地）
    }
  }

  Stream<bool> watchOnline() {
    return _connectivity.onConnectivityChanged
        .map((results) => !results.contains(ConnectivityResult.none))
        .distinct();
  }
}

final connectivityServiceProvider = Provider<ConnectivityService>(
  (ref) => ConnectivityService(),
);

/// 全局在线状态 Provider（供 UI 显示"本地模式"角标）。
final isOnlineProvider = StateProvider<bool>((ref) => true);
