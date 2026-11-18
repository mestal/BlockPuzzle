// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => '누가 플레이하나요?';

  @override
  String get newGame => '새 게임';

  @override
  String get emptySlot => '빈 슬롯';

  @override
  String get yourName => '이름';

  @override
  String get namePlaceholder => '예: 민준';

  @override
  String get nameRequired => '이름을 입력하세요';

  @override
  String get start => '시작';

  @override
  String get cancel => '취소';

  @override
  String deleteSlotTitle(String name) {
    return '$name을(를) 삭제할까요?';
  }

  @override
  String get deleteSlotBody => '이 플레이어의 모든 진행 상황이 삭제됩니다. 되돌릴 수 없어요.';

  @override
  String get delete => '삭제';

  @override
  String levelLabel(int n) {
    return '레벨 $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '힌트 $count개',
      one: '힌트 1개',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => '탭: 칸 채우기';

  @override
  String get tutorialDoubleTap => '더블 탭: X 표시 (X를 다시 더블 탭: 지우기)';

  @override
  String get tutorialDrag =>
      '누른 채로 밀면 여러 칸을 한 번에 표시해요. X에서 더블 탭한 뒤 밀면 X 표시가 지워져요.';

  @override
  String get hint => '힌트';

  @override
  String get noHintsTitle => '힌트가 없어요';

  @override
  String get noHintsBody => '짧은 광고를 보고 힌트 1개를 받으세요.';

  @override
  String get noHintsBodyNoAds => '힌트를 모두 사용했어요.';

  @override
  String get watchAdForHint => '광고 보기: 힌트 +1';

  @override
  String get outOfLivesTitle => '목숨이 없어요';

  @override
  String get outOfLivesBody => '광고를 보고 목숨 1개를 더 받거나 레벨을 처음부터 다시 시작하세요.';

  @override
  String get outOfLivesBodyNoAds => '레벨을 처음부터 다시 하거나 레벨 목록으로 돌아가세요.';

  @override
  String get watchAdForLife => '광고 보기: 목숨 +1';

  @override
  String get restart => '처음부터';

  @override
  String get backToLevels => '레벨로 돌아가기';

  @override
  String get levelComplete => '훌륭해요!';

  @override
  String nextLevel(int n) {
    return '다음: 레벨 $n';
  }

  @override
  String get ok => '확인';

  @override
  String get allDoneSoon => '새 레벨이 곧 나와요';

  @override
  String get adLabel => '광고';

  @override
  String get adPlaceholder => '여기에 광고가 표시됩니다';

  @override
  String get adClose => '닫기';

  @override
  String adCountdown(int seconds) {
    return '$seconds초';
  }

  @override
  String get rulesTitle => '게임 방법';

  @override
  String get rulesClues =>
      '왼쪽과 위쪽의 숫자는 그 행과 열에 채워진 칸이 몇 개인지 알려 줘요. 숫자가 여러 개면 묶음 사이에 적어도 한 칸의 빈칸이 있어요.';

  @override
  String get rulesMistakes =>
      '비어 있어야 할 칸을 채우면 목숨 1개를 잃어요. X 표시는 무료예요: 마음껏 메모하세요. X가 있는 칸을 채우려면 먼저 더블 탭으로 X를 지우세요.';

  @override
  String get rulesScoring =>
      '올바르게 채울 때마다 점수를 얻어요. 연속으로 맞게 채우면 배수가 올라가요(최대 x5). 행과 열을 완성하면 보너스 점수를 받아요.';

  @override
  String levelScore(int score) {
    return '$score점';
  }

  @override
  String totalScore(int total) {
    return '합계: $total';
  }

  @override
  String get rulesGoal => '채워진 칸을 모두 찾으면 블록이 숨겨진 그림으로 바뀌어요.';

  @override
  String worldLabel(int n) {
    return '맵 $n';
  }

  @override
  String get worldsTitle => '맵';

  @override
  String get worldUnlocked => '새 맵이 열렸어요!';

  @override
  String get worldComplete => '맵 완료!';

  @override
  String nextWorld(String name) {
    return '다음 맵: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '이 맵을 끝내면 $name이(가) 열려요';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name 곧 공개';
  }

  @override
  String get worldLocked => '이전 맵을 끝내세요';

  @override
  String get worldSoon => '곧 공개';

  @override
  String get youAreHere => '현재 위치';

  @override
  String get mapStart => '출발';

  @override
  String playLevel(int n) {
    return '플레이 · 레벨 $n';
  }

  @override
  String get tapToContinue => '탭해서 계속하기';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => '설정';

  @override
  String get settingsSound => '효과음';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsLanguageDevice => '기기 언어';

  @override
  String hintRow(int n) {
    return '$n행';
  }

  @override
  String hintColumn(int n) {
    return '$n열';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): 묶음들과 그 사이의 빈칸 하나씩을 더하면 줄 전체가 채워지므로 모든 칸이 정해져요. 이 칸은 채워져요!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): 묶음들을 앞쪽으로 밀든 뒤쪽으로 밀든 이 칸은 항상 묶음 안에 있어요. 그러니 반드시 채워져요!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): 이미 있는 칸과 X 표시 때문에 묶음이 들어갈 자리가 좁혀져요. 가능한 모든 배치에서 이 칸은 채워져요!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): 어떤 묶음도 이 칸에 닿지 않으니 빈칸이에요. 여기에 X를 놓을게요.';
  }

  @override
  String get hintFallback => '이 칸은 그림의 일부예요.';

  @override
  String get tutorialSkip => '건너뛰기';

  @override
  String get tutorialGotIt => '알겠어요';

  @override
  String tutorialLesson(int lesson, int count) {
    return '튜토리얼 $lesson/$count';
  }

  @override
  String get tutorialStart => '시작해요!';

  @override
  String get tutorialSkipTitle => '튜토리얼을 건너뛸까요?';

  @override
  String get tutorialSkipBody => '이 레벨의 수업만 건너뛸까요, 아니면 튜토리얼 전체를 건너뛸까요?';

  @override
  String get tutorialSkipLevel => '이 레벨만';

  @override
  String get tutorialSkipAll => '모두 건너뛰기';

  @override
  String get tutorialWelcome =>
      '안녕하세요! 모든 퍼즐에는 그림이 숨어 있어요. 숫자를 읽고 맞는 칸을 채워 그림을 찾아보세요!';

  @override
  String get tutorialL1Fill =>
      '[5]: 이 행에는 채워진 칸이 5개예요. 행도 5칸이니 모두 채워져요! 한 칸을 탭해 보세요.';

  @override
  String get tutorialL1Drag => '좋아요! 이제 손가락을 떼지 말고 밀어서 행의 나머지를 채우세요.';

  @override
  String get tutorialL1Row => '이 행도 [5]예요. 이번에는 끝에서 끝까지 한 번에 밀어 보세요.';

  @override
  String get tutorialL1AutoCross =>
      '이 열의 [2]칸을 찾았으니 나머지 칸에는 저절로 X가 표시됐어요. X는 빈칸이라는 뜻이에요.';

  @override
  String get tutorialL1Column => '위쪽 숫자는 열의 단서예요. 이 열은 [5]: 위에서 아래로 밀어 보세요.';

  @override
  String get tutorialL1Count =>
      '이 행에는 [3]칸이 필요해요. X 칸은 비어 있으니 딱 3칸 남았어요. 모두 채우세요!';

  @override
  String get tutorialL1Finish => '마지막 행은 직접 채워서 그림을 완성하세요!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: 서로 떨어진 두 묶음이에요. 2칸 채우고, 적어도 1칸 비우고, 다시 2칸. 2 + 1 + 2 = 5: 딱 맞아요!';

  @override
  String get tutorialL2Cross => '그러니 가운데 칸은 빈칸이에요. 더블 탭해서 X를 놓으세요.';

  @override
  String get tutorialL2Drag =>
      'X는 그냥 메모라서 아무것도 잃지 않아요. 이제 행을 따라 밀어 보세요: X 칸은 건너뛰어요.';

  @override
  String get tutorialL2CrossSelf =>
      '아래 행도 [2 2]예요. 이제 직접 해 보세요: 먼저 빈칸을 더블 탭해서 X를 놓으세요.';

  @override
  String get tutorialL2DragSelf => '이제 밀어서 행을 채우세요.';

  @override
  String get tutorialL2Mistakes =>
      '조심하세요: 틀린 칸을 채우면 빨간 X가 되고 하트 하나를 잃어요. 확실하지 않으면 먼저 X를 놓으세요!';

  @override
  String get tutorialL2Finish => '나머지는 여러분 몫이에요! 막히면 한 줄에 몇 칸이 더 필요한지 세어 보세요.';

  @override
  String get tutorialL3Overlap =>
      '이 열은 [4]이고 자리는 5칸이에요. 4칸 묶음은 맨 위 아니면 맨 아래에 있어요. 어느 쪽이든 가운데 3칸은 채워져요!';

  @override
  String get tutorialL3OverlapFill =>
      '이 확실한 칸들을 채우세요. 이 요령은 겹치기라고 해요: 큰 퍼즐의 비밀이죠!';

  @override
  String get tutorialL3OverlapSelf => '이 열도 [4]예요. 확실한 칸을 직접 찾아보세요!';

  @override
  String get tutorialL3OverlapRow =>
      '그럼 [3]은요? 왼쪽에 붙이든 오른쪽에 붙이든 가운데 칸은 항상 채워져요. 채워 보세요!';

  @override
  String get tutorialL3Finish => '멋져요! 이 요령은 큰 퍼즐에서 자주 쓰여요. 이제 그림을 완성하세요!';

  @override
  String get tutorialL4Ones =>
      '위의 세 행은 [1 1 1]: 사이에 빈칸을 두고 한 칸씩 세 개예요. 1 + 1 + 1 + 1 + 1 = 5: 딱 맞아요!';

  @override
  String get tutorialL4CrossDrag =>
      '그러니 이 열의 위쪽 세 칸은 빈칸이에요. 더블 탭하고 두 번째 탭에서 손가락을 떼지 말고 아래로 밀어 보세요: X 세 개가 한 번에!';

  @override
  String get tutorialL4CrossDragSelf =>
      '이제 직접 해 보세요: 한 번에 밀어서 이 열의 빈칸 세 개에 X를 그으세요.';

  @override
  String get tutorialL4Erase =>
      'X를 잘못 놓았나요? 다시 더블 탭하면 지워져요. X에서 더블 탭으로 밀면 지나간 X가 지워져요.';

  @override
  String get tutorialL4Finish => '최고예요! 이제 그림을 완성하세요.';

  @override
  String get tutorialL5Gaps =>
      '마지막 수업: X로 풀기! 바깥쪽 네 열은 [2 2]: 2 + 1 + 2 = 5. 빈칸이 모두 가운데 행에 있어요.';

  @override
  String get tutorialL5CrossDrag =>
      '이 빈칸에 X를 표시하세요: 더블 탭하고 두 번째 탭에서 손가락을 떼지 말고 옆으로 밀어 보세요: X 두 개가 한 번에!';

  @override
  String get tutorialL5CrossDragSelf =>
      '이제 직접 해 보세요: 한 번에 밀어서 오른쪽 빈칸 두 개에 X를 그으세요.';

  @override
  String get tutorialL5Count =>
      '이 행은 [1]이고, X를 치고 나니 한 칸만 남았어요. X가 있으면 세기 쉬워요: 채우세요!';

  @override
  String get tutorialL5Hint => '막혔나요? 힌트를 누르면 다음 단계와 그 이유를 알려 줘요.';

  @override
  String get tutorialL5Finish =>
      '이제 준비 끝! 큰 판에서는 굵은 선이 5칸마다 나눠 줘서 세기 쉬워요. 그림을 완성하세요!';
}
