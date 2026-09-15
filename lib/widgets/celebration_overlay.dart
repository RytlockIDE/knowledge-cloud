import 'package:flutter/material.dart';

/// 全屏庆祝覆盖层（兑换/解锁/勋章弹出时使用）。
class CelebrationOverlay {
  CelebrationOverlay._();

  /// 展示 2 秒庆祝动效。
  static void show(BuildContext context,
      {required String title, String? subtitle, IconData icon = Icons.celebration}) {
    final overlay = OverlayEntry(
      builder: (context) => _CelebrationWidget(title: title, subtitle: subtitle, icon: icon),
    );
    Overlay.of(context).insert(overlay);
    Future.delayed(const Duration(milliseconds: 2400), overlay.remove);
  }
}

class _CelebrationWidget extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const _CelebrationWidget({required this.title, this.subtitle, required this.icon});

  @override
  State<_CelebrationWidget> createState() => _CelebrationWidgetState();
}

class _CelebrationWidgetState extends State<_CelebrationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2200),
  )..forward();

  late final Animation<double> scale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.25, curve: Curves.easeOutBack),
  );

  late final Animation<double> fade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.75, 1, curve: Curves.easeIn),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    return FadeTransition(
      opacity: fade,
      child: Material(
        color: Colors.black38,
        child: Center(
          child: ScaleTransition(
            scale: scale,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 28),
              decoration: BoxDecoration(
                color: palette.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: palette.primary.withValues(alpha: 0.35),
                    blurRadius: 40,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon, size: 56, color: palette.primary),
                  const SizedBox(height: 12),
                  Text(widget.title,
                      style: Theme.of(context).textTheme.titleLarge),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 6),
                    Text(widget.subtitle!,
                        style: TextStyle(color: palette.outline)),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
