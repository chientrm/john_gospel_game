import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';
import 'package:john_gospel_game/john_gospel_data.dart';
import 'package:john_gospel_game/lore_scene.dart' show drawWrappedText;
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';

class LoreSceneScreen extends Screen {
  final int sceneIndex;
  LoreSceneScreen(this.sceneIndex);

  @override
  void render() {
    // Inline showLoreScene logic
    if (sceneIndex < 0 || sceneIndex >= johnGospelScenes.length) return;
    final scene = johnGospelScenes[sceneIndex];

    // Clear background using SDL_RenderClear
    clearScreen(32, 32, 48, 255);

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
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    final scene = johnGospelScenes[sceneIndex];
    if (scene.choices.isNotEmpty) {
      for (int i = 0; i < scene.choices.length; i++) {
        if (key == 49 + i) {
          final next = scene.choices[i].nextSceneIndex;
          if (next == -1) return null; // End
          return LoreSceneScreen(next);
        }
      }
      // If key is not a valid choice, stay on the same screen
      return this;
    } else {
      // No choices, any key continues
      return null;
    }
  }
}
