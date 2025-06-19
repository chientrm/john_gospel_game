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
  final lines = <String>[];
  for (final paragraph in text.split('\n')) {
    final words = paragraph.split(' ');
    String line = '';
    for (final word in words) {
      final testLine = line.isEmpty ? word : '$line $word';
      final ptr = testLine.toNativeUtf8();
      final width = measureTextWidth(ptr.cast<ffi.Int8>());
      calloc.free(ptr);
      if (width > maxWidth) {
        if (line.isNotEmpty) {
          lines.add(line);
          line = word;
        } else {
          // Single word too long, force break
          lines.add(word);
          line = '';
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
