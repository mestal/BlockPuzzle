import 'package:block_puzzle/features/game/domain/lives.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bigger boards start with more lives', () {
    expect(Lives.forSize(5, 5), 3);
    expect(Lives.forSize(10, 5), 4);
    expect(Lives.forSize(5, 10), 4);
    expect(Lives.forSize(10, 10), 5);
    expect(Lives.forSize(15, 10), 5);
  });

  test('a mistake costs one life on a normal level', () {
    expect(Lives.canRunOut(3), isTrue);
    expect(Lives.afterMistake(3, 2), 1);
    expect(Lives.afterMistake(3, 1), 0);
  });

  test('tutorial levels never take the last life', () {
    for (final level in Tutorial.levels) {
      expect(Lives.canRunOut(level), isFalse);
      expect(Lives.afterMistake(level, 3), 2);
      expect(Lives.afterMistake(level, 1), 1);
    }
  });
}
