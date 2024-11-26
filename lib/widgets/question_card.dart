import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle_quiz_app/constants.dart';
import 'package:quizzle_quiz_app/controllers/question_controller.dart';
import 'package:quizzle_quiz_app/models/Questions.dart';
import 'package:quizzle_quiz_app/widgets/quiz_option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.question,
            style: const TextStyle(
              color: kBackgroundColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => QuizOption(
              text: question.options[index],
              index: index,
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
