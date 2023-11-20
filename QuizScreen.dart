import 'dart:math';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  SharedPreferences? sharedPreferences;
  int highestScore = 0;
  int quizNumber = 1;
  int questionIndex = 0;
  int score = 0;
  bool isAnswered = false;

  int quizTimeInSeconds = 60; // 15 minutes in seconds
  int remainingMinutes = 15 * 60; // Initially set to quiz time

  List<String> questions = [
    'What is the capital of Bangladesh?',
    'In which year did Bangladesh gain independence?',
    'Which river is the longest in Bangladesh?',
    'What is the national currency of Bangladesh?',
    'Who is the founding father of Bangladesh?',
    'Which famous mangrove forest is located in Bangladesh?',
    'What is the official language of Bangladesh?',
    'Which festival is widely celebrated during the Bengali New Year?',
    'What is the highest peak in Bangladesh?',
    'Which is the national flower of Bangladesh?',
    'Who is the current Prime Minister of Bangladesh?',
    'Which UNESCO World Heritage Site is located in Bangladesh?',
    'What is the main staple food in Bangladesh?',
    'Which famous filmmaker from Bangladesh won the Palme d\'Or at Cannes Film Festival?',
    'What is the largest city in Bangladesh?',
    'Which famous river delta is formed in Bangladesh?',
    'What is the traditional attire for men in Bangladesh?',
    'Which Bangladeshi cricket player is known as the "Tiger of Bangladesh"?',
    'In which year did Bangladesh become a member of the United Nations?',
    'What is the popular traditional boat race in Bangladesh called?',
  ];

  List<List<String>> options = [
    ['Dhaka City', 'Chittagong', 'Khulna', 'Rajshahi'],
    ['1970', '1971', '1972', '1973'],
    ['Padma', 'Jamuna', 'Meghna', 'Rupnarayan'],
    ['Taka', 'Rupee', 'Ringgit', 'Dollar'],
    [
      'Sheikh Mujibur Rahman',
      'Ziaur Rahman',
      'Abdul Hamid Khan Bhashani',
      'Allama Iqbal'
    ],
    ['Sundarbans', 'Amazon Rainforest', 'Everglades', 'Great Barrier Reef'],
    ['Bengali', 'Hindi', 'Urdu', 'English'],
    ['Durga Puja', 'Eid ul-Fitr', 'Pohela Boishakh', 'Diwali'],
    ['Tahjindong', 'Mowdok Mual', 'Keokradong', 'Saka Haphong'],
    ['Rose', 'Water Lily', 'Orchid', 'Daisy'],
    ['Sheikh Hasina', 'Khaleda Zia', 'Hussain Muhammad Ershad', 'Abdul Hamid'],
    [
      'Historic Mosque City of Bagerhat',
      'Dahaka National Mosque',
      'Ruins of the Buddhist Vihara at Paharpur',
      'Historic Mosque City of Dhaka'
    ],
    ['Rice', 'Wheat', 'Maize', 'Barley'],
    ['Satyajit Ray', 'Ritwik Ghatak', 'Tareque Masud', 'Mira Nair'],
    ['Dhaka', 'Chittagong', 'Khulna', 'Rajshahi'],
    ['Ganges Delta', 'Amazon Delta', 'Nile Delta', 'Mississippi Delta'],
    ['Sari', 'Sherwani', 'Panjabi', 'Dhoti'],
    ['Shakib Al Hasan', 'Tamim Iqbal', 'Mushfiqur Rahim', 'Mashrafe Mortaza'],
    ['1972', '1974', '1976', '1980'],
    ['Nauka Bais', 'Kabaddi', 'Bihu', 'Baishakhi Mela'],
  ];

  List<String> correctAnswers = [
    'Dhaka City',
    '1971',
    'Jamuna',
    'Taka',
    'Sheikh Mujibur Rahman',
    'Sundarbans',
    'Bengali',
    'Pohela Boishakh',
    'Tahjindong',
    'Water Lily',
    'Sheikh Hasina',
    'Historic Mosque City of Bagerhat',
    'Rice',
    'Satyajit Ray',
    'Dhaka',
    'Ganges Delta',
    'Panjabi',
    'Shakib Al Hasan',
    '1974',
    'Nauka Bais',
  ];

  List<String> selectedAnswers = [];

  void shuffleQuestionsAndOptions() {
    final random = Random();
    for (var i = questions.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);

      // Swap questions
      final tempQuestion = questions[i];
      questions[i] = questions[j];
      questions[j] = tempQuestion;

      // Swap options
      final tempOptions = options[i];
      options[i] = options[j];
      options[j] = tempOptions;

      // Swap correct answers
      final tempAnswer = correctAnswers[i];
      correctAnswers[i] = correctAnswers[j];
      correctAnswers[j] = tempAnswer;
    }
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
    shuffleQuestionsAndOptions();
    startQuizTimer();
  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      highestScore = sharedPreferences?.getInt('highestScore') ?? 0;
    });
  }

  void updateHighestScore() async {
    final currentScore = await sharedPreferences?.getInt('highestScore');
    if (currentScore != null) {
      if (score > currentScore) {
        await sharedPreferences?.setInt('highestScore', score);
        setState(() {
          highestScore = score;
        });
      }
    } else {
      await sharedPreferences?.setInt('highestScore', score);
      setState(() {
        highestScore = score;
      });
    }
  }

  void checkAnswer(String selectedOption) {
    if (isAnswered) {
      return; // Prevent multiple answer selections
    }

    String correctAnswer = correctAnswers[questionIndex];
    bool isCorrect = selectedOption == correctAnswer;

    setState(() {
      selectedAnswers.add(selectedOption);
      isAnswered = true;

      if (isCorrect) {
        score++;
        sharedPreferences?.setInt('highestScore', score);
      }
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (questionIndex < questions.length - 1) {
          questionIndex++;
          isAnswered = false;
          remainingMinutes =
              quizTimeInSeconds; // Reset timer for the next question
        } else {
          // Quiz completed, perform any desired actions
          remainingMinutes = quizTimeInSeconds; // Reset timer for the next quiz
          shuffleQuestionsAndOptions(); // Shuffle questions and options for the next quiz
        }
      });
    });
  }

  void startQuizTimer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (remainingMinutes > 0) {
          remainingMinutes--;
          startQuizTimer(); // Recursively call to update the timer
        } else {
          // Time's up, perform any desired actions here
          remainingMinutes =
              quizTimeInSeconds; // Reset the timer for the next quiz
          shuffleQuestionsAndOptions(); // Shuffle questions and options for the next quiz
        }
      });
    });
  }

  void shareScore() {
    String message =
        'I scored $score out of ${questions.length} in the quiz app!';
    Share.share(message);
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers.clear();
      questionIndex = 0;
      quizNumber++;
      score = 0;
      isAnswered = false;
      remainingMinutes = quizTimeInSeconds; // Reset timer for the next quiz
      shuffleQuestionsAndOptions(); // Shuffle questions and options for the next quiz
    });
  }

  void updateHighScore() {
    if (score > highestScore) {
      setState(() {
        highestScore = score;
      });
    }
  }

  String getQuizResult() {
    if (score >= 10) {
      return "Pass";
    } else {
      return "Fail";
    }
  }

  Color getResultColor() {
    if (score >= 10) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    String result = getQuizResult();
    Color resultColor = getResultColor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            255, 245, 8, 166), // Change the app bar color to black
        title: Text('Quiz App'),
      ),
      body: Container(
        color: Color.fromARGB(
            255, 246, 247, 242), // Change the background color to black
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Time Remaining: ${(remainingMinutes ~/ 60)}:${(remainingMinutes % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 9, 236, 39)),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Question ${questionIndex + 1}: ${questions[questionIndex]}',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 252, 11, 51)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options[questionIndex].length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      selectedAnswers.contains(options[questionIndex][index]);
                  bool isCorrect = options[questionIndex][index] ==
                      correctAnswers[questionIndex];
                  bool showCorrectAnswer = isAnswered && isCorrect;

                  Color backgroundColor = Color.fromARGB(0, 203, 28, 28);
                  if (isSelected) {
                    backgroundColor = isCorrect ? Colors.green : Colors.red;
                  } else if (showCorrectAnswer) {
                    backgroundColor = Colors.green;
                  }

                  return GestureDetector(
                    onTap: () {
                      if (!isSelected) {
                        checkAnswer(options[questionIndex][index]);
                      }
                    },
                    child: Container(
                      color: backgroundColor,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            '${String.fromCharCode(65 + index)}.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: const Color.fromARGB(
                                    153, 0, 0, 0) // Increase the font size
                                ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            options[questionIndex][index],
                            style: TextStyle(
                              color: isSelected || showCorrectAnswer
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : Color.fromARGB(153, 0, 0, 0),
                              fontSize: 20, // Increase the font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 8),
            Text(
              'Score: $score / ${questions.length}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 245, 37)),
            ),
            SizedBox(height: 8),
            IconButton(
              icon: Icon(Icons.share, color: Color.fromARGB(255, 8, 8, 8)),
              onPressed: shareScore,
            ),

            SizedBox(height: 0),
            if (selectedAnswers.contains(correctAnswers[questionIndex]))
              Text(
                'Correct Answer: ${correctAnswers[questionIndex]}',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Text(
              'Highest Score: $highestScore',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            // Display result and color signal
            Text(
              'Result: $result',
              style: TextStyle(
                color: resultColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          updateHighScore();
          resetQuiz();
        },
        child: Text('Next Quiz'),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(255, 21, 149, 156),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quiz $quizNumber',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'High Score: $highestScore',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
