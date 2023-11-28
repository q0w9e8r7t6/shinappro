import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 유투브 중독 척도 / 리커트 5점
 * 현저성           1 ~ 5
 * 조절실패         6 ~ 9
 * 일상생활 장애     10 ~ 12
 * 부정정서 회피     13 ~ 16
 * 관계 지향성       17 ~ 19
 * 금단             20 ~ 22
 */

final List<String> questions = [
  "1. 다른 일을 하면서도 그 일에 완전히 집중하지 못하고 나도 모르게 유튜브를 사용하게 된다.",
  "2. 가족이나 친구들과 시간을 보내는 것보다 유튜브를 하는 것이 더 즐겁다.",
  "3. 길을 걷거나, 운전할 때에도 유튜브 사용에 대한 유혹을 강하게 느낀다.",
  "4. 유튜브를 사용하는 것이 외부 활동보다 더 즐겁다.",
  "5. 유튜브를 사용하지 않고 있을 때도 유튜브에서 본 콘텐츠에 대한 생각이 자꾸 떠오른다.",
  "6. 한번 유튜브를 보기 시작하면 멈추기 어렵다.",
  "7. 시간 가는 줄 모르고 하루 종일 유튜브를 사용한 적이 있다.",
  "8. 계속 연결되는 추천 동영상 시청의 유혹을 떨치기가 어려워 더 시청하곤 한다.",
  "9. 유튜브 사용 시간을 줄이려고 노력해 보지만 늘 실패한다.",
  "10. 시험이나 과제 등 중요한 일을 앞두고 오히려 유튜브를 더 사용하게 된다.",
  "11. 유튜브 사용으로 인해 계획한 일들을 제대로 하지 못한 적이 있다.",
  "12. 유튜브에 많은 시간을 보내느라, 숙제나 공부를 제대로 못 하거나 성적이 떨어진 경험이 있다.",
  "13. 현실에서 힘든 일이나 괴로운 일이 있을 때 그것을 잊기 위해 유튜브를 사용한다.",
  "14. 불안감과 초조함을 느낄 때 그것을 잊기 위해 유튜브를 사용한다.",
  "15. 학업이나 취업 준비로 인해 스트레스가 느껴지면 그것을 잊기 위해 유튜브를 사용한다.",
  "16. 외로움이나 공허함을 느낄 때 그것을 잊기 위해 유튜브를 사용한다.",
  "17. 좋아하는 유튜버가 올린 영상들을 전부 찾아보게 된다.",
  "18. 좋아하는 유튜버의 영상 업로드만을 기다리게 된다.",
  "19. 좋아하는 유튜버의 영상이 올라오면 계획되어 있던 일을 미뤄서라도 보고 싶다.",
  "20. 유튜브 사용을 하지 못하게 되면 안전부절 못하고 초조해진다.",
  "21. 유튜브 사용을 하지 못하게 되면 스트레스를 받는다.",
  "22. 유튜브 사용을 하지 못하게 되면 우울하고 무기력해진다.",
];


final List<String> questionsIdentifier = [
  "scale_6_1",
  "scale_6_2",
  "scale_6_3",
  "scale_6_4",
  "scale_6_5",
  "scale_6_6",
  "scale_6_7",
  "scale_6_8",
  "scale_6_9",
  "scale_6_10",
  "scale_6_11",
  "scale_6_12",
  "scale_6_13",
  "scale_6_14",
  "scale_6_15",
  "scale_6_16",
  "scale_6_17",
  "scale_6_18",
  "scale_6_19",
  "scale_6_20",
  "scale_6_21",
  "scale_6_22",
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
    description: '거의 그렇지 않다.',
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
        "해당 설문은 [유튜브 중독]에 대한 척도 입니다.\n다음 문장을 읽고 최근 자신의 상황과 느낌을 가장 잘 나타낸다고 생각되는 곳에 체크를 해주시기 바랍니다.");
