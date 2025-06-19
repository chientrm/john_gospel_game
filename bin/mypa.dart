import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:mypa/sdl_bindings.dart';

void main() {
  final title = 'Dart SDL2'.toNativeUtf8();
  if (createWindow(800, 600, title.cast<ffi.Int8>()) == 0) {
    print('Failed to create window');
    return;
  }
  print('Window created!');
  while (pollWindow() != 0) {
    drawRect(100, 100, 200, 150, 255, 0, 0, 255); // Draw a red rectangle
  }
  destroyWindow();
  print('Window closed.');
}
