// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tetesi/game_internals/game_controller.dart';
import 'package:tetesi/play_session/cross.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listGame = gameController.listCrossWord.watch(context);
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Pilih level',
                  style:
                      TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  listGame.map(
                      data: (game) {
                        return Column(
                          children: game
                              .map(
                                (level) => ListTile(
                                  enabled: playerProgress.highestLevelReached >=
                                      level.id - 1,
                                  onTap: () {
                                    final audioController =
                                        context.read<AudioController>();
                                    audioController.playSfx(SfxType.buttonTap);
                                    foundLetters.clear();
                                    GoRouter.of(context)
                                        .go('/play/session/${level.id}');
                                  },
                                  leading: Text(level.id.toString()),
                                  title:
                                      Text('Level #${level.id} ${level.hint}'),
                                ),
                              )
                              .toList(),
                        );
                      },
                      error: (error) => Text('$error'),
                      loading: () => const CircularProgressIndicator())
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}
