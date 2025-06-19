class LoreScene {
  final String title;
  final String text;
  final List<LoreChoice> choices;
  final List<String> recitationSteps;

  LoreScene({
    required this.title,
    required this.text,
    this.choices = const [],
    this.recitationSteps = const [],
  });
}

class LoreChoice {
  final String label;
  final int nextSceneIndex;

  LoreChoice({required this.label, required this.nextSceneIndex});
}
