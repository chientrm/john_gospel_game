import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:john_gospel_game/main_menu_screen.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';

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

  int prevKey = 0;
  while (running && pollWindow() != 0) {
    int key = getLastKeyPressed();
    if (key != 0 && prevKey == 0) {
      // Only on new key press
      clearLastKeyPressed();
      final next = currentScreen.onKey(key);
      if (next != null && next != currentScreen) {
        currentScreen = next;
        currentScreen.render(); // Only render on screen change
      } else if (next == null) {
        running = false;
      }
      // If next == currentScreen, do not redraw (prevents blink)
    }
    prevKey = key;
    sleep(Duration(milliseconds: 16));
  }

  destroyWindow();
  print('Window closed.');
}
