import '../../core/config/app_config.dart';

/// 文本分块：滑动窗口。
class TextChunk {
  final String content;
  final int index;

  const TextChunk(this.content, this.index);
}

class Chunker {
  const Chunker();

  List<TextChunk> chunk(String text,
      {int size = AppConfig.chunkSize, int overlap = AppConfig.chunkOverlap}) {
    final clean = text.replaceAll(RegExp(r'\r\n'), '\n').trim();
    if (clean.isEmpty) return const [];
    if (clean.length <= size) return [TextChunk(clean, 0)];

    // 优先在段落边界切分
    final chunks = <TextChunk>[];
    var start = 0;
    var idx = 0;
    while (start < clean.length) {
      var end = (start + size).clamp(0, clean.length);
      if (end < clean.length) {
        // 在末尾 20% 范围内找最近的段落分隔符
        final searchFrom = (start + size * 0.8).floor();
        final seg = clean.substring(searchFrom, end);
        final brk = seg.lastIndexOf('\n\n');
        if (brk > 0) {
          end = searchFrom + brk + 1;
        } else {
          final brk2 = seg.lastIndexOf('\n');
          if (brk2 > 0) end = searchFrom + brk2 + 1;
        }
      }
      final piece = clean.substring(start, end).trim();
      if (piece.isNotEmpty) {
        chunks.add(TextChunk(piece, idx++));
      }
      if (end >= clean.length) break;
      start = (end - overlap).clamp(0, clean.length);
    }
    return chunks;
  }
}
