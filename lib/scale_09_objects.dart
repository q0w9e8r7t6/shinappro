import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 운동 습관 척도 / 하위요인에 따라 다름
 * 운동 의도 / 5점 리커트   1 ~ 3
 * 운동 습관 / 7점 리커트   4 ~ 8
* 운동 행동 / 5점 리커트    9 ~ 12
 */

final List<String> questions = [
  "1. 나는 앞으로 운동을 계속 하겠다.",
  "2. 나는 운동에 참여할 의사가 있다.",
  "3. 나는 운동에 참여할 계획이다.",
  "4. 습관적으로 하는 운동이다.",
  "5. 자동적으로 하는 운동이다.",
  "6. 저절로 하게 되는 운동이다.",
  "7. 일상적인 운동이다.",
  "8. 오랫동안 해 온 운동이다.",
  "9. 가능한 열심히 했다.",
  "10. 가능한 꾸준히 했다.",
  "11. 가능한 지속적으로 했다.",
  "12. 가능한 많이 했다.",
];

final List<String> questionsIdentifier = [
  "scale_8_1",
  "scale_8_2",
  "scale_8_3",
  "scale_8_4",
  "scale_8_5",
  "scale_8_6",
  "scale_8_7",
  "scale_8_8",
  "scale_8_9",
  "scale_8_10",
  "scale_8_11",
  "scale_8_12",
];

/**
 * 선택지별 key 값 설정
 */

// Using keys for translation example
final images1to5 = [
  RPImageChoice(
    imageUrl: 'assets/image/scale_1.png',
    value: 1,
    description: '전혀 그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_2.png',
    value: 2,
    description: '그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '보통이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
    description: '그렇다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_5.png',
    value: 5,
    description: '매우 그렇다.',
  ),
];

final images1to7 = [
  RPImageChoice(
    imageUrl: 'assets/image/scale_1.png',
    value: 1,
    description: '전혀 그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_2.png',
    value: 2,
    description: '그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '그렇지 않은 편이다..',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
    description: '보통이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_5.png',
    value: 5,
    description: '그런 편이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_6.png',
    value: 6,
    description: '그렇다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_7.png',
    value: 7,
    description: '매우 그렇다.',
  ),
];

/**
 * 질문 포맷 설정
 */
final imageChoiceAnswerFormat1to5 = RPImageChoiceAnswerFormat(choices: images1to5);
final imageChoiceAnswerFormat1to7 = RPImageChoiceAnswerFormat(choices: images1to7);

/**
 * 질문 순서 결정
 */

final linearSurveyTask = RPOrderedTask(
  identifier: "@@척도",
  steps: [
    instructionStep,
    qusetsionStep[0],
    qusetsionStep[1],
    qusetsionStep[2],
    qusetsionStep[3],
    qusetsionStep[4],
    qusetsionStep[5],
    qusetsionStep[6],
    qusetsionStep[7],
    qusetsionStep[8],
    qusetsionStep[9],
    qusetsionStep[10],
    qusetsionStep[11],
    completionStep
  ],
);

// C:\Users\방승민\AppData\Local\Pub\Cache\hosted\pub.dev\research_package-1.4.0\lib\src\ui\QuestionBody\RPUIImageChoiceQuestionBody.dart
// 위의 경로로 가면 기본 메세지 "자신에게 해당하는 .." 을 수정할 수 있다.
final imageChoiceQuestionStep1to5 = RPQuestionStep(
  identifier: "imageStepID",
  title: "Indicate you mood by selecting a picture!",
  answerFormat: imageChoiceAnswerFormat1to5,
);

final imageChoiceQuestionStep1to7 = RPQuestionStep(
  identifier: "imageStepID",
  title: "Indicate you mood by selecting a picture!",
  answerFormat: imageChoiceAnswerFormat1to7,
);

final List<RPQuestionStep> qusetsionStep = [
  RPQuestionStep(
      identifier: questionsIdentifier[0],
      title: questions[0],
      answerFormat: imageChoiceAnswerFormat1to5),
  RPQuestionStep(
      identifier: questionsIdentifier[1],
      title: questions[1],
      answerFormat: imageChoiceAnswerFormat1to5),
  RPQuestionStep(
      identifier: questionsIdentifier[2],
      title: questions[2],
      answerFormat: imageChoiceAnswerFormat1to5),
  RPQuestionStep(
      identifier: questionsIdentifier[3],
      title: questions[3],
      answerFormat: imageChoiceAnswerFormat1to7),
  RPQuestionStep(
      identifier: questionsIdentifier[4],
      title: questions[4],
      answerFormat: imageChoiceAnswerFormat1to7),
  RPQuestionStep(
      identifier: questionsIdentifier[5],
      title: questions[5],
      answerFormat: imageChoiceAnswerFormat1to7),
  RPQuestionStep(
      identifier: questionsIdentifier[6],
      title: questions[6],
      answerFormat: imageChoiceAnswerFormat1to7),
  RPQuestionStep(
      identifier: questionsIdentifier[7],
      title: questions[7],
      answerFormat: imageChoiceAnswerFormat1to7),
  RPQuestionStep(
      identifier: questionsIdentifier[8],
      title: questions[8],
      answerFormat: imageChoiceAnswerFormat1to5),
  RPQuestionStep(
      identifier: questionsIdentifier[9],
      title: questions[9],
      answerFormat: imageChoiceAnswerFormat1to5),
  RPQuestionStep(
      identifier: questionsIdentifier[10],
      title: questions[10],
      answerFormat: imageChoiceAnswerFormat1to5),
  RPQuestionStep(
      identifier: questionsIdentifier[11],
      title: questions[11],
      answerFormat: imageChoiceAnswerFormat1to5),
];

final completionStep = RPCompletionStep(
    identifier: "completionID",
    title: "Finished",
    text: "Thank you for filling out the survey!");

final instructionStep = RPInstructionStep(
    identifier: "instructionID",
    title: "Welcome!",
    detailText: null,
    text:
        "해당 설문은 [운동 습관]에 대한 척도 입니다.\n다음 질문을 잘 읽고, 운동에 대한 여러분의 생각에 가장 근접한 숫자에 표시해주세요.");
