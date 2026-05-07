class Notes {
  static const notesFlats = [
    'C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B',
  ];

  static const notesSharps = [
    'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B',
  ];

  static bool useSharps(String key) {
    return ['C', 'D', 'E', 'G', 'A', 'B'].contains(key);
  }

  static String applyQuality(int degree, String note, {bool isMinor = false}) {
    if (isMinor) {
      if ([1, 4, 5].contains(degree)) return '${note}m';
      if (degree == 2) return '${note}dim';
      return note;
    } else {
      if ([2, 3, 6].contains(degree)) return '${note}m';
      if (degree == 7) return '${note}dim';
      return note;
    }
  }

  static String applySlash(int degree, String chord, List<String> degrees, {bool isMinor = false}) {
    if (!isMinor) {
      if (degree == 3) return '$chord or ${degrees[0]}/${degrees[2]}';
      if (degree == 7) return '$chord or ${degrees[4]}/${degrees[6]}';
    }
    return chord;
  }

  static List<String> returnDegree(String selectedKey, {bool isMinor = false}) {
    final notes = useSharps(selectedKey) ? notesSharps : notesFlats;
    final root = notes.indexOf(selectedKey);
    final intervals = isMinor ? [0, 2, 3, 5, 7, 8, 10] : [0, 2, 4, 5, 7, 9, 11];
    final degrees = intervals.map((interval) => (root + interval) % 12).toList();
    return degrees.map((index) => notes[index]).toList();
  }

  static List<String> buildChords(String selectedKey, {bool isMinor = false}) {
    final degrees = returnDegree(selectedKey, isMinor: isMinor);
    final List<String> result = [];

    for (int i = 0; i < degrees.length; i++) {
      final degree = i + 1;
      String chord = applyQuality(degree, degrees[i], isMinor: isMinor);
      chord = applySlash(degree, chord, degrees, isMinor: isMinor);
      result.add(chord);
    }

    return result;
  }

  static List<String> buildChordNotes(String selectedKey, {bool isMinor = false}) {
    final noteSet = useSharps(selectedKey) ? notesSharps : notesFlats;
    final degrees = returnDegree(selectedKey, isMinor: isMinor);
    final List<String> result = [];

    for (int i = 0; i < degrees.length; i++) {
      final degree = i + 1;
      final rootIndex = noteSet.indexOf(degrees[i]);

      late List<int> intervals;
      if (isMinor) {
        if ([1, 4, 5].contains(degree)) {
          intervals = [0, 3, 7];
        } else if (degree == 2) {
          intervals = [0, 3, 6];
        } else {
          intervals = [0, 4, 7];
        }
      } else {
        if ([2, 3, 6].contains(degree)) {
          intervals = [0, 3, 7];
        } else if (degree == 7) {
          intervals = [0, 3, 6];
        } else {
          intervals = [0, 4, 7];
        }
      }

      final chordNotes = intervals.map((i) => noteSet[(rootIndex + i) % 12]).join(' · ');
      result.add(chordNotes);
    }

    return result;
  }
}
