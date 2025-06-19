import 'package:john_gospel_game/lore_data.dart';
import 'package:john_gospel_game/lore_scene.dart';
import 'package:john_gospel_game/screen.dart';

class LoreSceneScreen extends Screen {
  final int sceneIndex;
  LoreSceneScreen(this.sceneIndex);

  @override
  void render() {
    showLoreScene(sceneIndex);
  }

  @override
  Screen? onKey(int key) {
    final scene = loreScenes[sceneIndex];
    if (scene.choices.isNotEmpty) {
      for (int i = 0; i < scene.choices.length; i++) {
        if (key == 49 + i) {
          final next = scene.choices[i].nextSceneIndex;
          if (next == -1) return null; // End
          return LoreSceneScreen(next);
        }
      }
      return null;
    } else {
      // No choices, any key continues
      return null;
    }
  }
}
