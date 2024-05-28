import 'package:flutter/material.dart';
import 'package:tetesi/model/crossword_model.dart';
import 'package:tetesi/pages/cross.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Teka Teki Silang'),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  Cross(cross: CrosswordModel(
                            id: 1,
                            hint: 'Teknologi',
                            listHint: ["FLUTTER", "GAMES", "UI", "COLOR"],
                            letters: [
                  ["F", "L", "U", "T", "T", "E", "R", "W", "U", "D", "B", "C"],
                  ["R", "M", "I", "O", "P", "U", "I", "Q", "R", "L", "E", "G"],
                  ["T", "V", "D", "I", "R", "I", "M", "U", "A", "H", "E", "A"],
                  ["D", "A", "R", "T", "N", "S", "T", "O", "Y", "J", "R", "M"],
                  ["O", "G", "A", "M", "E", "S", "C", "O", "L", "O", "R", "O"],
                  ["S", "R", "T", "I", "I", "I", "F", "X", "S", "P", "E", "D"],
                  ["Y", "S", "N", "E", "T", "M", "M", "C", "E", "A", "T", "S"],
                  ["W", "E", "T", "P", "A", "T", "D", "Y", "L", "M", "N", "U"],
                  ["O", "T", "E", "H", "R", "O", "G", "P", "T", "U", "O", "E"],
                  ["K", "R", "R", "C", "G", "A", "M", "E", "S", "S", "T", "S"],
                  ["S", "E", "S", "T", "L", "A", "O", "P", "U", "P", "E", "S"]
                ]
                          ),)),
                    );
                  },
                  child: const Text(' Lv 1'))
            ],
          ),
        )
        // Column(
        //   children: [
        //     const SizedBox(height: 20),
        //     const Text('Hint: Cross Platform, 5 Kata',
        //         style: TextStyle(fontSize: 24)),
        //     Expanded(
        //       child: Crossword(
        //         letters: const [
        //           ["F", "L", "U", "T", "T", "E", "R", "W", "U", "D", "B", "C"],
        //           ["R", "M", "I", "O", "P", "U", "I", "Q", "R", "L", "E", "G"],
        //           ["T", "V", "D", "I", "R", "I", "M", "U", "A", "H", "E", "A"],
        //           ["D", "A", "R", "T", "N", "S", "T", "O", "Y", "J", "R", "M"],
        //           ["O", "G", "A", "M", "E", "S", "C", "O", "L", "O", "R", "O"],
        //           ["S", "R", "T", "I", "I", "I", "F", "X", "S", "P", "E", "D"],
        //           ["Y", "S", "N", "E", "T", "M", "M", "C", "E", "A", "T", "S"],
        //           ["W", "E", "T", "P", "A", "T", "D", "Y", "L", "M", "N", "U"],
        //           ["O", "T", "E", "H", "R", "O", "G", "P", "T", "U", "O", "E"],
        //           ["K", "R", "R", "C", "G", "A", "M", "E", "S", "S", "T", "S"],
        //           ["S", "E", "S", "T", "L", "A", "O", "P", "U", "P", "E", "S"]
        //         ],
        //         spacing: const Offset(30, 30),
        //         onLineDrawn: (List<String> words) {
        //           if (["FLUTTER", "GAMES", "UI", "COLOR"].contains(words.last)) {
        //             foundLetters.add(words.last);
        //           }
        //         },
        //         textStyle: const TextStyle(color: Colors.black, fontSize: 20),
        //         lineDecoration:
        //             LineDecoration(lineColors: lineColors, strokeWidth: 20),
        //         hints: const ["FLUTTER", "GAMES", "UI", "COLOR"],
        //         allowOverlap: true,
        //       ),
        //     ),
        //     Watch((_) {
        //       final letters = foundLetters.toSet().toList();
        //       return SizedBox(
        //         height: 80,
        //         child: Column(
        //           children: [
        //             Wrap(
        //               spacing: 5,
        //               children: letters.map((val) => Text(val)).toList(),
        //             ),
        //             if (letters.length == 4) ...[
        //               const SizedBox(height: 10),
        //               TextButton(
        //                   onPressed: () {}, child: const Text('Next Level'))
        //             ]
        //           ],
        //         ),
        //       );
        //     }),
        //     const SizedBox(height: 20),
        //   ],
        // ),
        );
  }
}
