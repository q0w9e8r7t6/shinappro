import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

// @TODO 리커트 6점으로 변경
/**
 * 동기균형 척도 / 리커트 6점
 * 자율감 1 ~ 4
 * 유능감 5 ~ 8
 * 소속감 9 ~ 12
 * 목표감 13 ~ 16
 */

final List<String> questions = [
  "1. 나는 내가 하고 싶은 것을 자발적으로 선택한다.",
  "2. 나는 내가 원하는 대로 선택할 수 있다.",
  "3. 나는 내 가치에 따라 어떤 행동을 할지 결정한다.",
  "4. 나는 내가 어떻게 살아갈지 스스로 자유롭게 결정한다.",
  "5. 나는 내 안의 잠재력을 충분히 발휘하고 있다.",
  "6. 나는 맡은 일을 잘 할 수 있다는 자신감이 있다.",
  "7. 나는 내가 맡은 일을 쉽게 해낸다.",
  "8. 나는 내 능력에 대해 자부심을 느낀다.",
  "9. 나와 친한 사람들은 있는 그대로의 내 모습을 수용해준다.",
  "10. 내가 속한 집단의 동료들은 나에 대해서 잘 알고 있다.",
  "11. 나는 가까운 사람들로부터 사랑과 관심을 받고 있다.",
  "12. 나와 친구들은 서로 맞춰가면서 관계를 유지하고 있다.",
  "13. 나는 달성하려면 오랜 시간이 필요한 목표를 갖고 있다.",
  "14. 나는 내 삶을 움직이는 구체적 목표가 있다.",
  "15. 나는 이루어지면 만족스러울 것 같은 목표를 갖고 있다.",
  "16. 나는 목표를 이루기 위해 내가 가진 자원을 활용한다."
];


final List<String> questionsIdentifier = [
  "scale_1_1",
  "scale_1_2",
  "scale_1_3",
  "scale_1_4",
  "scale_1_5",
  "scale_1_6",
  "scale_1_7",
  "scale_1_8",
  "scale_1_9",
  "scale_1_10",
  "scale_1_11",
  "scale_1_12",
  "scale_1_13",
  "scale_1_14",
  "scale_1_15",
  "scale_1_16",

];

/**
 * 선택지별 key 값 설정
 */

// Using keys for translation example
final images = [
  RPImageChoice(
    imageUrl: 'assets/image/scale_1.png',
    value: 1,
    description: '전혀 그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_2.png',
    value: 2,
    description: '약간 그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
    description: '보통이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_5.png',
    value: 5,
    description: '약간 그렇다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_6.png',
    value: 6,
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
      qusetsionStep[15],
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
  RPQuestionStep(
      identifier: questionsIdentifier[15],
      title: questions[15],
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
    "동기균형 척도\n각 문항을 주의깊게 읽고, 자신의 삶과 얼마나 관련이 있는지를 잘 설명해주는 정도에 표시해주시기 바랍니다."
);
