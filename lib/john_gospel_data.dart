import 'lore_data.dart';

/// Structure for the Gospel of John scenes, now using a map for safer navigation.
final Map<String, LoreScene> johnGospelScenes = {
  'prologue': LoreScene(
    text:
        'Prologue: The Word Became Flesh\n\nWelcome to the beginning of John’s Gospel. Here, you’ll discover the mystery of the Word—Jesus—who existed from the very start and came to live among us.\n\nJesus, the eternal Word, became flesh and lived among us, revealing God’s glory and grace. This sets the stage for all that follows.\n\nIn the beginning was the Word, and the Word was with God, and the Word was God. (John 1:1, NIV)\nHe was with God in the beginning. (John 1:2, NIV)\nThrough him all things were made; without him nothing was made that has been made. (John 1:3, NIV)\nIn him was life, and that life was the light of all mankind. (John 1:4, NIV)\nThe light shines in the darkness, and the darkness has not overcome it. (John 1:5, NIV)\nThe Word became flesh and made his dwelling among us. We have seen his glory, the glory of the one and only Son, who came from the Father, full of grace and truth. (John 1:14, NIV)',
    choices: [
      LoreChoice(
        label: 'What does "the Word" mean?',
        nextSceneKey: 'prologue_word_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'testimony'),
      LoreChoice(
        label: 'Look for a secret message',
        nextSceneKey: 'prologue_secret',
      ),
    ],
  ),
  'prologue_secret': LoreScene(
    text:
        'You notice a hidden acrostic in the first letters of each verse... It spells "JESUS"!\n\nCongratulations, you found a secret.\n\nDo you want to share this with a friend or keep it to yourself?',
    choices: [
      LoreChoice(label: 'Share with a friend', nextSceneKey: 'prologue_share'),
      LoreChoice(label: 'Keep it secret', nextSceneKey: 'testimony'),
    ],
  ),
  'prologue_share': LoreScene(
    text:
        'You share the secret with a friend. They are amazed and want to learn more!\n\nYou both continue your journey together.',
    choices: [LoreChoice(label: 'Continue', nextSceneKey: 'testimony')],
  ),
  'testimony': LoreScene(
    text:
        'The Testimony of John the Baptist\n\nJohn the Baptist’s mission was to prepare the way for someone greater. In this scene, witness how he points everyone to Jesus.\n\nJohn the Baptist identifies Jesus as the Lamb of God who takes away the sin of the world. Will you recognize him too?',
    choices: [
      LoreChoice(
        label: 'Who is the Lamb of God?',
        nextSceneKey: 'testimony_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'first_disciples'),
      LoreChoice(
        label: 'Ask John for advice',
        nextSceneKey: 'testimony_advice',
      ),
    ],
  ),
  'testimony_advice': LoreScene(
    text:
        'John says: "Prepare your heart, be honest, and look for the light in every situation."\n\nYou feel encouraged!',
    choices: [LoreChoice(label: 'Back', nextSceneKey: 'testimony')],
  ),
  'prologue_word_quiz': LoreScene(
    text:
        'Quiz: The Word\n\nWhat does "the Word" refer to in John 1?\n\nTest your understanding of the prologue.',
    choices: [
      LoreChoice(label: 'Jesus', nextSceneKey: 'testimony'),
      LoreChoice(label: 'Moses', nextSceneKey: 'prologue_word_quiz_fail'),
      LoreChoice(label: 'The Law', nextSceneKey: 'prologue_word_quiz_fail'),
    ],
  ),
  'prologue_word_quiz_fail': LoreScene(
    text:
        'Incorrect\n\nThat is not correct. The Word refers to Jesus.\n\nHint: The Word is Jesus, who became flesh.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'prologue_word_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'testimony'),
    ],
  ),
  'testimony_quiz': LoreScene(
    text:
        'Quiz: The Lamb of God\n\nWho does John the Baptist call the Lamb of God?\n\nTest your understanding of John’s testimony.',
    choices: [
      LoreChoice(label: 'Jesus', nextSceneKey: 'first_disciples'),
      LoreChoice(
        label: 'John the Baptist',
        nextSceneKey: 'testimony_quiz_fail',
      ),
      LoreChoice(label: 'Moses', nextSceneKey: 'testimony_quiz_fail'),
    ],
  ),
  'testimony_quiz_fail': LoreScene(
    text:
        'Incorrect\n\nThat is not correct. The Lamb of God is Jesus.\n\nHint: John the Baptist called Jesus the Lamb of God.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'testimony_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'first_disciples'),
    ],
  ),
  'first_disciples': LoreScene(
    text:
        'The First Disciples\n\nMeet the first people who chose to follow Jesus. Their journey begins with curiosity and a simple invitation.\n\nThe first disciples follow Jesus and begin their journey of faith. What does it mean to follow?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the disciples?',
        nextSceneKey: 'first_disciples_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_1'),
    ],
  ),
  'first_disciples_quiz': LoreScene(
    text:
        'Quiz: Jesus’ Invitation\n\nWhat invitation did Jesus give to the first disciples?\n\nTest your understanding of the call to follow.',
    choices: [
      LoreChoice(label: 'Come and see', nextSceneKey: 'sign_1'),
      LoreChoice(label: 'Go away', nextSceneKey: 'first_disciples_quiz_fail'),
      LoreChoice(label: 'Wait here', nextSceneKey: 'first_disciples_quiz_fail'),
    ],
  ),
  'first_disciples_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus said, "Come and see."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'first_disciples_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_1'),
    ],
  ),
  'sign_1': LoreScene(
    text:
        'Sign 1: Water into Wine\n\nAt a wedding in Cana, the wine runs out. What does Jesus tell the servants to do?\n\nJesus performs his first miracle, turning water into wine, revealing his glory. What would you have done as a servant?',
    choices: [
      LoreChoice(
        label: 'Fill the jars with water (Jesus\' instruction)',
        nextSceneKey: 'correct_sign_1',
      ),
      LoreChoice(label: 'Go buy more wine', nextSceneKey: 'incorrect_sign_1'),
      LoreChoice(label: 'Leave the party', nextSceneKey: 'incorrect_sign_2'),
      LoreChoice(
        label: 'Quiz: What was the miracle?',
        nextSceneKey: 'sign_1_quiz',
      ),
    ],
  ),
  'sign_1_quiz': LoreScene(
    text:
        'Quiz: Water into Wine\n\nWhat miracle did Jesus perform at Cana?\n\nTest your knowledge of the first sign.',
    choices: [
      LoreChoice(
        label: 'Turned water into wine',
        nextSceneKey: 'correct_sign_1',
      ),
      LoreChoice(label: 'Fed 5,000 people', nextSceneKey: 'sign_1_quiz_fail'),
      LoreChoice(label: 'Healed a blind man', nextSceneKey: 'sign_1_quiz_fail'),
    ],
  ),
  'sign_1_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus turned water into wine.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_1_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'correct_sign_1'),
    ],
  ),
  'sign_2': LoreScene(
    text:
        'Sign 2: Healing the Official’s Son\n\nA desperate father seeks Jesus for help. See how faith and Jesus’ word bring healing—even from a distance.\n\nJesus heals a royal official’s son by his word, demonstrating his authority and power. What does this teach about faith?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the official?',
        nextSceneKey: 'sign_2_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_3'),
    ],
  ),
  'sign_2_quiz': LoreScene(
    text:
        'Quiz: The Official\'s Son\n\nWhat did Jesus say to the official?\n\nTest your knowledge of the second sign.',
    choices: [
      LoreChoice(label: '\"Your son will live\"', nextSceneKey: 'sign_3'),
      LoreChoice(label: '\"Go away\"', nextSceneKey: 'sign_2_quiz_fail'),
      LoreChoice(label: '\"Wait here\"', nextSceneKey: 'sign_2_quiz_fail'),
    ],
  ),
  'sign_2_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus said, "Your son will live."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_2_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_3'),
    ],
  ),
  'sign_3': LoreScene(
    text:
        'Sign 3: Healing at Bethesda\n\nBy the pool of Bethesda, a man waits for healing. Jesus approaches and changes his life forever.\n\nJesus heals a man at Bethesda, showing his compassion and authority over the Sabbath. What does this teach about mercy?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the man?',
        nextSceneKey: 'sign_3_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_4'),
    ],
  ),
  'sign_3_quiz': LoreScene(
    text:
        'Quiz: Bethesda\n\nWhat did Jesus say to the man at Bethesda?\n\nTest your knowledge of the third sign.',
    choices: [
      LoreChoice(
        label: 'Get up! Pick up your mat and walk.',
        nextSceneKey: 'sign_4',
      ),
      LoreChoice(label: 'Go home.', nextSceneKey: 'sign_3_quiz_fail'),
      LoreChoice(
        label: 'Wait for the water to stir.',
        nextSceneKey: 'sign_3_quiz_fail',
      ),
    ],
  ),
  'sign_3_quiz_fail': LoreScene(
    text:
        'Incorrect\n\nThat is not correct. Jesus said, "Get up! Pick up your mat and walk."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_3_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_4'),
    ],
  ),
  'sign_4': LoreScene(
    text:
        'Sign 4: Feeding the 5,000\n\nA huge crowd is hungry, but resources are few. Watch as Jesus provides more than enough for everyone.\n\nJesus feeds five thousand, demonstrating his power to provide and his compassion for the crowd. What does this teach about trust?',
    choices: [
      LoreChoice(
        label: 'How many baskets were left over?',
        nextSceneKey: 'sign_4_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_5'),
    ],
  ),
  'sign_4_quiz': LoreScene(
    text:
        'Quiz: Feeding the 5,000\n\nHow many baskets of leftovers were collected?\n\nTest your knowledge of the fourth sign.',
    choices: [
      LoreChoice(label: 'Twelve', nextSceneKey: 'sign_5'),
      LoreChoice(label: 'Seven', nextSceneKey: 'sign_4_quiz_fail'),
      LoreChoice(label: 'None', nextSceneKey: 'sign_4_quiz_fail'),
    ],
  ),
  'sign_4_quiz_fail': LoreScene(
    text:
        'Incorrect\n\nThat is not correct. There were twelve baskets left over.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_4_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_5'),
    ],
  ),
  'sign_5': LoreScene(
    text:
        'Sign 5: Walking on Water\n\nThe disciples are caught in a storm on the lake. Jesus comes to them in a way that defies nature itself.\n\nJesus walks on water, revealing his divine authority over nature and calming his disciples’ fears. What does this teach about courage?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the disciples?',
        nextSceneKey: 'sign_5_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_6'),
    ],
  ),
  'sign_5_quiz': LoreScene(
    text:
        'Quiz: Walking on Water\n\nWhat did Jesus say to his frightened disciples?\n\nTest your knowledge of the fifth sign.',
    choices: [
      LoreChoice(label: 'It is I; don\'t be afraid.', nextSceneKey: 'sign_6'),
      LoreChoice(
        label: 'Why are you afraid?',
        nextSceneKey: 'sign_5_quiz_fail',
      ),
      LoreChoice(label: 'Go back to shore.', nextSceneKey: 'sign_5_quiz_fail'),
    ],
  ),
  'sign_5_quiz_fail': LoreScene(
    text:
        'Incorrect\n\nThat is not correct. Jesus said, "It is I; don\'t be afraid."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_5_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_6'),
    ],
  ),
  'sign_6': LoreScene(
    text:
        'Sign 6: Healing the Man Born Blind\n\nA man born blind encounters Jesus. This meeting will change his life and reveal who Jesus truly is.\n\nJesus heals a man born blind, showing that he is the light of the world. What does this teach about spiritual sight?',
    choices: [
      LoreChoice(
        label: 'What did Jesus use to heal the man?',
        nextSceneKey: 'sign_6_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_7'),
    ],
  ),
  'sign_6_quiz': LoreScene(
    text:
        'Quiz: Man Born Blind\n\nWhat did Jesus use to heal the man born blind?\n\nTest your knowledge of the sixth sign.',
    choices: [
      LoreChoice(label: 'Mud made with saliva', nextSceneKey: 'sign_7'),
      LoreChoice(label: 'Olive oil', nextSceneKey: 'sign_6_quiz_fail'),
      LoreChoice(label: 'River water', nextSceneKey: 'sign_6_quiz_fail'),
    ],
  ),
  'sign_6_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus used mud made with saliva.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_6_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_7'),
    ],
  ),
  'sign_7': LoreScene(
    text:
        'Sign 7: Raising Lazarus\n\nLazarus has died, and his family mourns. Jesus arrives and demonstrates his power over death itself.\n\nJesus raises Lazarus from the dead, revealing his power over life and death. What does this teach about hope?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say before raising Lazarus?',
        nextSceneKey: 'sign_7_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'last_supper'),
    ],
  ),
  'sign_7_quiz': LoreScene(
    text:
        'Quiz: Raising Lazarus\n\nWhat did Jesus say before raising Lazarus?\n\nTest your knowledge of the seventh sign.',
    choices: [
      LoreChoice(label: 'Lazarus, come out!', nextSceneKey: 'last_supper'),
      LoreChoice(label: 'Rise and shine!', nextSceneKey: 'sign_7_quiz_fail'),
      LoreChoice(
        label: 'Come forth, Lazarus!',
        nextSceneKey: 'sign_7_quiz_fail',
      ),
    ],
  ),
  'sign_7_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus said, "Lazarus, come out!"',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_7_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'last_supper'),
    ],
  ),
  // Book of Glory
  'last_supper': LoreScene(
    text:
        'The Last Supper\n\nOn the night before his death, Jesus gathers with his disciples for a final meal and a lesson in humility.\n\nAt the Last Supper, Jesus demonstrates servant leadership and commands his disciples to love one another. What does it mean to serve others?',
    choices: [
      LoreChoice(
        label: 'What did Jesus do for his disciples?',
        nextSceneKey: 'last_supper_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'farewell_discourses'),
    ],
  ),
  'last_supper_quiz': LoreScene(
    text:
        'Quiz: The Last Supper\n\nWhat act of service did Jesus perform for his disciples?\n\nTest your knowledge of the Last Supper.',
    choices: [
      LoreChoice(
        label: 'Washed their feet',
        nextSceneKey: 'farewell_discourses',
      ),
      LoreChoice(
        label: 'Gave them gold',
        nextSceneKey: 'last_supper_quiz_fail',
      ),
      LoreChoice(
        label: 'Sent them away',
        nextSceneKey: 'last_supper_quiz_fail',
      ),
    ],
  ),
  'last_supper_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus washed their feet.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'last_supper_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'farewell_discourses'),
    ],
  ),
  'farewell_discourses': LoreScene(
    text:
        'Farewell Discourses\n\nJesus prepares his disciples for what is to come, offering comfort, hope, and a promise of the Holy Spirit.\n\nJesus comforts his disciples, promises the Holy Spirit, and prays for all believers. What does this teach about comfort and faith?',
    choices: [
      LoreChoice(
        label: 'What did Jesus promise his followers?',
        nextSceneKey: 'farewell_discourses_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'passion'),
    ],
  ),
  'farewell_discourses_quiz': LoreScene(
    text:
        'Quiz: Farewell Discourses\n\nWhat did Jesus promise to send to his followers?\n\nTest your knowledge of the Farewell Discourses.',
    choices: [
      LoreChoice(label: 'The Holy Spirit', nextSceneKey: 'passion'),
      LoreChoice(
        label: 'A new law',
        nextSceneKey: 'farewell_discourses_quiz_fail',
      ),
      LoreChoice(
        label: 'A kingdom on earth',
        nextSceneKey: 'farewell_discourses_quiz_fail',
      ),
    ],
  ),
  'farewell_discourses_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus promised the Holy Spirit.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'farewell_discourses_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'passion'),
    ],
  ),
  'passion': LoreScene(
    text:
        'The Passion\n\nJesus faces betrayal, suffering, and death, fulfilling his mission to save the world.\n\nJesus willingly suffers, is crucified, and is buried to fulfill God’s plan of salvation. What does this teach about sacrifice?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say on the cross?',
        nextSceneKey: 'passion_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'resurrection'),
    ],
  ),
  'passion_quiz': LoreScene(
    text:
        'Quiz: The Passion\n\nWhat were Jesus\' last words on the cross?\n\nTest your knowledge of the Passion.',
    choices: [
      LoreChoice(label: 'It is finished.', nextSceneKey: 'resurrection'),
      LoreChoice(label: 'I am thirsty.', nextSceneKey: 'passion_quiz_fail'),
      LoreChoice(
        label: 'Father, forgive them.',
        nextSceneKey: 'passion_quiz_fail',
      ),
    ],
  ),
  'passion_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Jesus said, "It is finished."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'passion_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'resurrection'),
    ],
  ),
  'resurrection': LoreScene(
    text:
        'The Resurrection\n\nThe tomb is empty! Jesus is alive, and his followers encounter the risen Lord.\n\nJesus rises from the dead, appearing to Mary Magdalene and his disciples, bringing hope and new life. What does this teach about victory and new beginnings?',
    choices: [
      LoreChoice(
        label: 'Who did Jesus appear to first?',
        nextSceneKey: 'resurrection_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'epilogue'),
    ],
  ),
  'resurrection_quiz': LoreScene(
    text:
        'Quiz: The Resurrection\n\nWho was the first to see the risen Jesus?\n\nTest your knowledge of the Resurrection.',
    choices: [
      LoreChoice(label: 'Mary Magdalene', nextSceneKey: 'epilogue'),
      LoreChoice(label: 'Peter', nextSceneKey: 'resurrection_quiz_fail'),
      LoreChoice(label: 'John', nextSceneKey: 'resurrection_quiz_fail'),
    ],
  ),
  'resurrection_quiz_fail': LoreScene(
    text: 'Incorrect\n\nThat is not correct. Mary Magdalene saw Jesus first.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'resurrection_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'epilogue'),
    ],
  ),
  'epilogue': LoreScene(
    text:
        'Epilogue: By the Sea\n\nAfter his resurrection, Jesus appears to his disciples by the sea and restores Peter’s calling.\n\nJesus restores Peter and calls his disciples to follow him and care for his people. What does it mean to follow Jesus today?',
    choices: [
      LoreChoice(
        label: 'Reflect: What does it mean to follow?',
        nextSceneKey: null,
      ),
      LoreChoice(label: 'Finish', nextSceneKey: null),
    ],
  ),
};
