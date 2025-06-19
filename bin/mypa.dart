import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';
import 'package:mypa/lore_data.dart';
import 'package:mypa/lore_scene.dart';
import 'package:mypa/main_screen.dart';
import 'package:mypa/sdl_bindings.dart';

enum GameScreen { mainMenu, story, exploration, puzzle, lore, exit }

void main() {
  final title = 'Christian Lore Game'.toNativeUtf8();
  if (createWindow(800, 600, title.cast<ffi.Int8>()) == 0) {
    print('Failed to create window');
    return;
  }
  print('Window created!');

  GameScreen currentScreen = GameScreen.mainMenu;
  int currentScene = 0;
  bool running = true;

  while (running) {
    switch (currentScreen) {
      case GameScreen.mainMenu:
        showMainScreen();
        // For now, auto-advance to story after main screen
        currentScreen = GameScreen.story;
        break;
      case GameScreen.story:
        int selected = -1;
        showLoreScene(currentScene);
        // Wait for valid key input or window close
        bool waiting = true;
        while (waiting && pollWindow() != 0) {
          int key = getLastKeyPressed();
          if (key != 0) {
            clearLastKeyPressed();
            // Check if key is a number key for choices
            if (loreScenes[currentScene].choices.isNotEmpty) {
              for (
                int i = 0;
                i < loreScenes[currentScene].choices.length;
                i++
              ) {
                // SDL2 keycodes for 1,2,3... are 49,50,51...
                if (key == 49 + i) {
                  selected = i;
                  waiting = false;
                  break;
                }
              }
            } else {
              // If no choices, any key continues
              waiting = false;
            }
          }
        }
        if (selected != -1) {
          currentScene =
              loreScenes[currentScene].choices[selected].nextSceneIndex;
        } else {
          currentScreen = GameScreen.lore;
        }
        break;
      case GameScreen.lore:
        // Placeholder: show lore/inventory screen
        // For now, just exit
        running = false;
        break;
      case GameScreen.exploration:
        // Placeholder for exploration scene
        running = false;
        break;
      case GameScreen.puzzle:
        // Placeholder for puzzle/mini-game
        running = false;
        break;
      case GameScreen.exit:
        running = false;
        break;
    }
  }

  destroyWindow();
  print('Window closed.');
}
