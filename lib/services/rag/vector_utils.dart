import 'dart:math' as math;
import 'dart:typed_data';

/// 向量工具：BLOB 编解码与余弦相似度。
class VectorUtils {
  const VectorUtils._();

  /// float32 数组 → BLOB（小端）。
  static Uint8List toBlob(List<double> v) {
    final f32 = Float32List.fromList(v);
    return f32.buffer.asUint8List();
  }

  /// BLOB → float32 数组。
  static List<double> fromBlob(Uint8List blob) {
    final f32 = Float32List.view(
      blob.buffer,
      blob.offsetInBytes,
      blob.lengthInBytes ~/ 4,
    );
    return f32.toList();
  }

  /// 余弦相似度（归一化向量时等价于点积）。
  static double cosine(List<double> a, List<double> b) {
    final n = math.min(a.length, b.length);
    var dot = 0.0, na = 0.0, nb = 0.0;
    for (var i = 0; i < n; i++) {
      dot += a[i] * b[i];
      na += a[i] * a[i];
      nb += b[i] * b[i];
    }
    if (na == 0 || nb == 0) return 0;
    return dot / (math.sqrt(na) * math.sqrt(nb));
  }

  /// 归一化。
  static List<double> normalize(List<double> v) {
    var norm = 0.0;
    for (final x in v) {
      norm += x * x;
    }
    norm = math.sqrt(norm);
    if (norm == 0) return v;
    return v.map((x) => x / norm).toList();
  }
}

/// 检索结果。
class RetrievalHit {
  final String chunkId;
  final String? docId;
  final String? nodeId;
  final String content;
  final double score;

  const RetrievalHit({
    required this.chunkId,
    this.docId,
    this.nodeId,
    required this.content,
    required this.score,
  });
}
