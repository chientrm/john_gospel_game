import 'package:john_gospel_game/lore_scene_screen.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';
import 'package:john_gospel_game/john_gospel_data.dart';

class MainMenuScreen extends Screen {
  int selectedIndex;
  MainMenuScreen({this.selectedIndex = 0});

  @override
  void render() {
    clearScreen(24, 24, 48, 255);
    // Draw a box for the title area
    drawBox(340, 40, 600, 70, 40, 40, 80, 200); // Centered for 1280 width
    // Title (centered)
    drawTextCentered('John Gospel Lore', 60, 255, 255, 255, 255, width: 1280);
    // Subtitle (centered)
    drawTextCentered(
      'Discover, Learn, and Play!',
      120,
      180,
      200,
      255,
      255,
      width: 1280,
    );
    int menuStartY = 180;
    int y = menuStartY;
    for (int i = 0; i < johnGospelScenes.length; i++) {
      final color =
          i == selectedIndex ? [255, 255, 180, 255] : [180, 200, 255, 255];
      drawTextCentered(
        '${i + 1}. ${johnGospelScenes[i].title}',
        y,
        color[0],
        color[1],
        color[2],
        color[3],
        width: 1280,
      );
      y += 28; // Tighter spacing for more items
    }
    drawTextCentered(
      "Press ↑/↓ to select, Enter to start, 'q' to quit",
      690,
      255,
      180,
      180,
      255,
      width: 1280,
    );
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    // Up: 1073741906, Down: 1073741905, Enter: 13, Quit: 'q' or 'Q'
    if (key == 113 || key == 81) {
      return null; // Quit game
    }
    if (key == 1073741906) {
      return MainMenuScreen(
        selectedIndex:
            (selectedIndex - 1 + johnGospelScenes.length) %
            johnGospelScenes.length,
      );
    }
    if (key == 1073741905) {
      return MainMenuScreen(
        selectedIndex: (selectedIndex + 1) % johnGospelScenes.length,
      );
    }
    if (key == 13) {
      return LoreSceneScreen(selectedIndex);
    }
    return this;
  }
}
