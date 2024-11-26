import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle_quiz_app/constants.dart';
import 'package:quizzle_quiz_app/controllers/question_controller.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                const Text(
                  'Your Score',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                const Spacer(),
                Text(
                  '${score * 10} / ${_qnController.questions.length * 10}',
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
