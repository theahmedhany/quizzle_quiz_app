import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle_quiz_app/constants.dart';
import 'package:quizzle_quiz_app/controllers/question_controller.dart';
import 'package:quizzle_quiz_app/widgets/question_card.dart';
import 'package:quizzle_quiz_app/widgets/quiz_progress_bar.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kDefaultPadding),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: QuizProgressBar(),
                ),
                const SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text:
                            'Question ${_questionController.questionNumber.value}',
                        style: const TextStyle(
                          fontSize: 34,
                          color: kSecondaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: '/${_questionController.questions.length}',
                            style: const TextStyle(
                              fontSize: 28,
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                  color: kSecondaryColor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView.builder(
                    controller: _questionController.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
