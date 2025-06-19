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

final List<LoreScene> loreScenes = [
  LoreScene(
    title: 'Creation',
    text: 'In the beginning, God created the heavens and the earth.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 1)],
  ),
  LoreScene(
    title: 'The Good Shepherd',
    text: 'The Lord is my shepherd; I shall not want.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 2)],
  ),
  LoreScene(
    title: 'Courage',
    text: 'Be strong and courageous. Do not be afraid.',
    choices: [LoreChoice(label: 'Finish', nextSceneIndex: -1)],
  ),
];
