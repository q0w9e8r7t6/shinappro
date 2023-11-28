import 'package:research_package/model.dart';

/**
 * @@척도의 질문 목록
 */

/**
 * 학습 습관 척도 / 리커트 5점 척도
 * 인지전략 사용    1 ~ 9
 * 자기조절        10 ~ 16
 */

final List<String> questions = [
  "1. 나는 과제제출이나 시험 전에, 수업시간과 강의 교재로부터 필요한 내용들을 모으려고 노력한다.",
  "2. 나는 과제를 할 때, 과제 문제에 올바른 답을 제시하기 위해 교수자의 강의를 기억해내려고 노력한다.",
  "3. 나는 교재를 읽고 쉽게 주제를 파악할 수 있다.",
  "4. 나는 학습을 할 때, 중요한 내용을 내가 이해할 수 있는 말로 바꾸어 기억한다.",
  "5. 나는 학습을 할 때, 기억을 돕기 위해 노트에 자꾸 써본다.",
  "6. 나는 새로운 과제를 하기 위해, 예전에 했던 과제와 강의교재에서 배운 내용을 활용한다.",
  "7. 나는 학습할 때 관련된 여러 사실들을 연결시키려고 노력한다.",
  "8. 나는 학습한 내용을 기억하기 위해 여러 번 반복해서 읽는다.",
  "9. 나는 교재에 중요한 부분을 요약해 둔다.",
  "10. 나는 학습 내용을 기억하기 위해 스스로에게 질문을 해 본다.",
  "11. 나는 공부가 어려울 때, 포기하거나 쉬운 부분만을 공부한다.",
  "12. 나는 꼭 해야 하는 것이 아니더라도 학습 후 제시되는 연구(연습)문제를 풀어본다. ",
  "13. 나는 학습 내용이 지루하고 흥미가 없는 것이라도 끝까지 공부한다.",
  "14. 나는 계획을 세워 공부한다.",
  "15. 나는 딴 생각을 하지 않고 교수의 강의를 잘 듣는다.",
  "16. 나는 학습자료를 읽을 때 가끔 멈추고 읽은 부분을 다시 훑어보며 내용을 생각해가면서 읽는다.",
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
  "scale_8_13",
  "scale_8_14",
  "scale_8_15",
  "scale_8_16",
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
    description: '별로 그렇지 않다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_3.png',
    value: 3,
    description: '보통이다.',
  ),
  RPImageChoice(
    imageUrl: 'assets/image/scale_4.png',
    value: 4,
    description: '약간 그렇다.',
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

    //timerStep,
    //formStep,
    //smokingQuestionStep,
    //insulinStep,
    // wakeUpStep,
    //foodStep,
    //alcoholStep,
    //bloodGlucoseStep,
    //imageChoiceQuestionStep,
    // singleChoiceQuestionStep,
    // happinessChoiceQuestionStep,
    // weightQuestionStep,
    // additionalInfoQuestionStep,
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

/*
final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[0],
  answerFormat: imageChoiceAnswerFormat,
);

final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[1],
  answerFormat: imageChoiceAnswerFormat,
);

final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[2],
  answerFormat: imageChoiceAnswerFormat,
);

final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[3],
  answerFormat: imageChoiceAnswerFormat,
);

final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[4],
  answerFormat: imageChoiceAnswerFormat,
);

final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[5],
  answerFormat: imageChoiceAnswerFormat,
);

final question1Step = RPQuestionStep(
  identifier: "1-scale-1",
  title: questions[6],
  answerFormat: imageChoiceAnswerFormat,
);
 */

final completionStep = RPCompletionStep(
    identifier: "completionID",
    title: "Finished",
    text: "Thank you for filling out the survey!");

final instructionStep = RPInstructionStep(
    identifier: "instructionID",
    title: "Welcome!",
    detailText: null,
    text:
        "해당 설문은 [학습 습관]에 대한 척도 입니다.\n다음은 여러분의 스스로 공부 방법에 대해 알아보기 위한 질문입니다. 각 문항을 읽으신 후, 나의 생각과 경험에 적합하다고 생각하신 곳에 표시해주세요.");

/**
 * 안쓰는 척도들?
 */
/*
final wakeUpStep = RPQuestionStep(
    identifier: 'wakeUpStep',
    title: 'When did you wake up?',
    answerFormat: timeOfDayAnswerFormat);

final foodStep = RPQuestionStep(
    identifier: 'foodStep',
    title: 'When did you last eat unhealthy food?',
    answerFormat: dateAndTimeAnswerFormat);

final alcoholStep = RPQuestionStep(
  identifier: 'alcoholStep',
  title: 'When did you last drink alcohol?',
  answerFormat: dateAnswerFormat,
  autoSkip: true,
  timeout: Duration(seconds: 6),
);

final insulinStep = RPQuestionStep(
  identifier: "insulinStep",
  title: "What did you pay for insulin?",
  answerFormat: sliderAnswerFormat,
  optional: true,
);



// Using keys for translations
final singleChoiceQuestionStep = RPQuestionStep(
  identifier: "questionStep1ID",
  title: "singleChoiceQuestionStep-title",
  answerFormat: timeAnswerFormat,
);

final smokingQuestionStep = RPQuestionStep(
  identifier: "booleanQuestionStepID",
  title: "Do you smoke?",
  answerFormat: yesNoAnswerFormat,
);



final instrumentChoiceQuestionStep = RPQuestionStep(
    identifier: "instrumentChoiceQuestionStepID",
    title: "Which instrument are you playing?",
    answerFormat: instrumentsAnswerFormat,
    optional: true);

final happinessChoiceQuestionStep = RPQuestionStep(
    identifier: "happinessChoiceQuestionStepID",
    title: "What makes you happy?",
    answerFormat: joyfulActivitiesAnswerFormat);

final weightQuestionStep = RPQuestionStep(
    identifier: "weightQuestionStepID",
    title: "What is your weight?",
    answerFormat: weightIntegerAnswerFormat);

final bloodGlucoseStep = RPQuestionStep(
    identifier: "bloodGlucoseStep",
    title: "Please enter your Blood Glucose",
    answerFormat: bloodGlucoseDoubleAnswerFormat);

final minutesQuestionStep = RPQuestionStep(
    identifier: "minutesQuestionStepID",
    title: "How many minutes do you spend practicing a week?",
    answerFormat: minutesIntegerAnswerFormat,
    optional: true);


final textQuestionStep = RPQuestionStep(
  identifier: "textStepID",
  answerFormat: RPTextAnswerFormat(hintText: "Write here"),
  title: "Describe your morning routine",
);


final formStep = RPFormStep(
  identifier: "formstepID",
  title: "Questions about music",
  questions: [
    instrumentChoiceQuestionStep, // optional
    textQuestionStep,
    minutesQuestionStep, // optional
    alcoholStep
  ],
  autoSkip: true,
  timeout: Duration(seconds: 6),
  saveResultsOnAutoSkip: true,
);

 */

/*
final timerStep = RPTimerStep(
  identifier: 'RPTimerStepID',
  timeout: Duration(seconds: 5),
  title:
      "Please think for a moment about how your day was and note it down in the next step",
  playSound: true,
  autoSkip: true,
);
*/
