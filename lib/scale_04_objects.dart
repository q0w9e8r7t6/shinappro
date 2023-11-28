import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

//TODO 리커트 4점 척도로 변경
/**
 * SNS 중독 경향성
 * 조절 실패 및 일상생활 장애   4 10 14 17 20 22 24
 * 몰입 및 내성               1 5 9 15 18 21 23
 * 부정 정서의 회피            3 8 11 16 19
 * 가상세계 지향성 및 금단      2 6 7 12 13
 */
final List<String> questions = [
  "1. SNS를 생각하거나 어떻게 이용할 것인가에 많은 시간을 보낸다.",
  "2. SNS는 내가 다른 사람과 항상 연결되어 있어 외롭거나 소외감을 덜 느끼도록 한다.",
  "3. 스트레스 받는 문제를 잊기 위해 SNS를 사용한다.",
  "4. SNS 사용 때문에 피곤해서 수업시간 또는 업무 시간에 잔다.",
  "5. 최근 SNS에서 일어난 일에 대해 많이 생각한다.",
  "6. SNS를 하지 못하게 되었을 때 짜증이 난다.",
  "7. SNS를 하는 동안만큼은 내 자신이 인정을 받는다고 느낀다.",
  "8. 무력감 또는 우울감을 줄이기 위해 SNS를 한다.",
  "9. SNS 사용에 많은 시간을 보내지 않는다.",
  "10. SNS 사용 시간을 줄이지 못해 후회한 적이 있다.",
  "11. 초조함 또는 불안감을 줄이기 위해 SNS를 한다.",
  "12. SNS를 하는 동안 더욱 자신감이 생긴다.",
  "13. SNS를 하지 못하게 되면 사는 즐거움 또는 재미를 잃는다.",
  "14. SNS 때문에 취미, 여가생활, 운동을 덜 중요시 한다.",
  "15. SNS에서 타인의 댓글을 보기 위해 시간이 날 때마다 수시로 확인 한다.",
  "16. 개인적 문제를 잊기 위해 SNS를 한다.",
  "17. SNS를 너무 많이 해서 그것이 나의 일 또는 학업에 부정적인 영향을 미쳤다.",
  "18. 하루 중 대부분의 시간을 SNS를 하며 보낸다.",
  "19. 기분을 좋게 하기 위해 SNS를 한다.",
  "20. “그만 해야지” 하면서도 번번이 SNS를 하게 된다.",
  "21. SNS를 하고 싶은 충동을 점점 더 많이 느낀다.",
  "22. SNS로 인해 오프라인에서의 다른 활동에 대한 흥미가 감소했다.",
  "23. 길을 걷거나 다른 사람들과 대화중에도 끊임없이 SNS를 한다.",
  "24. SNS로 인해 원하는 시간보다 더 늦게 잠들거나 잠을 이루지 못하는 일이 자주 있다.",
];

final List<String> questionsIdentifier = [
  "scale_4_1",
  "scale_4_2",
  "scale_4_3",
  "scale_4_4",
  "scale_4_5",
  "scale_4_6",
  "scale_4_7",
  "scale_4_8",
  "scale_4_9",
  "scale_4_10",
  "scale_4_11",
  "scale_4_12",
  "scale_4_13",
  "scale_4_14",
  "scale_4_15",
  "scale_4_16",
  "scale_4_17",
  "scale_4_18",
  "scale_4_19",
  "scale_4_20",
  "scale_4_21",
  "scale_4_22",
  "scale_4_23",
  "scale_4_24",
  "scale_4_25",
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
    description: '그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '그렇다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
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
    qusetsionStep[16],
    qusetsionStep[17],
    qusetsionStep[18],
    qusetsionStep[19],
    qusetsionStep[20],
    qusetsionStep[21],
    qusetsionStep[22],
    qusetsionStep[23],
    qusetsionStep[24],
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
  RPQuestionStep(
      identifier: questionsIdentifier[16],
      title: questions[16],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[17],
      title: questions[17],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[18],
      title: questions[18],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[19],
      title: questions[19],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[20],
      title: questions[20],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[21],
      title: questions[21],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[22],
      title: questions[22],
      answerFormat: imageChoiceAnswerFormat),
  RPQuestionStep(
      identifier: questionsIdentifier[23],
      title: questions[23],
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
        "해당 설문은 [SNS 중독 경향성]에 대한 척도 입니다.!\n다음의 문항들은 여러분이 SNS를 사용하면서 경험하거나 느낀 생각에 관한 문항입니다. 자신에게 해당되는 점수에 체크해주세요.");
