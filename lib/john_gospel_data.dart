import 'lore_data.dart';

/// Structure for the Gospel of John scenes, now using a map for safer navigation.
final Map<String, LoreScene> johnGospelScenes = {
  'prologue': LoreScene(
    title: 'Prologue: The Word Became Flesh',
    intro:
        'Welcome to the beginning of John’s Gospel. Here, you’ll discover the mystery of the Word—Jesus—who existed from the very start and came to live among us.',
    summary:
        'Jesus, the eternal Word, became flesh and lived among us, revealing God’s glory and grace. This sets the stage for all that follows.',
    choices: [
      LoreChoice(
        label: 'What does "the Word" mean?',
        nextSceneKey: 'prologue_word_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'testimony'),
    ],
    recitationSteps: [
      'In the beginning was the Word, and the Word was with God, and the Word was God. (John 1:1, NIV)',
      'He was with God in the beginning. (John 1:2, NIV)',
      'Through him all things were made; without him nothing was made that has been made. (John 1:3, NIV)',
      'In him was life, and that life was the light of all mankind. (John 1:4, NIV)',
      'The light shines in the darkness, and the darkness has not overcome it. (John 1:5, NIV)',
      'The Word became flesh and made his dwelling among us. We have seen his glory, the glory of the one and only Son, who came from the Father, full of grace and truth. (John 1:14, NIV)',
    ],
  ),
  'prologue_word_quiz': LoreScene(
    title: 'Quiz: The Word',
    intro: 'What does "the Word" refer to in John 1?',
    summary: 'Test your understanding of the prologue.',
    choices: [
      LoreChoice(label: 'Jesus', nextSceneKey: 'testimony'),
      LoreChoice(label: 'Moses', nextSceneKey: 'prologue_word_quiz_fail'),
      LoreChoice(label: 'The Law', nextSceneKey: 'prologue_word_quiz_fail'),
    ],
    hint: 'The Word became flesh and lived among us.',
  ),
  'prologue_word_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. The Word refers to Jesus.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'prologue_word_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'testimony'),
    ],
    hint: 'The Word is Jesus, who became flesh.',
  ),
  'testimony': LoreScene(
    title: 'The Testimony of John the Baptist',
    intro:
        'John the Baptist’s mission was to prepare the way for someone greater. In this scene, witness how he points everyone to Jesus.',
    summary:
        'John the Baptist identifies Jesus as the Lamb of God who takes away the sin of the world. Will you recognize him too?',
    choices: [
      LoreChoice(
        label: 'Who is the Lamb of God?',
        nextSceneKey: 'testimony_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'first_disciples'),
    ],
    recitationSteps: [
      'There was a man sent from God whose name was John. (John 1:6, NIV)',
      'He came as a witness to testify concerning that light, so that through him all might believe. (John 1:7, NIV)',
      'He himself was not the light; he came only as a witness to the light. (John 1:8, NIV)',
      'John replied in the words of Isaiah the prophet, “I am the voice of one calling in the wilderness, ‘Make straight the way for the Lord.’” (John 1:23, NIV)',
      'John saw Jesus coming toward him and said, “Look, the Lamb of God, who takes away the sin of the world!” (John 1:29, NIV)',
      'I have seen and I testify that this is God’s Chosen One.” (John 1:34, NIV)',
    ],
  ),
  'testimony_quiz': LoreScene(
    title: 'Quiz: The Lamb of God',
    intro: 'Who does John the Baptist call the Lamb of God?',
    summary: 'Test your understanding of John’s testimony.',
    choices: [
      LoreChoice(label: 'Jesus', nextSceneKey: 'first_disciples'),
      LoreChoice(
        label: 'John the Baptist',
        nextSceneKey: 'testimony_quiz_fail',
      ),
      LoreChoice(label: 'Moses', nextSceneKey: 'testimony_quiz_fail'),
    ],
    hint: 'John points to someone greater than himself.',
  ),
  'testimony_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. The Lamb of God is Jesus.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'testimony_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'first_disciples'),
    ],
    hint: 'John the Baptist called Jesus the Lamb of God.',
  ),
  'first_disciples': LoreScene(
    title: 'The First Disciples',
    intro:
        'Meet the first people who chose to follow Jesus. Their journey begins with curiosity and a simple invitation.',
    summary:
        'The first disciples follow Jesus and begin their journey of faith. What does it mean to follow?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the disciples?',
        nextSceneKey: 'first_disciples_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_1'),
    ],
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
  'first_disciples_quiz': LoreScene(
    title: 'Quiz: Jesus’ Invitation',
    intro: 'What invitation did Jesus give to the first disciples?',
    summary: 'Test your understanding of the call to follow.',
    choices: [
      LoreChoice(label: 'Come and see', nextSceneKey: 'sign_1'),
      LoreChoice(label: 'Go away', nextSceneKey: 'first_disciples_quiz_fail'),
      LoreChoice(label: 'Wait here', nextSceneKey: 'first_disciples_quiz_fail'),
    ],
    hint: 'Jesus invited them to join him.',
  ),
  'first_disciples_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus said, "Come and see."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'first_disciples_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_1'),
    ],
    hint: 'Jesus invited the disciples to "Come and see."',
  ),
  'sign_1': LoreScene(
    title: 'Sign 1: Water into Wine',
    intro:
        'At a wedding in Cana, the wine runs out. What does Jesus tell the servants to do?',
    summary:
        'Jesus performs his first miracle, turning water into wine, revealing his glory. What would you have done as a servant?',
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
    recitationSteps: [
      'Jesus said to the servants, “Fill the jars with water”; so they filled them to the brim. (John 2:7, NIV)',
      'He thus revealed his glory, and his disciples believed in him. (John 2:11, NIV)',
      'Fun Fact: This is the first recorded miracle of Jesus in the Gospel of John!',
    ],
  ),
  'sign_1_quiz': LoreScene(
    title: 'Quiz: Water into Wine',
    intro: 'What miracle did Jesus perform at Cana?',
    summary: 'Test your knowledge of the first sign.',
    choices: [
      LoreChoice(
        label: 'Turned water into wine',
        nextSceneKey: 'correct_sign_1',
      ),
      LoreChoice(label: 'Fed 5,000 people', nextSceneKey: 'sign_1_quiz_fail'),
      LoreChoice(label: 'Healed a blind man', nextSceneKey: 'sign_1_quiz_fail'),
    ],
    hint: 'It involved jars and a wedding.',
  ),
  'sign_1_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus turned water into wine.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_1_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'correct_sign_1'),
    ],
    hint: 'Jesus\' first miracle was turning water into wine.',
  ),
  'sign_2': LoreScene(
    title: 'Sign 2: Healing the Official’s Son',
    intro:
        'A desperate father seeks Jesus for help. See how faith and Jesus’ word bring healing—even from a distance.',
    summary:
        'Jesus heals a royal official’s son by his word, demonstrating his authority and power. What does this teach about faith?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the official?',
        nextSceneKey: 'sign_2_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_3'),
    ],
    recitationSteps: [
      '“Go,” Jesus replied, “your son will live.” The man took Jesus at his word and departed. (John 4:50, NIV)',
      'While he was still on the way, his servants met him with the news that his boy was living. (John 4:51, NIV)',
      'So he asked them what time the boy had begun to get better. They said to him, “Yesterday, at one in the afternoon, the fever left him.” (John 4:52, NIV)',
      'Then the father realized that this was the exact time at which Jesus had said to him, “Your son will live.” (John 4:53, NIV)',
      'So he and his whole household believed. (John 4:53, NIV)',
    ],
  ),
  'sign_2_quiz': LoreScene(
    title: 'Quiz: The Official\'s Son',
    intro: 'What did Jesus say to the official?',
    summary: 'Test your knowledge of the second sign.',
    choices: [
      LoreChoice(label: '\"Your son will live\"', nextSceneKey: 'sign_3'),
      LoreChoice(label: '\"Go away\"', nextSceneKey: 'sign_2_quiz_fail'),
      LoreChoice(label: '\"Wait here\"', nextSceneKey: 'sign_2_quiz_fail'),
    ],
    hint: 'Jesus spoke words of life.',
  ),
  'sign_2_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus said, "Your son will live."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_2_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_3'),
    ],
    hint: 'Jesus said, "Your son will live."',
  ),
  'sign_3': LoreScene(
    title: 'Sign 3: Healing at Bethesda',
    intro:
        'By the pool of Bethesda, a man waits for healing. Jesus approaches and changes his life forever.',
    summary:
        'Jesus heals a man at Bethesda, showing his compassion and authority over the Sabbath. What does this teach about mercy?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the man?',
        nextSceneKey: 'sign_3_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_4'),
    ],
    recitationSteps: [
      'One who was there had been an invalid for thirty-eight years. (John 5:5, NIV)',
      'When Jesus saw him lying there and learned that he had been in this condition for a long time, he asked him, “Do you want to get well?” (John 5:6, NIV)',
      '“Get up! Pick up your mat and walk.” (John 5:8, NIV)',
      'At once the man was cured; he picked up his mat and walked. (John 5:9, NIV)',
      'The man who was healed had no idea who it was, for Jesus had slipped away into the crowd that was there. (John 5:13, NIV)',
    ],
  ),
  'sign_3_quiz': LoreScene(
    title: 'Quiz: Bethesda',
    intro: 'What did Jesus say to the man at Bethesda?',
    summary: 'Test your knowledge of the third sign.',
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
    hint: 'Jesus gave a direct command.',
  ),
  'sign_3_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro:
        'That is not correct. Jesus said, "Get up! Pick up your mat and walk."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_3_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_4'),
    ],
    hint: 'Jesus said, "Get up! Pick up your mat and walk."',
  ),
  'sign_4': LoreScene(
    title: 'Sign 4: Feeding the 5,000',
    intro:
        'A huge crowd is hungry, but resources are few. Watch as Jesus provides more than enough for everyone.',
    summary:
        'Jesus feeds five thousand, demonstrating his power to provide and his compassion for the crowd. What does this teach about trust?',
    choices: [
      LoreChoice(
        label: 'How many baskets were left over?',
        nextSceneKey: 'sign_4_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_5'),
    ],
    recitationSteps: [
      'Jesus then took the loaves, gave thanks, and distributed to those who were seated as much as they wanted. (John 6:11, NIV)',
      'He did the same with the fish. They all ate as much as they wanted. (John 6:11, NIV)',
      'When they had all had enough to eat, he said to his disciples, “Gather the pieces that are left over. Let nothing be wasted.” (John 6:12, NIV)',
      'So they gathered them and filled twelve baskets with the pieces of the five barley loaves left over by those who had eaten. (John 6:13, NIV)',
      'After the people saw the sign Jesus performed, they began to say, “Surely this is the Prophet who is to come into the world.” (John 6:14, NIV)',
    ],
  ),
  'sign_4_quiz': LoreScene(
    title: 'Quiz: Feeding the 5,000',
    intro: 'How many baskets of leftovers were collected?',
    summary: 'Test your knowledge of the fourth sign.',
    choices: [
      LoreChoice(label: 'Twelve', nextSceneKey: 'sign_5'),
      LoreChoice(label: 'Seven', nextSceneKey: 'sign_4_quiz_fail'),
      LoreChoice(label: 'None', nextSceneKey: 'sign_4_quiz_fail'),
    ],
    hint: 'There was more than enough.',
  ),
  'sign_4_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. There were twelve baskets left over.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_4_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_5'),
    ],
    hint: 'Twelve baskets were left over.',
  ),
  'sign_5': LoreScene(
    title: 'Sign 5: Walking on Water',
    intro:
        'The disciples are caught in a storm on the lake. Jesus comes to them in a way that defies nature itself.',
    summary:
        'Jesus walks on water, revealing his divine authority over nature and calming his disciples’ fears. What does this teach about courage?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say to the disciples?',
        nextSceneKey: 'sign_5_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_6'),
    ],
    recitationSteps: [
      'When they had rowed about three or four miles, they saw Jesus approaching the boat, walking on the water; and they were frightened. (John 6:19, NIV)',
      'But he said to them, “It is I; don’t be afraid.” (John 6:20, NIV)',
      'Then they were willing to take him into the boat, and immediately the boat reached the shore where they were heading. (John 6:21, NIV)',
    ],
  ),
  'sign_5_quiz': LoreScene(
    title: 'Quiz: Walking on Water',
    intro: 'What did Jesus say to his frightened disciples?',
    summary: 'Test your knowledge of the fifth sign.',
    choices: [
      LoreChoice(label: 'It is I; don\'t be afraid.', nextSceneKey: 'sign_6'),
      LoreChoice(
        label: 'Why are you afraid?',
        nextSceneKey: 'sign_5_quiz_fail',
      ),
      LoreChoice(label: 'Go back to shore.', nextSceneKey: 'sign_5_quiz_fail'),
    ],
    hint: 'Jesus reassured them.',
  ),
  'sign_5_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus said, "It is I; don\'t be afraid."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_5_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_6'),
    ],
    hint: 'Jesus said, "It is I; don\'t be afraid."',
  ),
  'sign_6': LoreScene(
    title: 'Sign 6: Healing the Man Born Blind',
    intro:
        'A man born blind encounters Jesus. This meeting will change his life and reveal who Jesus truly is.',
    summary:
        'Jesus heals a man born blind, showing that he is the light of the world. What does this teach about spiritual sight?',
    choices: [
      LoreChoice(
        label: 'What did Jesus use to heal the man?',
        nextSceneKey: 'sign_6_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_7'),
    ],
    recitationSteps: [
      'As he went along, he saw a man blind from birth. (John 9:1, NIV)',
      'His disciples asked him, “Rabbi, who sinned, this man or his parents, that he was born blind?” (John 9:2, NIV)',
      '“Neither this man nor his parents sinned,” said Jesus, “but this happened so that the works of God might be displayed in him. (John 9:3, NIV)',
      'He spit on the ground, made some mud with the saliva, and put it on the man’s eyes. (John 9:6, NIV)',
      '“Go,” he told him, “wash in the Pool of Siloam” (this word means Sent). So the man went and washed, and came home seeing. (John 9:7, NIV)',
      'His neighbors and those who had formerly seen him begging asked, “Isn’t this the same man who used to sit and beg?” (John 9:8, NIV)',
      'Some claimed that he was. Others said, “No, he only looks like him.” But he himself insisted, “I am the man.” (John 9:9, NIV)',
    ],
  ),
  'sign_6_quiz': LoreScene(
    title: 'Quiz: Man Born Blind',
    intro: 'What did Jesus use to heal the man born blind?',
    summary: 'Test your knowledge of the sixth sign.',
    choices: [
      LoreChoice(label: 'Mud made with saliva', nextSceneKey: 'sign_7'),
      LoreChoice(label: 'Olive oil', nextSceneKey: 'sign_6_quiz_fail'),
      LoreChoice(label: 'River water', nextSceneKey: 'sign_6_quiz_fail'),
    ],
    hint: 'Jesus made something with his hands.',
  ),
  'sign_6_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus used mud made with saliva.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'sign_6_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'sign_7'),
    ],
    hint: 'Jesus used mud made with saliva.',
  ),
  'sign_7': LoreScene(
    title: 'Sign 7: Raising Lazarus',
    intro:
        'Lazarus has died, and his family mourns. Jesus arrives and demonstrates his power over death itself.',
    summary:
        'Jesus raises Lazarus from the dead, revealing his power over life and death. What does this teach about hope?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say before raising Lazarus?',
        nextSceneKey: 'sign_7_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'last_supper'),
    ],
    recitationSteps: [
      'Now a man named Lazarus was sick. He was from Bethany, the village of Mary and her sister Martha. (John 11:1, NIV)',
      'So the sisters sent word to Jesus, “Lord, the one you love is sick.” (John 11:3, NIV)',
      'When he heard this, Jesus said, “This sickness will not end in death. No, it is for God’s glory so that God’s Son may be glorified through it.” (John 11:4, NIV)',
      'Jesus loved Martha and her sister and Lazarus. (John 11:5, NIV)',
      'Yet when he heard that Lazarus was sick, he stayed where he was two more days. (John 11:6, NIV)',
      'Then he said to his disciples, “Let us go back to Judea.” (John 11:7, NIV)',
      '“But Rabbi,” they said, “a short while ago the Jews there tried to stone you, and yet you are going back?” (John 11:8, NIV)',
      'Jesus answered, “Are there not twelve hours of daylight? Anyone who walks in the daytime will not stumble, for they see by this world’s light. (John 11:9, NIV)',
      'It is when a person walks at night that they stumble, for they have no light.” (John 11:10, NIV)',
      'After he had said this, he went on to tell them, “Our friend Lazarus has fallen asleep; but I am going there to wake him up.” (John 11:11, NIV)',
      'His disciples replied, “Lord, if he sleeps, he will get better.” (John 11:12, NIV)',
      'Jesus had been speaking of his death, but his disciples thought he meant natural sleep. (John 11:13, NIV)',
      'So then he told them plainly, “Lazarus is dead, and for your sake I am glad I was not there, so that you may believe. But let us go to him.” (John 11:14-15, NIV)',
      'Then Thomas (also known as Didymus) said to the rest of the disciples, “Let us also go, that we may die with him.” (John 11:16, NIV)',
      'On his arrival, Jesus found that Lazarus had already been in the tomb for four days. (John 11:17, NIV)',
      'Bethany was less than two miles from Jerusalem, (John 11:18, NIV)',
      'and many Jews had come to Martha and Mary to comfort them in the loss of their brother. (John 11:19, NIV)',
      'When Martha heard that Jesus was coming, she went out to meet him, but Mary stayed at home. (John 11:20, NIV)',
      '“Lord,” Martha said to Jesus, “if you had been here, my brother would not have died. (John 11:21, NIV)',
      'But I know that even now God will give you whatever you ask.” (John 11:22, NIV)',
      'Jesus said to her, “Your brother will rise again.” (John 11:23, NIV)',
      'Martha answered, “I know he will rise again in the resurrection at the last day.” (John 11:24, NIV)',
      'Jesus said to her, “I am the resurrection and the life. The one who believes in me will live, even though they die; (John 11:25, NIV)',
      'and whoever lives by believing in me will never die. Do you believe this?” (John 11:26, NIV)',
      '“Yes, Lord," she replied, "I believe that you are the Messiah, the Son of God, who is to come into the world.” (John 11:27, NIV)',
      'After she had said this, she went back and called her sister Mary aside. “The Teacher is here,” she said, “and is asking for you.” (John 11:28, NIV)',
      'When Mary heard this, she got up quickly and went to him. (John 11:29, NIV)',
      'Now Jesus had not yet entered the village, but was still at the place where Martha had met him. (John 11:30, NIV)',
      'When the Jews who had been with Mary in the house, comforting her, noticed how quickly she got up and went out, they followed her, supposing she was going to the tomb to mourn there. (John 11:31, NIV)',
      'When Mary reached the place where Jesus was and saw him, she fell at his feet and said, “Lord, if you had been here, my brother would not have died.” (John 11:32, NIV)',
      'When Jesus saw her weeping, and the Jews who had come along with her also weeping, he was deeply moved in spirit and troubled. (John 11:33, NIV)',
      '“Where have you laid him?” he asked. “Come and see, Lord," they replied. (John 11:34, NIV)',
      'Jesus wept. (John 11:35, NIV)',
      'Then the Jews said, “See how he loved him!” (John 11:36, NIV)',
      'But some of them said, “Could not he who opened the eyes of the blind man have kept this man from dying?” (John 11:37, NIV)',
      'Jesus, once more deeply moved, came to the tomb. It was a cave with a stone laid across the entrance. (John 11:38, NIV)',
      '“Take away the stone,” he said. (John 11:39, NIV)',
      '“But, Lord," said Martha, "by this time there is a bad odor, for he has been there four days.” (John 11:39, NIV)',
      'Then Jesus said, “Did I not tell you that if you believe, you will see the glory of God?” (John 11:40, NIV)',
      'So they took away the stone. Then Jesus looked up and said, “Father, I thank you that you have heard me. (John 11:41, NIV)',
      'I knew that you always hear me, but I said this for the benefit of the people standing here, that they may believe that you sent me.” (John 11:42, NIV)',
      'When he had said this, Jesus called in a loud voice, “Lazarus, come out!” (John 11:43, NIV)',
      'The dead man came out, his hands and feet wrapped with strips of linen, and a cloth around his face. (John 11:44, NIV)',
      'Jesus said to them, “Take off the grave clothes and let him go.” (John 11:44, NIV)',
      'Therefore many of the Jews who had come to visit Mary, and had seen what Jesus did, believed in him. (John 11:45, NIV)',
    ],
  ),
  // Book of Glory
  'last_supper': LoreScene(
    title: 'The Last Supper',
    intro:
        'On the night before his death, Jesus gathers with his disciples for a final meal and a lesson in humility.',
    summary:
        'At the Last Supper, Jesus demonstrates servant leadership and commands his disciples to love one another. What does it mean to serve others?',
    choices: [
      LoreChoice(
        label: 'What did Jesus do for his disciples?',
        nextSceneKey: 'last_supper_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'farewell_discourses'),
    ],
    recitationSteps: [
      'Now that I, your Lord and Teacher, have washed your feet, you also should wash one another’s feet. (John 13:14, NIV)',
      'A new command I give you: Love one another. As I have loved you, so you must love one another. (John 13:34, NIV)',
    ],
  ),
  'last_supper_quiz': LoreScene(
    title: 'Quiz: The Last Supper',
    intro: 'What act of service did Jesus perform for his disciples?',
    summary: 'Test your knowledge of the Last Supper.',
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
    hint: 'It involved water and humility.',
  ),
  'last_supper_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus washed their feet.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'last_supper_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'farewell_discourses'),
    ],
    hint: 'Jesus washed the disciples\' feet.',
  ),
  'farewell_discourses': LoreScene(
    title: 'Farewell Discourses',
    intro:
        'Jesus prepares his disciples for what is to come, offering comfort, hope, and a promise of the Holy Spirit.',
    summary:
        'Jesus comforts his disciples, promises the Holy Spirit, and prays for all believers. What does this teach about comfort and faith?',
    choices: [
      LoreChoice(
        label: 'What did Jesus promise his followers?',
        nextSceneKey: 'farewell_discourses_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'passion'),
    ],
    recitationSteps: [
      'And I will ask the Father, and he will give you another advocate to help you and be with you forever—the Spirit of truth. (John 14:16-17, NIV)',
      'My prayer is not for them alone. I pray also for those who will believe in me through their message. (John 17:20, NIV)',
    ],
  ),
  'farewell_discourses_quiz': LoreScene(
    title: 'Quiz: Farewell Discourses',
    intro: 'What did Jesus promise to send to his followers?',
    summary: 'Test your knowledge of the Farewell Discourses.',
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
    hint: 'Jesus called him the Advocate.',
  ),
  'farewell_discourses_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus promised the Holy Spirit.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'farewell_discourses_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'passion'),
    ],
    hint: 'Jesus promised the Holy Spirit.',
  ),
  'passion': LoreScene(
    title: 'The Passion',
    intro:
        'Jesus faces betrayal, suffering, and death, fulfilling his mission to save the world.',
    summary:
        'Jesus willingly suffers, is crucified, and is buried to fulfill God’s plan of salvation. What does this teach about sacrifice?',
    choices: [
      LoreChoice(
        label: 'What did Jesus say on the cross?',
        nextSceneKey: 'passion_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'resurrection'),
    ],
    recitationSteps: [
      'So the soldiers took charge of Jesus. Carrying his own cross, he went out to the place of the Skull. (John 19:16-17, NIV)',
      'When he had received the drink, Jesus said, “It is finished.” With that, he bowed his head and gave up his spirit. (John 19:30, NIV)',
    ],
  ),
  'passion_quiz': LoreScene(
    title: 'Quiz: The Passion',
    intro: 'What were Jesus\' last words on the cross?',
    summary: 'Test your knowledge of the Passion.',
    choices: [
      LoreChoice(label: 'It is finished.', nextSceneKey: 'resurrection'),
      LoreChoice(label: 'I am thirsty.', nextSceneKey: 'passion_quiz_fail'),
      LoreChoice(
        label: 'Father, forgive them.',
        nextSceneKey: 'passion_quiz_fail',
      ),
    ],
    hint: 'It marked the completion of his mission.',
  ),
  'passion_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Jesus said, "It is finished."',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'passion_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'resurrection'),
    ],
    hint: 'Jesus said, "It is finished."',
  ),
  'resurrection': LoreScene(
    title: 'The Resurrection',
    intro:
        'The tomb is empty! Jesus is alive, and his followers encounter the risen Lord.',
    summary:
        'Jesus rises from the dead, appearing to Mary Magdalene and his disciples, bringing hope and new life. What does this teach about victory and new beginnings?',
    choices: [
      LoreChoice(
        label: 'Who did Jesus appear to first?',
        nextSceneKey: 'resurrection_quiz',
      ),
      LoreChoice(label: 'Continue', nextSceneKey: 'epilogue'),
    ],
    recitationSteps: [
      'He is not here; he has risen! (John 20:13, NIV)',
      'Jesus said, “Peace be with you! As the Father has sent me, I am sending you.” (John 20:21, NIV)',
    ],
  ),
  'resurrection_quiz': LoreScene(
    title: 'Quiz: The Resurrection',
    intro: 'Who was the first to see the risen Jesus?',
    summary: 'Test your knowledge of the Resurrection.',
    choices: [
      LoreChoice(label: 'Mary Magdalene', nextSceneKey: 'epilogue'),
      LoreChoice(label: 'Peter', nextSceneKey: 'resurrection_quiz_fail'),
      LoreChoice(label: 'John', nextSceneKey: 'resurrection_quiz_fail'),
    ],
    hint: 'She went to the tomb early in the morning.',
  ),
  'resurrection_quiz_fail': LoreScene(
    title: 'Incorrect',
    intro: 'That is not correct. Mary Magdalene saw Jesus first.',
    choices: [
      LoreChoice(label: 'Try again', nextSceneKey: 'resurrection_quiz'),
      LoreChoice(label: 'Continue', nextSceneKey: 'epilogue'),
    ],
    hint: 'Mary Magdalene was the first to see the risen Jesus.',
  ),
  'epilogue': LoreScene(
    title: 'Epilogue: By the Sea',
    intro:
        'After his resurrection, Jesus appears to his disciples by the sea and restores Peter’s calling.',
    summary:
        'Jesus restores Peter and calls his disciples to follow him and care for his people. What does it mean to follow Jesus today?',
    choices: [
      LoreChoice(
        label: 'Reflect: What does it mean to follow?',
        nextSceneKey: null,
      ),
      LoreChoice(label: 'Finish', nextSceneKey: null),
    ],
    recitationSteps: [
      'Jesus said, “Simon son of John, do you love me?” ... “Feed my sheep.” (John 21:17, NIV)',
      'Then he said to him, “Follow me!” (John 21:19, NIV)',
    ],
  ),
};
