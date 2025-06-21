class LoreScene {
  final String title;
  final String intro;
  final String summary;
  final List<LoreChoice> choices;
  final List<String> recitationSteps;

  LoreScene({
    required this.title,
    required this.intro,
    this.summary = '',
    this.choices = const [],
    this.recitationSteps = const [],
  });
}

class LoreChoice {
  final String label;
  final String? nextSceneKey;

  LoreChoice({required this.label, required this.nextSceneKey});
}
