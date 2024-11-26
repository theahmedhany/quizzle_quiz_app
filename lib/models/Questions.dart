class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When did Google release Flutter?",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question":
        "What is the key configuration file used when building a Flutter project?",
    "options": ['pubspec.yaml', 'pubspec.xml', 'config.html', 'root.xml'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question":
        "Which programming language is used to build Flutter applications?",
    "options": ['Kotlin', 'Dart', 'Java', 'Go'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "How many types of widgets are there in Flutter?",
    "options": ['2', '4', '6', '8+'],
    "answer_index": 0,
  },
];
