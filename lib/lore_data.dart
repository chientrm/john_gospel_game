class LoreScene {
  final String title;
  final String text;
  final List<LoreChoice> choices;

  LoreScene({required this.title, required this.text, this.choices = const []});
}

class LoreChoice {
  final String label;
  final int nextSceneIndex;

  LoreChoice({required this.label, required this.nextSceneIndex});
}
