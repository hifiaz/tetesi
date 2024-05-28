import 'package:crossword/components/line_decoration.dart';
import 'package:crossword/crossword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tetesi/audio/audio_controller.dart';
import 'package:tetesi/audio/sounds.dart';
import 'package:tetesi/game_internals/level_state.dart';
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
  List<Color> lineColors = [];

  @override
  void initState() {
    super.initState();
    lineColors = List.generate(100, (index) => generateRandomColor()).toList();
  }

  @override
  Widget build(BuildContext context) {
    final levelState = context.watch<LevelState>();
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
            'Petunjuk: ${widget.cross.hint}, ${widget.cross.listHint.length} Kata',
            style: const TextStyle(fontSize: 24)),
        Expanded(
          child: Crossword(
            letters: widget.cross.letters,
            spacing: const Offset(28, 28),
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
                      onPressed: () {
                        levelState.setProgress(100);
                        context.read<AudioController>().playSfx(SfxType.wssh);
                        levelState.evaluate();
                      },
                      child: const Text('Next Level'))
                ]
              ],
            ),
          );
        }),
        const SizedBox(height: 20),
      ],
    );
  }
}
