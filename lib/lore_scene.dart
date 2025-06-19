import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';
import 'package:john_gospel_game/sdl_bindings.dart';

void drawWrappedText(
  String text,
  int x,
  int y,
  int maxWidth,
  int lineHeight,
  int r,
  int g,
  int b,
  int a,
) {
  // Improved word-wrap: handle newlines, wrap by word, split long words
  const avgCharWidth = 10; // DejaVuSans is a bit narrower
  final lines = <String>[];
  for (final paragraph in text.split('\n')) {
    final words = paragraph.split(' ');
    String line = '';
    for (final word in words) {
      final testLine = line.isEmpty ? word : '$line $word';
      if (testLine.length * avgCharWidth > maxWidth) {
        if (line.isNotEmpty) {
          lines.add(line);
          line = '';
        }
        // If the word itself is too long, split it
        int start = 0;
        while (start < word.length) {
          int charsThatFit = maxWidth ~/ avgCharWidth;
          final part = word.substring(
            start,
            (start + charsThatFit).clamp(0, word.length),
          );
          lines.add(part);
          start += charsThatFit;
        }
      } else {
        line = testLine;
      }
    }
    if (line.isNotEmpty) lines.add(line);
  }
  int curY = y;
  for (final line in lines) {
    final ptr = line.toNativeUtf8();
    drawText(ptr.cast<ffi.Int8>(), x, curY, r, g, b, a);
    calloc.free(ptr);
    curY += lineHeight;
  }
}
