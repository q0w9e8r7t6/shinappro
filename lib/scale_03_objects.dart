import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 스마트폰 과의존 / 리커트척도
 * 일상생활 장애     1 5 9 12 15
 * 가생세계 지향수   2 6
 * 금단            4 8 11 14
 * 내성            3 7 10 13
 */

final List<String> questions = [
  "1. 스마트폰의 지나친 사용으로 학교성적이나 업무능률이 떨어진다.",
  "2. 스마트폰을 사용하지 못하면 온 세상을 잃을 것 같은 생각이 든다.",
  "3. 스마트폰을 사용할 때 그만해야지 라고 생각은 하면서도 계속한다.",
  "4. 스마트폰이 없어도 불안하지 않다.",
  "5. 수시로 스마트폰을 사용하다가 지적을 받은 적이 있다.",
  "6. 가족이나 친구들과 함께 있는 것보다 스마트폰을 사용하고 있는 것이 더 즐겁다.",
  "7. 스마트폰 사용시간을 줄이려고 해보았지만 실패한다.",
  "8. 스마트폰을 사용할 수 없게 된다면 견디기 힘든 것이다.",
  "9. 스마트폰을 너무 자주 또는 오래한다고 가족이나 친구들로부터 불평을 들은 적이 있다.",
  "10. 스마트폰 사용에 많은 시간을 보내지 않는다.",
  "11. 스마트폰이 옆에 없으면, 하루 종일 일(또는 공부)이 손에 안 잡힌다.",
  "12. 스마트폰을 사용하느라 지금 하고 있는 일(공부)에 집중이 안 된 적이 있다.",
  "13. 스마트폰 사용에 많은 시간을 보내는 것이 습관화되었다.",
  "14. 스마트폰이 없으면 안절부절 못하고 초조해진다.",
  "15. 스마트폰 사용이 지금 하고 있는 일(공부)에 방해가 되지 않는다."
];

final List<String> questionsIdentifier = [
  "scale_3_1",
  "scale_3_2",
  "scale_3_3",
  "scale_3_4",
  "scale_3_5",
  "scale_3_6",
  "scale_3_7",
  "scale_3_8",
  "scale_3_9",
  "scale_3_10",
  "scale_3_11",
  "scale_3_12",
  "scale_3_13",
  "scale_3_14",
  "scale_3_15",
];

/**
 * 선택지별 key 값 설정
 */

// Using keys for translation example
final images = [
  RPImageChoice(
    imageUrl: 'assets/image/scale_1.png',
    value: 1,
    description: '나와는 전혀 다르다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_2.png',
    value: 2,
    description: '조금 다르다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '보통이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
    description: '대체로 그렇다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_5.png',
    value: 5,
    description: '매우 그렇다.',
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
    qusetsionStep[10],
    qusetsionStep[11],
    qusetsionStep[12],
    qusetsionStep[13],
    qusetsionStep[14],
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
  RPQuestionStep(
      identifier: questionsIdentifier[10],
      title: questions[10],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[11],
      title: questions[11],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[12],
      title: questions[12],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[13],
      title: questions[13],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[14],
      title: questions[14],
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
        "해당 설문은 [스마트폰 과의존]에 대한 척도 입니다.!\n다음의 문항들은 여러분이 스마트폰을 사용하면서 경험하거나 느낀 생각에 관한 문항입니다. 자신에게 해당되는 점수에 체크해주세요.");
