import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:mypa/sdl_bindings.dart';
import 'dart:io';

void showMainScreen() {
  // Draw main screen background
  drawRect(0, 0, 800, 600, 24, 24, 48, 255); // Dark blue background

  // Draw title
  final gameTitle = 'Christian Lore Game'.toNativeUtf8();
  drawText(
    gameTitle.cast<ffi.Int8>(),
    120,
    100,
    255,
    255,
    255,
    255,
  ); // White title
  calloc.free(gameTitle);

  // Draw subtitle
  final subtitle = 'Discover, Learn, and Play!'.toNativeUtf8();
  drawText(
    subtitle.cast<ffi.Int8>(),
    220,
    180,
    200,
    200,
    255,
    255,
  ); // Light blue subtitle
  calloc.free(subtitle);

  // Draw prompt
  final prompt = 'Press any key to start'.toNativeUtf8();
  drawText(
    prompt.cast<ffi.Int8>(),
    250,
    500,
    255,
    255,
    180,
    255,
  ); // Yellowish prompt
  calloc.free(prompt);

  // Wait for any key or window close
  bool started = false;
  while (!started && pollWindow() != 0) {
    if (getLastKeyPressed() != 0) {
      started = true;
      clearLastKeyPressed();
      break;
    }
    sleep(Duration(milliseconds: 16));
  }
}
