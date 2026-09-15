import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 云朵吉祥物（纯 Canvas 绘制，随主题变化）。
class CloudMascot extends StatelessWidget {
  final double size;
  final bool happy; // 眯眼笑

  const CloudMascot({super.key, this.size = 48, this.happy = true});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    return CustomPaint(
      size: Size.square(size),
      painter: _CloudPainter(
        body: palette.primary.withValues(alpha: 0.9),
        face: Colors.white,
      ),
    );
  }
}

class _CloudPainter extends CustomPainter {
  final Color body;
  final Color face;

  _CloudPainter({required this.body, required this.face});

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final paint = Paint()..color = body;

    // 云朵：三个圆 + 底部矩形
    final c1 = Offset(s * 0.32, s * 0.62);
    final c2 = Offset(s * 0.52, s * 0.45);
    final c3 = Offset(s * 0.70, s * 0.64);
    canvas.drawCircle(c1, s * 0.20, paint);
    canvas.drawCircle(c2, s * 0.26, paint);
    canvas.drawCircle(c3, s * 0.18, paint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.16, s * 0.60, s * 0.70, s * 0.22),
        Radius.circular(s * 0.11),
      ),
      paint,
    );

    // 表情：眯眼笑（两条弧线）
    final eyeY = s * 0.52;
    final arcPaint = Paint()
      ..color = face
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.045
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCenter(center: Offset(s * 0.44, eyeY), width: s * 0.10, height: s * 0.08), math.pi * 0.15, math.pi * 0.7, false, arcPaint);
    canvas.drawArc(Rect.fromCenter(center: Offset(s * 0.60, eyeY), width: s * 0.10, height: s * 0.08), math.pi * 0.15, math.pi * 0.7, false, arcPaint);
    // 腮红
    final blush = Paint()..color = Colors.white.withValues(alpha: 0.35);
    canvas.drawCircle(Offset(s * 0.36, s * 0.60), s * 0.03, blush);
    canvas.drawCircle(Offset(s * 0.68, s * 0.60), s * 0.03, blush);
  }

  @override
  bool shouldRepaint(covariant _CloudPainter oldDelegate) =>
      oldDelegate.body != body || oldDelegate.face != face;
}

/// 空态占位组件。
class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.message,
    this.icon = Icons.cloud_outlined,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CloudMascot(size: 72),
          const SizedBox(height: 12),
          Icon(icon, size: 20, color: palette.outline),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: palette.outline, fontSize: 14),
          ),
          if (actionLabel != null) ...[
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: onAction,
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
