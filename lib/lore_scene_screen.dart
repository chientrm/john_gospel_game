import 'package:john_gospel_game/john_gospel_data.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/text_rendering.dart' show drawWrappedText;
import 'package:john_gospel_game/main_menu_screen.dart';

class LoreSceneScreen extends Screen {
  final String sceneKey;
  LoreSceneScreen(this.sceneKey);

  @override
  void render() {
    final scene = johnGospelScenes[sceneKey]!;

    clearScreen(32, 32, 48, 255);
    drawTextCentered('John Gospel Game', 60, 255, 255, 255, 255, width: 1280);
    drawHLine(200, 1080, 110, 255, 255, 255, 255);
    drawBox(180, 140, 920, 260, 40, 40, 60, 180);

    // Show the main text
    drawWrappedText(scene.text, 200, 170, 880, 36, 220, 220, 255, 255);

    // Show choices
    if (scene.choices.isNotEmpty) {
      int y = 600;
      for (var i = 0; i < scene.choices.length; i++) {
        drawTextCentered(
          "[${i + 1}] ${scene.choices[i].label}",
          y,
          255,
          255,
          180,
          255,
          width: 1280,
        );
        y += 50;
      }
      drawTextCentered(
        "(Press a number to choose, 'r' to restart, 'q' to quit)",
        y + 30,
        180,
        255,
        180,
        255,
        width: 1280,
      );
    } else {
      drawTextCentered(
        "(Press 'r' to restart or 'q' to quit)",
        600,
        180,
        255,
        180,
        255,
        width: 1280,
      );
    }
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    final scene = johnGospelScenes[sceneKey]!;
    // Handle restart ('r' or 'R') at any time
    if (key == 114 || key == 82) {
      return LoreSceneScreen(sceneKey);
    }
    // Handle quit ('q' or 'Q') at any time
    if (key == 113 || key == 81) {
      return MainMenuScreen();
    }
    // Only allow valid choice keys
    if (scene.choices.isNotEmpty) {
      for (int i = 0; i < scene.choices.length; i++) {
        if (key == 49 + i) {
          final next = scene.choices[i].nextSceneKey;
          if (next == null) return null;
          return LoreSceneScreen(next);
        }
      }
      return this;
    } else {
      return null;
    }
  }
}
