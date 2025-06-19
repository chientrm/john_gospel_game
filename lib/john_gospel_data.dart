import 'lore_data.dart';

/// Structure for the Gospel of John scenes, following the main sections.
final List<LoreScene> johnGospelScenes = [
  // Prologue
  LoreScene(
    title: 'Prologue: The Word Became Flesh',
    text:
        'In the beginning was the Word, and the Word was with God, and the Word was God. ... The Word became flesh and made his dwelling among us. (John 1:1,14)',
    summary:
        'Summary: Jesus, the eternal Word, became flesh and lived among us, revealing God’s glory and grace.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 1)],
    recitationSteps: [
      'In the beginning was the Word, and the Word was with God, and the Word was God. (John 1:1, NIV)',
      'The Word became flesh and made his dwelling among us. We have seen his glory, the glory of the one and only Son, who came from the Father, full of grace and truth. (John 1:14, NIV)',
    ],
  ),
  // Book of Signs
  LoreScene(
    title: 'The Testimony of John the Baptist',
    text:
        'John the Baptist saw Jesus coming toward him and said, “Look, the Lamb of God, who takes away the sin of the world!” (John 1:29)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 2)],
  ),
  LoreScene(
    title: 'The First Disciples',
    text:
        'Jesus said, “Come, and you will see.” So they went and saw where he was staying, and they spent that day with him. (John 1:39)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 3)],
  ),
  LoreScene(
    title: 'Sign 1: Water into Wine',
    text:
        'Jesus turned water into wine at Cana, revealing his glory. (John 2:1–11)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 4)],
  ),
  LoreScene(
    title: 'Sign 2: Healing the Official’s Son',
    text: 'Jesus healed the royal official’s son at a distance. (John 4:46–54)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 5)],
  ),
  LoreScene(
    title: 'Sign 3: Healing at Bethesda',
    text:
        'Jesus healed a man who had been an invalid for 38 years. (John 5:1–15)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 6)],
  ),
  LoreScene(
    title: 'Sign 4: Feeding the 5,000',
    text:
        'Jesus fed five thousand people with five loaves and two fish. (John 6:5–14)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 7)],
  ),
  LoreScene(
    title: 'Sign 5: Walking on Water',
    text:
        'Jesus walked on the Sea of Galilee to reach his disciples. (John 6:16–21)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 8)],
  ),
  LoreScene(
    title: 'Sign 6: Healing the Man Born Blind',
    text: 'Jesus healed a man who had been blind from birth. (John 9:1–7)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 9)],
  ),
  LoreScene(
    title: 'Sign 7: Raising Lazarus',
    text: 'Jesus raised Lazarus from the dead. (John 11:1–44)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 10)],
  ),
  // Book of Glory
  LoreScene(
    title: 'The Last Supper',
    text:
        'Jesus washed the disciples’ feet and gave a new commandment: Love one another. (John 13)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 11)],
  ),
  LoreScene(
    title: 'Farewell Discourses',
    text:
        'Jesus promised the Holy Spirit and prayed for his followers. (John 14–17)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 12)],
  ),
  LoreScene(
    title: 'The Passion',
    text: 'Jesus was arrested, tried, crucified, and buried. (John 18–19)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 13)],
  ),
  LoreScene(
    title: 'The Resurrection',
    text:
        'Jesus rose from the dead and appeared to Mary Magdalene and the disciples. (John 20)',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 14)],
  ),
  // Epilogue
  LoreScene(
    title: 'Epilogue: By the Sea',
    text:
        'Jesus appeared to his disciples by the Sea of Tiberias and restored Peter. (John 21)',
    choices: [LoreChoice(label: 'Finish', nextSceneIndex: -1)],
  ),
];
