import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quizzle_quiz_app/models/Questions.dart';
import 'package:quizzle_quiz_app/views/score_view.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  Animation<double> get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: List<String>.from(question['options']),
          answer: question['answer_index'],
        ),
      )
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = -1;
  int get correctAns => _correctAns;

  int _selectedAns = -1;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      duration: const Duration(seconds: 63),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.05, end: 1).animate(_animationController)
          ..addListener(() {
            update();
          });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    // Debugging prints to ensure values are correct
    print('Correct Answer: $_correctAns');
    print('Selected Answer: $_selectedAns');

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
      print('Correct answers so far: $_numOfCorrectAns');
    }

    _animationController.stop();
    update();

    // Delay before moving to the next question
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value < _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => ScoreView(score: _numOfCorrectAns));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void resetQuiz() {
    _numOfCorrectAns = 0;
    _questionNumber.value = 1;
    _isAnswered = false;
    _pageController.jumpToPage(0);
    _animationController.reset();
    _animationController.forward();
    update();
  }
}
