import 'package:john_gospel_game/john_gospel_data.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/text_rendering.dart' show drawWrappedText;
import 'package:john_gospel_game/main_menu_screen.dart';

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
      drawTextCentered(
        '(Press any key for next step)',
        370,
        180,
        220,
        255,
        255,
      );
    } else if (scene.summary.isNotEmpty) {
      // After recitation, show summary if available
      drawWrappedText(scene.summary, 80, 120, 640, 32, 180, 255, 180, 255);
      String choiceHint = '';
      if (scene.choices.isNotEmpty) {
        choiceHint =
            "Press 'r' to restart, 'q' to quit, or "
            "${scene.choices.length == 1 ? "Enter to continue" : "a number to choose"}";
      } else {
        choiceHint = "Press 'r' to restart or 'q' to quit";
      }
      drawTextCentered('($choiceHint)', 370, 180, 180, 255, 180);
    } else {
      // After recitation, show choices
      drawTextCentered('Choose an option:', 320, 255, 255, 180, 255);
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
    // Handle restart ('r' or 'R') at any time
    if (key == 114 || key == 82) {
      return LoreSceneScreen(sceneIndex, recitationStep: -1);
    }
    // Handle quit ('q' or 'Q') at any time after summary
    if ((key == 113 || key == 81) &&
        (recitationStep >= scene.recitationSteps.length)) {
      return MainMenuScreen();
    }
    if (recitationStep == -1) {
      // Move to first recitation step
      if (scene.recitationSteps.isNotEmpty) {
        return LoreSceneScreen(sceneIndex, recitationStep: 0);
      } else {
        // No recitation steps, go to summary or choices
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
        // Finished recitation, go to summary or choices
        return LoreSceneScreen(
          sceneIndex,
          recitationStep: scene.recitationSteps.length,
        );
      }
    }
    // After recitation, if summary is present, show summary first
    if (scene.summary.isNotEmpty &&
        recitationStep == scene.recitationSteps.length) {
      // If only one choice, only Enter advances
      if (scene.choices.length == 1) {
        if (key == 13) {
          // Enter key
          final next = scene.choices[0].nextSceneIndex;
          if (next == -1) return null;
          return LoreSceneScreen(next);
        }
        // Otherwise, stay on summary
        return this;
      }
      // Otherwise, next key press goes to choices
      return LoreSceneScreen(
        sceneIndex,
        recitationStep: scene.recitationSteps.length + 1,
      );
    }
    // Only allow valid choice keys after summary/recitation
    if (scene.choices.isNotEmpty) {
      for (int i = 0; i < scene.choices.length; i++) {
        if (key == 49 + i) {
          final next = scene.choices[i].nextSceneIndex;
          if (next == -1) return null; // End
          return LoreSceneScreen(next);
        }
      }
      // Invalid key, stay on the same screen
      return this;
    } else {
      return null;
    }
  }
}
