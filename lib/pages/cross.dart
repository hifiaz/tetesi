import 'package:crossword/components/line_decoration.dart';
import 'package:crossword/crossword.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tetesi/model/crossword_model.dart';
import 'package:tetesi/utils/utils.dart';

final foundLetters = listSignal([]);

class Cross extends StatefulWidget {
  final CrosswordModel cross;
  const Cross({super.key, required this.cross});

  @override
  State<Cross> createState() => _CrossState();
}

class _CrossState extends State<Cross> {
  List<List<String>> letters = [];
  List<Color> lineColors = [];

  @override
  void initState() {
    super.initState();
    letters = generateRandomLetters();
    lineColors = List.generate(100, (index) => generateRandomColor()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Level: ${widget.cross.id}'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
              'Petunjuk: ${widget.cross.hint}, ${widget.cross.listHint.length} Kata',
              style: const TextStyle(fontSize: 24)),
          Expanded(
            child: Crossword(
              letters: widget.cross.letters,
              spacing: const Offset(30, 30),
              onLineDrawn: (List<String> words) {
                if (widget.cross.listHint.contains(words.last)) {
                  foundLetters.add(words.last);
                }
              },
              textStyle: const TextStyle(color: Colors.black, fontSize: 20),
              lineDecoration:
                  LineDecoration(lineColors: lineColors, strokeWidth: 20),
              hints: widget.cross.listHint,
              allowOverlap: true,
            ),
          ),
          Watch((_) {
            final letters = foundLetters.toSet().toList();
            return SizedBox(
              height: 80,
              child: Column(
                children: [
                  Wrap(
                    spacing: 5,
                    children: letters.map((val) => Text(val)).toList(),
                  ),
                  if (letters.length == widget.cross.listHint.length) ...[
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {}, child: const Text('Next Level'))
                  ]
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
