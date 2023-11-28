import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 지각된 스트레스 / 리커트 5점
 * 부정적 지각 1 2 3 9 10
 * 긍정적 지각 4 5 6 7 8
 */

final List<String> questions = [
  "1. 지난 한 달 동안, 예상치 못한 일이 생겨서 기분 나빠진 적이 얼마나 있었나요?",
  "2. 지난 한 달 동안, 중요한 일들을 통제할 수 없다고 느낀 적은 얼마나 있었나요?",
  "3. 지난 한 달 동안, 초조하거나 스트레스가 쌓인다고 느낀 적은 얼마나 있었나요?",
  "4. 지난 한 달 동안, 짜증나고 성가신 일들을 성공적으로 처리한 적이 얼마나 있었나요?",
  "5. 지난 한 달 동안, 생활 속에서 일어난 중요한 변화들을 효과적으로 대처한 적이 얼마나 있었나요?",
  "6. 지난 한 달 동안, 개인적인 문제를 처리하는 능력에 대해 자신감을 느낀 적은 얼마나 있었나요?",
  "7. 지난 한 달 동안, 자신의 뜻대로 일이 진행된다고 느낀 적은 얼마나 있었나요?",
  "8. 지난 한 달 동안, 매사를 잘 컨트롤하고 있다고 느낀 적이 얼마나 있었나요?",
  "9. 지난 한 달 동안, 당신이 통제할 수 없는 범위에서 발생한 일 때문에 화가 난 적이 얼마나 있었나요?",
  "10. 지난 한 달 동안, 어려운 일이 너무 많이 쌓여서 극복할 수 없다고 느낀 적이 얼마나 있었나요?",
];

final List<String> questionsIdentifier = [
  "scale_2_1",
  "scale_2_2",
  "scale_2_3",
  "scale_2_4",
  "scale_2_5",
  "scale_2_6",
  "scale_2_7",
  "scale_2_8",
  "scale_2_9",
  "scale_2_10",
];

/**
 * 선택지별 key 값 설정
 */

// Using keys for translation example
final images = [
  RPImageChoice(
    imageUrl: 'assets/image/scale_0.png',
    value: 0,
    description: '전혀 아니다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_1.png',
    value: 1,
    description: '거의 아니다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_2.png',
    value: 2,
    description: '보통이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '꽤 자주.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
    description: '매우 자주.',
  ),
];

/**
 * 질문 포맷 설정
 */
final imageChoiceAnswerFormat = RPImageChoiceAnswerFormat(choices: images);

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
    completionStep
  ],
);

// C:\Users\방승민\AppData\Local\Pub\Cache\hosted\pub.dev\research_package-1.4.0\lib\src\ui\QuestionBody\RPUIImageChoiceQuestionBody.dart
// 위의 경로로 가면 기본 메세지 "자신에게 해당하는 .." 을 수정할 수 있다.
final imageChoiceQuestionStep = RPQuestionStep(
  identifier: "imageStepID",
  title: "Indicate you mood by selecting a picture!",
  answerFormat: imageChoiceAnswerFormat,
);

final List<RPQuestionStep> qusetsionStep = [
  RPQuestionStep(
      identifier: questionsIdentifier[0],
      title: questions[0],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[1],
      title: questions[1],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[2],
      title: questions[2],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[3],
      title: questions[3],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[4],
      title: questions[4],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[5],
      title: questions[5],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[6],
      title: questions[6],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[7],
      title: questions[7],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[8],
      title: questions[8],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[9],
      title: questions[9],
      answerFormat: imageChoiceAnswerFormat),
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
        "해당 설문은 [지각된 스트레스]에 대한 척도 입니다.!\n이 척도는 지난 한 달 동안 어떤 감정과 생각이 들었는지 물어보는 것입니다. 각 질문에 대해 당신이 얼마나 자주 느끼거나 생각했는지를“V”표시해 주시기 바랍니다");
