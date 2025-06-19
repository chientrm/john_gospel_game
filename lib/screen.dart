abstract class Screen {
  /// Called to render the screen contents
  void render();

  /// Called when a key is pressed. Return the next screen, or null to stay.
  Screen? onKey(int key);

  /// Called when the window is closed. Return true to exit the app.
  bool onWindowClose() => true;
}
