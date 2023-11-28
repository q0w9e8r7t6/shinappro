import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 게임 중독 척도 / 리커트 5점
 * 하위요인 없음
 */

final List<String> questions = [
  "1. 처음에 생각했던 것보다 더 오랫동안 게임을 하게 된다.",
  "2. 게임을 하느라고 집안(혹은 학교)일을 미룬 적이 있다.",
  "3. 가족이나 친구들과 있는 것보다 게임을 하는 것이 더 즐겁다.",
  "4. 게임을 할 때마다 새로운 친구를 만든다.",
  "5. 나는 게임을 오래한다고 주위 사람들에게 질책을 받는다.",
  "6. 게임을 하는데 많은 시간을 보내기 때문에 숙제, 학과 공부를 제대로 못하거나 성적이 많이 떨어진 경험이 있다.",
  "7. 해야 할 일들을 뒤로 미루고 먼저 게임부터 하게 된다.",
  "8. 게임 때문에 학교 공부가 소홀해지고 성적도 많이 떨어졌다.",
  "9. 사람들이 내게 게임을 얼마나 하는지 물을 때 사실보다 줄여서 말한 적이 많다.",
  "10. 게임에 대한 기분 좋은 생각을 하면서 일생생활의 힘든 생각을 잊는다.",
  "11. 다시 게임을 할 수 있을 때를 기다리게 된다.",
  "12. 게임이 없다면 내 인생은 공허하고 재미가 없다.",
  "13. 게임을 할 때 누가 날 방해하면 소리 지르고 고함을 치거나 막 화를 낸다.",
  "14. 밤새 게임을 하느라 잠을 못 잔다.",
  "15. 게임을 안 할 때에도 인터넷에 대한 생각으로 꽉 차 있거나 게임을 하고 있는 것을 상상해 본다.",
  "16. 게임을 할 때 “조금만 더 하다가 그만해야지”라고 하면서 계속한다.",
  "17. 게임 하는 시간을 줄이려고 노력했지만 결국 실패했다.",
  "18. 게임을 얼마나 오래 했는지를 남에게 숨기려고 한다.",
  "19. 남들과 어울려 나가기 보다는 게임을 하며 시간 보내는 걸 선택한다.",
  "20. 기분이 우울하고, 불안해지며 긴장이 되었다가도 게임을 하고나면 괜찮아 진다.",
];

final List<String> questionsIdentifier = [
  "scale_5_1",
  "scale_5_2",
  "scale_5_3",
  "scale_5_4",
  "scale_5_5",
  "scale_5_6",
  "scale_5_7",
  "scale_5_8",
  "scale_5_9",
  "scale_5_10",
  "scale_5_11",
  "scale_5_12",
  "scale_5_13",
  "scale_5_14",
  "scale_5_15",
  "scale_5_16",
  "scale_5_17",
  "scale_5_18",
  "scale_5_19",
  "scale_5_20",
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
        "해당 설문은 [게임중독]에 대한 척도 입니다.!\n아래의 문항들을 주의 깊게 읽고, 평소 자신과 가장 가깝다고 생각되는 정도를 나 타내는 번호에 O표를 해주십시오.");
