import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/lore_data.dart';

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
  // Simple word-wrap: split by space, build lines until width exceeded (approximate by char count)
  // You may want to improve this with actual font metrics if available
  const avgCharWidth = 12; // Approximate width per character in pixels
  final words = text.split(' ');
  String line = '';
  int curY = y;
  for (final word in words) {
    final testLine = line.isEmpty ? word : '$line $word';
    if (testLine.length * avgCharWidth > maxWidth) {
      final ptr = line.toNativeUtf8();
      drawText(ptr.cast<ffi.Int8>(), x, curY, r, g, b, a);
      calloc.free(ptr);
      curY += lineHeight;
      line = word;
    } else {
      line = testLine;
    }
  }
  if (line.isNotEmpty) {
    final ptr = line.toNativeUtf8();
    drawText(ptr.cast<ffi.Int8>(), x, curY, r, g, b, a);
    calloc.free(ptr);
  }
}

void showLoreScene(int sceneIndex, {required List<LoreScene> scenes}) {
  if (sceneIndex < 0 || sceneIndex >= scenes.length) return;
  final scene = scenes[sceneIndex];

  // Clear background
  drawRect(0, 0, 800, 600, 32, 32, 48, 255);

  // Draw scene title
  final titlePtr = scene.title.toNativeUtf8();
  drawText(titlePtr.cast<ffi.Int8>(), 60, 80, 255, 255, 255, 255);
  calloc.free(titlePtr);

  // Draw scene text with word-wrapping
  drawWrappedText(scene.text, 60, 180, 680, 32, 220, 220, 255, 255);

  // Draw choices
  int y = 350;
  for (var i = 0; i < scene.choices.length; i++) {
    final choice = scene.choices[i];
    final choicePtr = ("[${i + 1}] ${choice.label}").toNativeUtf8();
    drawText(choicePtr.cast<ffi.Int8>(), 80, y, 255, 255, 180, 255);
    calloc.free(choicePtr);
    y += 50;
  }
}
