class LoreScene {
  final String text;
  final List<LoreChoice> choices;

  LoreScene({required this.text, required this.choices});
}

class LoreChoice {
  final String label;
  final String? nextSceneKey;

  LoreChoice({required this.label, required this.nextSceneKey});
}
