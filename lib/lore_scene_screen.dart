import 'package:john_gospel_game/john_gospel_data.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/text_rendering.dart' show drawWrappedText;

class LoreSceneScreen extends Screen {
  final int sceneIndex;
  int recitationStep;
  // recitationStep == -1: show intro text
  LoreSceneScreen(this.sceneIndex, {this.recitationStep = -1});

  @override
  void render() {
    if (sceneIndex < 0 || sceneIndex >= johnGospelScenes.length) return;
    final scene = johnGospelScenes[sceneIndex];

    clearScreen(32, 32, 48, 255);
    drawTextCentered(scene.title, 40, 255, 255, 255, 255);
    drawHLine(100, 700, 80, 255, 255, 255, 255);
    drawBox(60, 100, 680, 220, 40, 40, 60, 180);

    if (recitationStep == -1) {
      // Show intro text
      drawWrappedText(scene.text, 80, 120, 640, 32, 220, 220, 255, 255);
      drawTextCentered(
        '(Press any key to begin recitation)',
        320,
        180,
        220,
        255,
        255,
      );
    } else if (scene.recitationSteps.isNotEmpty &&
        recitationStep < scene.recitationSteps.length) {
      drawWrappedText(
        scene.recitationSteps[recitationStep],
        80,
        120,
        640,
        32,
        220,
        220,
        255,
        255,
      );
      String progress =
          'Step ${recitationStep + 1} of ${scene.recitationSteps.length}';
      drawTextCentered(progress, 320, 180, 220, 255, 255);
    } else {
      // After recitation, show choices
      drawWrappedText(scene.text, 80, 120, 640, 32, 220, 220, 255, 255);
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
    }
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    final scene = johnGospelScenes[sceneIndex];
    if (recitationStep == -1) {
      // Move to first recitation step
      if (scene.recitationSteps.isNotEmpty) {
        return LoreSceneScreen(sceneIndex, recitationStep: 0);
      } else {
        // No recitation steps, go to choices
        return LoreSceneScreen(
          sceneIndex,
          recitationStep: scene.recitationSteps.length,
        );
      }
    }
    if (scene.recitationSteps.isNotEmpty &&
        recitationStep < scene.recitationSteps.length) {
      if (recitationStep + 1 < scene.recitationSteps.length) {
        return LoreSceneScreen(sceneIndex, recitationStep: recitationStep + 1);
      } else {
        // Finished recitation, show choices
        return LoreSceneScreen(
          sceneIndex,
          recitationStep: scene.recitationSteps.length,
        );
      }
    }
    if (scene.choices.isNotEmpty) {
      for (int i = 0; i < scene.choices.length; i++) {
        if (key == 49 + i) {
          final next = scene.choices[i].nextSceneIndex;
          if (next == -1) return null; // End
          return LoreSceneScreen(next);
        }
      }
      return this;
    } else {
      return null;
    }
  }
}
