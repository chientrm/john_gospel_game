import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:mypa/main_menu_screen.dart';
import 'package:mypa/screen.dart';
import 'package:mypa/sdl_bindings.dart';

void main() {
  final title = 'Christian Lore Game'.toNativeUtf8();
  if (createWindow(800, 600, title.cast<ffi.Int8>()) == 0) {
    print('Failed to create window');
    return;
  }
  print('Window created!');

  Screen currentScreen = MainMenuScreen();
  bool running = true;
  currentScreen.render(); // Initial render

  while (running && pollWindow() != 0) {
    int key = getLastKeyPressed();
    if (key != 0) {
      clearLastKeyPressed();
      final next = currentScreen.onKey(key);
      if (next != null) {
        currentScreen = next;
        currentScreen.render(); // Only render on screen change
      } else {
        running = false;
      }
    }
    sleep(Duration(milliseconds: 16));
  }

  destroyWindow();
  print('Window closed.');
}
