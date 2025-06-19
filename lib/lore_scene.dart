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
  // Improved word-wrap: handle newlines and wrap by word
  const avgCharWidth = 12; // Approximate width per character in pixels
  final lines = <String>[];
  for (final paragraph in text.split('\n')) {
    final words = paragraph.split(' ');
    String line = '';
    for (final word in words) {
      final testLine = line.isEmpty ? word : '$line $word';
      if (testLine.length * avgCharWidth > maxWidth) {
        lines.add(line);
        line = word;
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
