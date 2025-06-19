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
    drawBox(100, 40, 600, 70, 40, 40, 80, 200);
    // Title (centered)
    drawTextCentered('Christian Lore Game', 60, 255, 255, 255, 255);
    // Subtitle (centered)
    drawTextCentered('Discover, Learn, and Play!', 120, 180, 200, 255, 255);
    // Prompt (centered, near bottom)
    drawTextCentered(
      'Select a lore scene with ↑/↓, Enter to start',
      170,
      200,
      255,
      200,
      255,
    );
    int y = 220;
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
      );
      y += 36;
    }
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    // Up: 273, Down: 274, Enter: 13
    if (key == 273) {
      return MainMenuScreen(
        selectedIndex:
            (selectedIndex - 1 + johnGospelScenes.length) %
            johnGospelScenes.length,
      );
    }
    if (key == 274) {
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
