import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tetesi/model/crossword_model.dart';
import 'package:tetesi/pages/cross.dart';
import 'package:tetesi/utils/utils.dart';

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = listCrossWord.watch(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Teka Teki Silang'),
        actions: [
          TextButton(
              onPressed: () {
                List<List<String>> letters = generateRandomLetters();
                log('$letters');
              },
              child: const Text('Generate'))
        ],
      ),
      body: SingleChildScrollView(
          child: list.map(
        data: (val) {
          if (val.isEmpty) {
            return const Center(
              child: Text('Tidak Ada Data'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: val
                  .map(
                    (i) => TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cross(cross: i),
                            ),
                          );
                        },
                        child: Text('Lv ${i.id}')),
                  )
                  .toList(),
            ),
          );
        },
        error: (error) => Text('$error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      )),
    );
  }
}
