import 'package:john_gospel_game/lore_scene_screen.dart';
import 'package:john_gospel_game/screen.dart';
import 'package:john_gospel_game/sdl_bindings.dart';

class MainMenuScreen extends Screen {
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
    drawTextCentered('Press any key to start', 520, 255, 255, 180, 255);
    presentRenderer();
  }

  @override
  Screen? onKey(int key) {
    // Any key advances to LoreSceneScreen (scene 0)
    return LoreSceneScreen(0);
  }
}
