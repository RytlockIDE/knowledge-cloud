import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:pdfrx/pdfrx.dart';

/// 文档解析器：txt/md/pdf/docx → 纯文本。
class DocumentParser {
  const DocumentParser();

  /// 根据文件类型解析。
  Future<String> parse(String path, String fileType) async {
    switch (fileType) {
      case 'txt':
      case 'md':
        return await _parseText(path);
      case 'pdf':
        return await _parsePdf(path);
      case 'docx':
        return await _parseDocx(path);
      default:
        throw UnsupportedError('暂不支持的文件类型: $fileType');
    }
  }

  Future<String> _parseText(String path) async {
    final bytes = await File(path).readAsBytes();
    return utf8.decode(bytes, allowMalformed: true);
  }

  Future<String> _parsePdf(String path) async {
    final doc = await PdfDocument.openFile(path);
    try {
      final buf = StringBuffer();
      for (final page in doc.pages) {
        final pageText = await page.loadText();
        if (pageText != null) {
          buf.writeln(pageText.fullText);
        }
      }
      return buf.toString();
    } finally {
      await doc.dispose();
    }
  }

  /// docx 即 zip 内的 word/document.xml，去除 XML 标签。
  Future<String> _parseDocx(String path) async {
    final bytes = await File(path).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    final entry = archive.findFile('word/document.xml');
    if (entry == null) {
      throw const FormatException('无效的 docx：缺少 word/document.xml');
    }
    final xml = utf8.decode(entry.content, allowMalformed: true);
    return _stripWordXml(xml);
  }

  static String _stripWordXml(String xml) {
    // 段落结束换行
    var s = xml.replaceAll(RegExp(r'</w:p>'), '\n');
    // 删除所有标签
    s = s.replaceAll(RegExp(r'<[^>]+>'), '');
    // 解码常见实体
    s = s
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'");
    return s.trim();
  }
}
