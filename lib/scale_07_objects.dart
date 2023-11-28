import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 온라인 쇼핑 중독 성향 척도 / 리커트 5점
 * 하위요인 없음
 */
final List<String> questions = [
  "1. 인터넷 쇼핑으로 구입하는 돈의 액수가 점점 증가하고 있다.",
  "2. 인터넷 쇼핑몰에 새로운 물건이 등록되었는지 수시로 확인한다.",
  "3. 인터넷 쇼핑을 할 때 돈을 아끼지 않는다.",
  "4. 밤늦도록 인터넷 쇼핑몰을 방문한다.",
  "5. 인터넷 쇼핑을 하지 않으면 생활이 지루하고 재미가 없다.",
  "6. 인터넷 쇼핑으로 다른 업무, 공부에 지장을 주곤 한다.",
  "7. 인터넷 쇼핑이 즐겁다.",
  "8. 인터넷 쇼핑을 위해 다른 일을 미루거나 포기한 적이 있다.",
  "9. 인터넷 쇼핑은 나의 중요한 일과 중 하나이다.",
  "10. 인터넷 쇼핑으로 다른 사람 또는 가족과 갈등이 있다.",
  "11. 인터넷 쇼핑을 하면 계획에 없던 돈을 쓰게 된다.",
  "12. 인터넷 쇼핑은 일상생활의 스트레스 해소 방법이 된다.",
  "13. 인터넷 쇼핑을 할 때 물건을 사고 싶은 강한 충동을 느낄 때가 있다.",
  "14. 인터넷 쇼핑몰에서 물건을 산 후 ‘사지 않았더라면 좋았을 걸＇하고 자주 후회한다.",
  "15. 기분이 좋아지기 위해서 인터넷 쇼핑몰에서 무언가를 산다.",
];

final List<String> questionsIdentifier = [
  "scale_7_1",
  "scale_7_2",
  "scale_7_3",
  "scale_7_4",
  "scale_7_5",
  "scale_7_6",
  "scale_7_7",
  "scale_7_8",
  "scale_7_9",
  "scale_7_10",
  "scale_7_11",
  "scale_7_12",
  "scale_7_13",
  "scale_7_14",
  "scale_7_15",
];

/**
 * 선택지별 key 값 설정
 */

// Using keys for translation example
final images = [
  RPImageChoice(
    imageUrl: 'assets/image/scale_1.png',
    value: 1,
    description: '전혀 아니다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_2.png',
    value: 2,
    description: '아니다.',
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
        "해당 설문은 [온라인 쇼핑 중독 성향 척도]에 대한 척도 입니다.\n다음 문장을 잘 읽고, 인터넷 쇼핑 성향과 관련하여 자신에게 해당되는 정도에 표시해주세요.\n\n* 본 설문지에서 사용되는 ‘인터넷 쇼핑＇의 개념은 구매뿐만 아니라 실제로 구매행동을 하지 않고, 쇼핑몰을 둘러보거나 wish list 혹은 장바구니에 담아놓는 행동도 포함합니다.");
