import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioP = AudioPlayer();

class thirdLevel extends StatefulWidget {
  @override
  _LetterGameState createState() => _LetterGameState();
}

class _LetterGameState extends State<thirdLevel> {

  List<String> letters = [
    'أ', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'
  ];

  String currentLetter = '';
  List<String> options = [];
  String feedbackMessage = '';
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  bool showCorrect = false;
  bool showWrong = false;
  String selectedAnswer = '';

  @override
  void initState() {
    super.initState();
    getNextLetter();
  }

  void getNextLetter() {
    if (questionIndex < letters.length) {
      setState(() {
        showCorrect = false;
        showWrong = false;
        selectedAnswer = '';
        options.clear();
        currentLetter = letters[questionIndex];
        options.add(currentLetter);
        while (options.length < 4) {
          String randomLetter = letters[Random().nextInt(letters.length)];
          if (!options.contains(randomLetter)) {
            options.add(randomLetter);
          }
        }
        options.shuffle();
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctAnswers: correctAnswers,
            wrongAnswers: wrongAnswers,
          ),
        ),
      );
    }
  }

  void checkAnswer(String selectedLetter) {
    setState(() {
      selectedAnswer = selectedLetter;
    });

    if (selectedLetter == currentLetter) {
      setState(() {
        showCorrect = true;
        feedbackMessage = 'أحسنت إجابة صحيحة';
        correctAnswers++;
        audioP.play(AssetSource('correct.mp3'),); // تشغيل صوت الإجابة الصحيحة
      });
    } else {
      setState(() {
        showWrong = true;
        feedbackMessage = 'خطأ!';
        wrongAnswers++;
        audioP.play(AssetSource('wrong.mp3'),);  // تشغيل صوت الإجابة الخاطئة
      });

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          showWrong = false;
          options.remove(selectedLetter);
        });
      });
    }

    if (selectedLetter == currentLetter) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          feedbackMessage = '';
          showCorrect = false;
          questionIndex++;
          getNextLetter();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double buttonSize = min(screenSize.width * 0.15, screenSize.height * 0.15);
    double fontSize = min(screenSize.width * 0.05, screenSize.height * 0.05);

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              currentLetter,
              style: const TextStyle(fontSize: 170, fontFamily: 'Amiri', color:Color.fromRGBO(64, 123, 255, 1), ),
            ),
            const SizedBox(height: 70),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: showCorrect || showWrong ? null : () => checkAnswer(option),
                      child:  Padding(
                        padding:  EdgeInsets.all(8),
                        child: Text(
                          option,
                          style: TextStyle(fontSize: fontSize, color: Colors.white, ),
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (showCorrect && option == currentLetter)
                              return Colors.green;
                            else if (showWrong && option == selectedAnswer)
                              return Colors.red;
                            else
                              return Color.fromRGBO(64, 123, 255, 1);
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              feedbackMessage,
              style: TextStyle(fontSize: 20, color: feedbackMessage.contains('أحسنت') ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الأسئلة الصحيحة: $correctAnswers',
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                ),
                const SizedBox(width: 20),
                Text(
                  'الأخطاء: $wrongAnswers',
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;

  ResultScreen({required this.correctAnswers, required this.wrongAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتيجة الاختبار'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'عدد الأسئلة: 28',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'الأسئلة الصحيحة: $correctAnswers',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Text(
              'الأخطاء: $wrongAnswers',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
