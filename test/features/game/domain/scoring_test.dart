import 'package:block_puzzle/features/game/domain/scoring.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('multiplier grows every five fills and is capped', () {
    expect(Scoring.multiplier(1), 1);
    expect(Scoring.multiplier(4), 1);
    expect(Scoring.multiplier(5), 2);
    expect(Scoring.multiplier(10), 3);
    expect(Scoring.multiplier(500), Scoring.maxMultiplier);
  });

  test('fill and line points scale with the combo', () {
    expect(Scoring.fill(1), 10);
    expect(Scoring.fill(5), 20);
    expect(Scoring.lines(2, 1), 100);
    expect(Scoring.lines(1, 10), 150);
  });

  test('level bonus rewards lives and flawless play', () {
    expect(Scoring.levelBonus(lives: 3, mistakes: 0), 450);
    expect(Scoring.levelBonus(lives: 1, mistakes: 2), 150);
  });

  test('stars drop with mistakes', () {
    expect([0, 1, 2, 9].map(Scoring.stars), [3, 2, 1, 1]);
  });
}
