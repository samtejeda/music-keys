import 'package:flutter/material.dart';
import 'package:music_keys/data_structures/keys_data_structure/keys_data.dart';

class KeyDegrees extends StatelessWidget {
  final String note;
  final bool isMinor;

  const KeyDegrees({super.key, required this.note, this.isMinor = false});

  @override
  Widget build(BuildContext context) {
    final chords = Notes.buildChords(note, isMinor: isMinor);
    final chordNotes = Notes.buildChordNotes(note, isMinor: isMinor);
    final extensions = Notes.buildChordExtensions(note, isMinor: isMinor);
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = (screenWidth * 0.15).clamp(50.0, 80.0);
    final chordFontSize = (screenWidth * 0.04).clamp(13.0, 18.0);
    final notesFontSize = (screenWidth * 0.027).clamp(10.0, 14.0);
    final chipFontSize = (screenWidth * 0.024).clamp(9.0, 12.0);
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth > 500 ? 500 : double.infinity),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                ...List.generate(7, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: buttonSize,
                          height: buttonSize,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: chordFontSize),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.tonal(
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    chords[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: chordFontSize,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  chordNotes[index],
                                  style: TextStyle(fontSize: notesFontSize),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 6),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: extensions[index].map((ext) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: colorScheme.surface.withAlpha(180),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: colorScheme.outline.withAlpha(100),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        ext,
                                        style: TextStyle(
                                          fontSize: chipFontSize,
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
