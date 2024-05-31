// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevels = [
  GameLevel(
    number: 1,
    difficulty: 5,
    // You configure this in App Store Connect.
    achievementIdIOS: 'first_win',
    // You get this string when you configure an achievement in Play Console.
    achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
  ),
  GameLevel(
    number: 2,
    difficulty: 20,
  ),
  GameLevel(
    number: 3,
    difficulty: 30,
  ),
  GameLevel(
    number: 4,
    difficulty: 80,
  ),
  GameLevel(
    number: 5,
    difficulty: 100,
  ),
  GameLevel(
    number: 6,
    difficulty: 70,
  ),
  GameLevel(
    number: 7,
    difficulty: 80,
  ),
  GameLevel(
    number: 8,
    difficulty: 60,
  ),
  GameLevel(
    number: 9,
    difficulty: 50,
  ),
  GameLevel(
    number: 10,
    difficulty: 90,
  ),
  GameLevel(
    number: 11,
    difficulty: 80,
  ),
  GameLevel(
    number: 12,
    difficulty: 60,
  ),
  GameLevel(
    number: 13,
    difficulty: 50,
  ),
  GameLevel(
    number: 14,
    difficulty: 70,
  ),
  GameLevel(
    number: 15,
    difficulty: 80,
  ),
];

class GameLevel {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevel({
    required this.number,
    required this.difficulty,
    this.achievementIdIOS,
    this.achievementIdAndroid,
  }) : assert(
            (achievementIdAndroid != null && achievementIdIOS != null) ||
                (achievementIdAndroid == null && achievementIdIOS == null),
            'Either both iOS and Android achievement ID must be provided, '
            'or none');
}
