import 'lore_data.dart';

/// Structure for the Gospel of John scenes, following the main sections.
final List<LoreScene> johnGospelScenes = [
  // Prologue
  LoreScene(
    title: 'Prologue: The Word Became Flesh',
    intro:
        'Welcome to the beginning of John’s Gospel. Here, you’ll discover the mystery of the Word—Jesus—who existed from the very start and came to live among us.',
    summary:
        'Summary: Jesus, the eternal Word, became flesh and lived among us, revealing God’s glory and grace.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 1)],
    recitationSteps: [
      'In the beginning was the Word, and the Word was with God, and the Word was God. (John 1:1, NIV)',
      'He was with God in the beginning. (John 1:2, NIV)',
      'Through him all things were made; without him nothing was made that has been made. (John 1:3, NIV)',
      'In him was life, and that life was the light of all mankind. (John 1:4, NIV)',
      'The light shines in the darkness, and the darkness has not overcome it. (John 1:5, NIV)',
      'The Word became flesh and made his dwelling among us. We have seen his glory, the glory of the one and only Son, who came from the Father, full of grace and truth. (John 1:14, NIV)',
    ],
  ),
  LoreScene(
    title: 'The Testimony of John the Baptist',
    intro:
        'John the Baptist’s mission was to prepare the way for someone greater. In this scene, witness how he points everyone to Jesus.',
    summary:
        'Summary: John the Baptist identifies Jesus as the Lamb of God who takes away the sin of the world.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 2)],
    recitationSteps: [
      'There was a man sent from God whose name was John. (John 1:6, NIV)',
      'He came as a witness to testify concerning that light, so that through him all might believe. (John 1:7, NIV)',
      'He himself was not the light; he came only as a witness to the light. (John 1:8, NIV)',
      'John replied in the words of Isaiah the prophet, “I am the voice of one calling in the wilderness, ‘Make straight the way for the Lord.’” (John 1:23, NIV)',
      'John saw Jesus coming toward him and said, “Look, the Lamb of God, who takes away the sin of the world!” (John 1:29, NIV)',
      'I have seen and I testify that this is God’s Chosen One.” (John 1:34, NIV)',
    ],
  ),
  LoreScene(
    title: 'The First Disciples',
    intro:
        'Meet the first people who chose to follow Jesus. Their journey begins with curiosity and a simple invitation.',
    summary:
        'Summary: The first disciples follow Jesus and begin their journey of faith.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 3)],
    recitationSteps: [
      'The next day John was there again with two of his disciples. (John 1:35, NIV)',
      'When he saw Jesus passing by, he said, “Look, the Lamb of God!” (John 1:36, NIV)',
      'When the two disciples heard him say this, they followed Jesus. (John 1:37, NIV)',
      'Turning around, Jesus saw them following and asked, “What do you want?” ... “Come,” he replied, “and you will see.” (John 1:38-39, NIV)',
      'So they went and saw where he was staying, and they spent that day with him. (John 1:39, NIV)',
      'Andrew, Simon Peter’s brother, was one of the two who heard what John had said and who had followed Jesus. (John 1:40, NIV)',
      'The first thing Andrew did was to find his brother Simon and tell him, “We have found the Messiah” (that is, the Christ). (John 1:41, NIV)',
      'And he brought him to Jesus. (John 1:42, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 1: Water into Wine',
    intro:
        'At a wedding in Cana, a problem arises—and Jesus’ first miracle reveals his glory in an unexpected way.',
    summary:
        'Summary: Jesus performs his first miracle, turning water into wine, revealing his glory.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 4)],
    recitationSteps: [
      'Jesus said to the servants, “Fill the jars with water”; so they filled them to the brim. (John 2:7, NIV)',
      'He thus revealed his glory, and his disciples believed in him. (John 2:11, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 2: Healing the Official’s Son',
    intro:
        'A desperate father seeks Jesus for help. See how faith and Jesus’ word bring healing—even from a distance.',
    summary:
        'Summary: Jesus heals a royal official’s son by his word, demonstrating his authority and power.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 5)],
    recitationSteps: [
      '“Go,” Jesus replied, “your son will live.” The man took Jesus at his word and departed. (John 4:50, NIV)',
      'So he and his whole household believed. (John 4:53, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 3: Healing at Bethesda',
    intro:
        'By the pool of Bethesda, a man waits for healing. Jesus approaches and changes his life forever.',
    summary:
        'Summary: Jesus heals a man at Bethesda, showing his compassion and authority over the Sabbath.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 6)],
    recitationSteps: [
      'Then Jesus said to him, “Get up! Pick up your mat and walk.” (John 5:8, NIV)',
      'At once the man was cured; he picked up his mat and walked. (John 5:9, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 4: Feeding the 5,000',
    intro:
        'A huge crowd is hungry, but resources are few. Watch as Jesus provides more than enough for everyone.',
    summary:
        'Summary: Jesus feeds five thousand, demonstrating his power to provide and his compassion for the crowd.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 7)],
    recitationSteps: [
      'Jesus then took the loaves, gave thanks, and distributed to those who were seated as much as they wanted. (John 6:11, NIV)',
      'After the people saw the sign Jesus performed, they began to say, “Surely this is the Prophet who is to come into the world.” (John 6:14, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 5: Walking on Water',
    intro:
        'The disciples are caught in a storm on the lake. Jesus comes to them in a way that defies nature itself.',
    summary:
        'Summary: Jesus walks on water, revealing his divine authority over nature and calming his disciples’ fears.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 8)],
    recitationSteps: [
      'When they had rowed about three or four miles, they saw Jesus approaching the boat, walking on the water; and they were frightened. (John 6:19, NIV)',
      'But he said to them, “It is I; don’t be afraid.” (John 6:20, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 6: Healing the Man Born Blind',
    intro:
        'A man born blind encounters Jesus. This meeting will change his life and reveal who Jesus truly is.',
    summary:
        'Summary: Jesus heals a man born blind, showing that he is the light of the world.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 9)],
    recitationSteps: [
      '“Go,” he told him, “wash in the Pool of Siloam.” So the man went and washed, and came home seeing. (John 9:7, NIV)',
      'One thing I do know. I was blind but now I see! (John 9:25, NIV)',
    ],
  ),
  LoreScene(
    title: 'Sign 7: Raising Lazarus',
    intro:
        'Lazarus has died, and his family mourns. Jesus arrives and demonstrates his power over death itself.',
    summary:
        'Summary: Jesus raises Lazarus from the dead, revealing his power over life and death.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 10)],
    recitationSteps: [
      'Jesus called in a loud voice, “Lazarus, come out!” (John 11:43, NIV)',
      'The dead man came out, his hands and feet wrapped with strips of linen, and a cloth around his face. (John 11:44, NIV)',
    ],
  ),
  // Book of Glory
  LoreScene(
    title: 'The Last Supper',
    intro:
        'On the night before his death, Jesus gathers with his disciples for a final meal and a lesson in humility.',
    summary:
        'Summary: At the Last Supper, Jesus demonstrates servant leadership and commands his disciples to love one another.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 11)],
    recitationSteps: [
      'Now that I, your Lord and Teacher, have washed your feet, you also should wash one another’s feet. (John 13:14, NIV)',
      'A new command I give you: Love one another. As I have loved you, so you must love one another. (John 13:34, NIV)',
    ],
  ),
  LoreScene(
    title: 'Farewell Discourses',
    intro:
        'Jesus prepares his disciples for what is to come, offering comfort, hope, and a promise of the Holy Spirit.',
    summary:
        'Summary: Jesus comforts his disciples, promises the Holy Spirit, and prays for all believers.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 12)],
    recitationSteps: [
      'And I will ask the Father, and he will give you another advocate to help you and be with you forever—the Spirit of truth. (John 14:16-17, NIV)',
      'My prayer is not for them alone. I pray also for those who will believe in me through their message. (John 17:20, NIV)',
    ],
  ),
  LoreScene(
    title: 'The Passion',
    intro:
        'Jesus faces betrayal, suffering, and death, fulfilling his mission to save the world.',
    summary:
        'Summary: Jesus willingly suffers, is crucified, and is buried to fulfill God’s plan of salvation.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 13)],
    recitationSteps: [
      'So the soldiers took charge of Jesus. Carrying his own cross, he went out to the place of the Skull. (John 19:16-17, NIV)',
      'When he had received the drink, Jesus said, “It is finished.” With that, he bowed his head and gave up his spirit. (John 19:30, NIV)',
    ],
  ),
  LoreScene(
    title: 'The Resurrection',
    intro:
        'The tomb is empty! Jesus is alive, and his followers encounter the risen Lord.',
    summary:
        'Summary: Jesus rises from the dead, appearing to Mary Magdalene and his disciples, bringing hope and new life.',
    choices: [LoreChoice(label: 'Continue', nextSceneIndex: 14)],
    recitationSteps: [
      'He is not here; he has risen! (John 20:13, NIV)',
      'Jesus said, “Peace be with you! As the Father has sent me, I am sending you.” (John 20:21, NIV)',
    ],
  ),
  // Epilogue
  LoreScene(
    title: 'Epilogue: By the Sea',
    intro:
        'After his resurrection, Jesus appears to his disciples by the sea and restores Peter’s calling.',
    summary:
        'Summary: Jesus restores Peter and calls his disciples to follow him and care for his people.',
    choices: [LoreChoice(label: 'Finish', nextSceneIndex: -1)],
    recitationSteps: [
      'Jesus said, “Simon son of John, do you love me?” ... “Feed my sheep.” (John 21:17, NIV)',
      'Then he said to him, “Follow me!” (John 21:19, NIV)',
    ],
  ),
];
