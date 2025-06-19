import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:mypa/sdl_bindings.dart';

void main() {
  final title = 'Dart SDL2 Lore Game'.toNativeUtf8();
  if (createWindow(800, 600, title.cast<ffi.Int8>()) == 0) {
    print('Failed to create window');
    return;
  }
  print('Window created!');

  // Example lore entries
  final loreTexts = [
    'In the beginning, God created the heavens and the earth.',
    'For God so loved the world, that he gave his only Son.',
    'The Lord is my shepherd; I shall not want.',
    'Be strong and courageous. Do not be afraid.',
  ];
  int current = 0;

  // Draw initial text
  drawRect(0, 0, 800, 600, 30, 30, 30, 255); // Clear background
  final textPtr = loreTexts[current].toNativeUtf8();
  drawText(textPtr.cast<ffi.Int8>(), 40, 250, 255, 255, 255, 255);
  calloc.free(textPtr);

  int frame = 0;
  while (pollWindow() != 0) {
    frame++;
    if (frame % 120 == 0) {
      current = (current + 1) % loreTexts.length;
      drawRect(0, 0, 800, 600, 30, 30, 30, 255); // Clear background
      final textPtr = loreTexts[current].toNativeUtf8();
      drawText(textPtr.cast<ffi.Int8>(), 40, 250, 255, 255, 255, 255);
      calloc.free(textPtr);
    }
    // Add a small delay to avoid maxing out CPU
    Future.delayed(Duration(milliseconds: 16));
  }
  destroyWindow();
  print('Window closed.');
}
