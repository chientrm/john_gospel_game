import 'package:john_gospel_game/john_gospel_data.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/text_rendering.dart' show drawWrappedText;

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
    // Title (centered, with underline)
    drawTextCentered(scene.title, 40, 255, 255, 255, 255);
    drawHLine(100, 700, 80, 255, 255, 255, 255);
    // Lore text box
    drawBox(60, 100, 680, 220, 40, 40, 60, 180);
    drawWrappedText(scene.text, 80, 120, 640, 32, 220, 220, 255, 255);
    // Choices (centered)
    int y = 350;
    for (var i = 0; i < scene.choices.length; i++) {
      drawTextCentered(
        "[${i + 1}] ${scene.choices[i].label}",
        y,
        255,
        255,
        180,
        255,
      );
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
