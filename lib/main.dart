import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizResultScreen(
        correctAnswers: 3,
        totalQuestions: 5,
        answers: [true, false, true, true, false], // example answers
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final List<bool> answers;

  QuizResultScreen({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'You got $correctAnswers out of $totalQuestions correct!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      answers[index] ? Icons.check : Icons.close,
                      color: answers[index] ? Colors.green : Colors.red,
                    ),
                    title: Text(
                      'Question ${index + 1}',
                      style: TextStyle(
                        fontSize: 18,
                        color: answers[index] ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => QuizApp()),
                  (route) => false,
                );
              },
              icon: Icon(Icons.restart_alt),
              label: Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
