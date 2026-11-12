
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answerSubmitted = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which plant is known as a money plant?',
      'options': [
        'Rose',
        'Epipremnum aureum',
        'Sunflower',
        'Tulip',
      ],
      'answer': 1,
    },
    {
      'question': 'Which part of a plant absorbs water?',
      'options': [
        'Leaves',
        'Flowers',
        'Roots',
        'Fruits',
      ],
      'answer': 2,
    },
    {
      'question': 'Which animal is known as the King of the Jungle?',
      'options': [
        'Tiger',
        'Elephant',
        'Lion',
        'Deer',
      ],
      'answer': 2,
    },
    {
      'question': 'Which animal is the largest mammal?',
      'options': [
        'Blue Whale',
        'Shark',
        'Giraffe',
        'Elephant',
      ],
      'answer': 0,
    },
    {
      'question': 'Which gas do plants absorb from the air?',
      'options': [
        'Oxygen',
        'Carbon Dioxide',
        'Nitrogen',
        'Hydrogen',
      ],
      'answer': 1,
    },
    {
      'question': 'Which animal can change its skin color?',
      'options': [
        'Rabbit',
        'Camel',
        'Chameleon',
        'Horse',
      ],
      'answer': 2,
    },
    {
      'question': 'Which plant part makes food?',
      'options': [
        'Root',
        'Leaf',
        'Stem',
        'Flower',
      ],
      'answer': 1,
    },
    {
      'question': 'What is a baby frog called?',
      'options': [
        'Cub',
        'Calf',
        'Tadpole',
        'Chick',
      ],
      'answer': 2,
    },
    {
      'question': 'Which plant is famous for its beautiful red flower?',
      'options': [
        'Rose',
        'Cactus',
        'Fern',
        'Moss',
      ],
      'answer': 0,
    },
    {
      'question': 'Which animal is known for its long neck?',
      'options': [
        'Zebra',
        'Giraffe',
        'Lion',
        'Monkey',
      ],
      'answer': 1,
    },
  ];

  void selectAnswer(int index) {
    if (answerSubmitted) return;

    setState(() {
      selectedAnswer = index;
      answerSubmitted = true;

      if (index == questions[currentQuestion]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
        selectedAnswer = null;
        answerSubmitted = false;
      } else {
        currentQuestion = questions.length;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answerSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool quizCompleted = currentQuestion >= questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Quiz'),
        backgroundColor: const Color(0xFF347A45),
        foregroundColor: Colors.white,
      ),

      body: quizCompleted
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events,
                size: 100,
                color: Colors.orange,
              ),
              const SizedBox(height: 20),

              const Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                'Your Score: $score / ${questions.length}',
                style: const TextStyle(
                  fontSize: 23,
                  color: Color(0xFF347A45),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                score >= 8
                    ? 'Excellent! Great Job!'
                    : score >= 5
                    ? 'Good Try! Keep Learning!'
                    : 'Keep Practicing!',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF347A45),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestion + 1} of ${questions.length}',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF347A45),
              ),
            ),

            const SizedBox(height: 12),

            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xFF347A45),
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 35),

            Text(
              questions[currentQuestion]['question'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ...List.generate(4, (index) {
              final options =
              questions[currentQuestion]['options'];

              final correctAnswer =
              questions[currentQuestion]['answer'];

              Color optionColor = Theme.of(context).cardColor;

              if (answerSubmitted) {
                if (index == correctAnswer) {
                  optionColor = Colors.green.withOpacity(0.2);
                } else if (index == selectedAnswer) {
                  optionColor = Colors.red.withOpacity(0.2);
                }
              }

              return Card(
                color: optionColor,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: answerSubmitted &&
                        (index == correctAnswer ||
                            index == selectedAnswer)
                        ? index == correctAnswer
                        ? Colors.green
                        : Colors.red
                        : Colors.grey.shade300,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    options[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: answerSubmitted &&
                      index == correctAnswer
                      ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                      : answerSubmitted &&
                      index == selectedAnswer
                      ? const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )
                      : null,
                  onTap: () => selectAnswer(index),
                ),
              );
            }),

            const Spacer(),

            if (answerSubmitted)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  selectedAnswer ==
                      questions[currentQuestion]['answer']
                      ? 'Correct Answer! Well Done!'
                      : 'Wrong Answer! Try the next question.',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: selectedAnswer ==
                        questions[currentQuestion]['answer']
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                answerSubmitted ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF347A45),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  currentQuestion == questions.length - 1
                      ? 'Finish Quiz'
                      : 'Next Question',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
