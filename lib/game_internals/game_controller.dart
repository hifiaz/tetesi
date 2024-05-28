import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tetesi/model/crossword_model.dart';

class GameController {
  final listCrossWord = futureSignal(() async {
    late Future<String> jsonString;
    final List<CrosswordModel> listCrossWord = [];
    jsonString = rootBundle.loadString('assets/crossword.json');
    final json = jsonDecode(await jsonString);
    for (var i in json) {
      listCrossWord.add(CrosswordModel.fromJson(i));
    }
    return listCrossWord;
  });
}

final gameController = GameController();
