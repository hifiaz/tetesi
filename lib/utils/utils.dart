import 'dart:math';

import 'package:flutter/material.dart';

Color generateRandomColor() {
  Random random = Random();

  int r = random.nextInt(200) - 128; // Red component between 128 and 255
  int g = random.nextInt(200) - 128; // Green component between 128 and 255
  int b = random.nextInt(200) - 128; // Blue component between 128 and 255

  return Color.fromARGB(255, r, g, b);
}

List<List<String>> generateRandomLetters() {
  List<int> letterGrid = [14, 14];
  final random = Random();
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  List<List<String>> array = List.generate(
      letterGrid.first,
      (_) => List.generate(
          letterGrid.last, (_) => letters[random.nextInt(letters.length)]));

  return array;
}
