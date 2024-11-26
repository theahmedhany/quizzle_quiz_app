import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle_quiz_app/constants.dart';
import 'package:quizzle_quiz_app/controllers/question_controller.dart';

class QuizOption extends StatelessWidget {
  const QuizOption({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (questionController) {
        Color getTheRightColor() {
          if (questionController.isAnswered) {
            if (index == questionController.correctAns) {
              return kGreenColor;
            } else if (index == questionController.selectedAns &&
                questionController.selectedAns !=
                    questionController.correctAns) {
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: getTheRightColor(),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${index + 1}. $text',
                  style: TextStyle(
                    color: getTheRightColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor(), width: 2),
                  ),
                  child: getTheRightColor() == kGrayColor
                      ? null
                      : Icon(
                          getTheRightIcon(),
                          size: 16,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
