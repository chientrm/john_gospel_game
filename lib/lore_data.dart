class LoreScene {
  final String title;
  final String? intro;
  final String? summary;
  final String? hint;
  final List<LoreChoice> choices;
  final List<String>? recitationSteps;

  LoreScene({
    required this.title,
    this.intro,
    this.summary,
    this.hint,
    required this.choices,
    this.recitationSteps,
  });
}

class LoreChoice {
  final String label;
  final String? nextSceneKey;

  LoreChoice({required this.label, required this.nextSceneKey});
}
