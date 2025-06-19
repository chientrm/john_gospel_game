import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/lore_data.dart';

void showLoreScene(int sceneIndex) {
  if (sceneIndex < 0 || sceneIndex >= loreScenes.length) return;
  final scene = loreScenes[sceneIndex];

  // Clear background
  drawRect(0, 0, 800, 600, 32, 32, 48, 255);

  // Draw scene title
  final titlePtr = scene.title.toNativeUtf8();
  drawText(titlePtr.cast<ffi.Int8>(), 60, 80, 255, 255, 255, 255);
  calloc.free(titlePtr);

  // Draw scene text
  final textPtr = scene.text.toNativeUtf8();
  drawText(textPtr.cast<ffi.Int8>(), 60, 180, 220, 220, 255, 255);
  calloc.free(textPtr);

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
