import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/lore_scene_screen.dart';

class MainMenuScreen extends Screen {
  @override
  void render() {
    clearScreen(24, 24, 48, 255);
    final gameTitle = 'Christian Lore Game'.toNativeUtf8();
    drawText(gameTitle.cast<ffi.Int8>(), 120, 100, 255, 255, 255, 255);
    calloc.free(gameTitle);
    final subtitle = 'Discover, Learn, and Play!'.toNativeUtf8();
    drawText(subtitle.cast<ffi.Int8>(), 220, 180, 200, 200, 255, 255);
    calloc.free(subtitle);
    final prompt = 'Press any key to start'.toNativeUtf8();
    drawText(prompt.cast<ffi.Int8>(), 250, 500, 255, 255, 180, 255);
    calloc.free(prompt);
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    // Any key advances to LoreSceneScreen (scene 0)
    return LoreSceneScreen(0);
  }
}
