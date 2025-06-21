import 'package:john_gospel_game/john_gospel_data.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/text_rendering.dart' show drawWrappedText;
import 'package:john_gospel_game/main_menu_screen.dart';

class LoreSceneScreen extends Screen {
  final String sceneKey;
  int recitationStep;
  // recitationStep == -1: show intro text
  LoreSceneScreen(this.sceneKey, {this.recitationStep = -1});

  @override
  void render() {
    final scene = johnGospelScenes[sceneKey]!;

    clearScreen(32, 32, 48, 255);
    drawTextCentered(
      scene.title,
      60,
      255,
      255,
      255,
      255,
      width: 1280,
    ); // Higher for widescreen
    drawHLine(200, 1080, 110, 255, 255, 255, 255); // Wider line
    drawBox(180, 140, 920, 260, 40, 40, 60, 180); // Wider box

    // Show intro if present and at start
    if (recitationStep == -1) {
      if (scene.intro != null && scene.intro!.isNotEmpty) {
        drawWrappedText(scene.intro!, 200, 170, 880, 36, 220, 220, 255, 255);
      }
      if (scene.hint != null && scene.hint!.isNotEmpty) {
        drawWrappedText(
          'Hint: ' + scene.hint!,
          200,
          350,
          880,
          32,
          180,
          180,
          255,
          255,
        );
      }
      drawTextCentered(
        "(Press any key to begin recitation, 'q' to quit)",
        440,
        220,
        255,
        255,
        255,
        width: 1280,
      );
    } else if (scene.recitationSteps != null &&
        scene.recitationSteps!.isNotEmpty &&
        recitationStep < scene.recitationSteps!.length) {
      drawWrappedText(
        scene.recitationSteps![recitationStep],
        200,
        170,
        880,
        36,
        220,
        220,
        255,
        255,
      );
      String progress =
          'Step ${recitationStep + 1} of ${scene.recitationSteps!.length}';
      drawTextCentered(progress, 500, 220, 255, 255, 255, width: 1280);
      drawTextCentered(
        "(Press any key for next step, 'q' to quit)",
        540,
        220,
        255,
        255,
        255,
        width: 1280,
      );
    } else if (scene.summary != null &&
        scene.summary!.isNotEmpty &&
        (scene.recitationSteps == null ||
            recitationStep == (scene.recitationSteps?.length ?? 0))) {
      // After recitation, show summary if available
      drawWrappedText(scene.summary!, 200, 170, 880, 36, 180, 255, 180, 255);
      if (scene.hint != null && scene.hint!.isNotEmpty) {
        drawWrappedText(
          'Hint: ' + scene.hint!,
          200,
          350,
          880,
          32,
          180,
          180,
          255,
          255,
        );
      }
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
    } else {
      // After recitation, show choices
      if (scene.hint != null && scene.hint!.isNotEmpty) {
        drawWrappedText(
          'Hint: ' + scene.hint!,
          200,
          350,
          880,
          32,
          180,
          180,
          255,
          255,
        );
      }
      drawTextCentered(
        'Choose an option:',
        500,
        255,
        255,
        180,
        255,
        width: 1280,
      );
      int y = 560;
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
    }
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    final scene = johnGospelScenes[sceneKey]!;
    // Handle restart ('r' or 'R') at any time
    if (key == 114 || key == 82) {
      return LoreSceneScreen(sceneKey, recitationStep: -1);
    }
    // Handle quit ('q' or 'Q') at any time (from any step)
    if (key == 113 || key == 81) {
      return MainMenuScreen();
    }
    if (recitationStep == -1) {
      // Move to first recitation step
      if (scene.recitationSteps != null && scene.recitationSteps!.isNotEmpty) {
        return LoreSceneScreen(sceneKey, recitationStep: 0);
      } else {
        // No recitation steps, go to summary or choices
        return LoreSceneScreen(
          sceneKey,
          recitationStep: scene.recitationSteps?.length ?? 0,
        );
      }
    }
    if (scene.recitationSteps != null &&
        scene.recitationSteps!.isNotEmpty &&
        recitationStep < scene.recitationSteps!.length) {
      if (recitationStep + 1 < scene.recitationSteps!.length) {
        return LoreSceneScreen(sceneKey, recitationStep: recitationStep + 1);
      } else {
        // Finished recitation, go to summary or choices
        return LoreSceneScreen(
          sceneKey,
          recitationStep: scene.recitationSteps!.length,
        );
      }
    }
    // After recitation, if summary is present, show summary first
    if (scene.summary != null &&
        scene.summary!.isNotEmpty &&
        recitationStep == (scene.recitationSteps?.length ?? 0)) {
      // If only one choice, only Enter advances
      if (scene.choices.length == 1) {
        if (key == 13) {
          final next = scene.choices[0].nextSceneKey;
          if (next == null) return null;
          return LoreSceneScreen(next);
        }
        // Otherwise, stay on summary
        return this;
      }
      // Otherwise, next key press goes to choices
      return LoreSceneScreen(
        sceneKey,
        recitationStep: (scene.recitationSteps?.length ?? 0) + 1,
      );
    }
    // Only allow valid choice keys after summary/recitation
    if (scene.choices.isNotEmpty) {
      for (int i = 0; i < scene.choices.length; i++) {
        if (key == 49 + i) {
          final next = scene.choices[i].nextSceneKey;
          if (next == null) return null; // End
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
