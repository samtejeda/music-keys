class Notes {
  static const notesFlats = [
    'C',
    'Db',
    'D',
    'Eb',
    'E',
    'F',
    'Gb',
    'G',
    'Ab',
    'A',
    'Bb',
    'B',
  ];

  static const notesSharps = [
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
    'A',
    'A#',
    'B',
  ];

  static bool useSharps(String key) {
    return ['C', 'D', 'E', 'G', 'A', 'B'].contains(key);
  }

  static String applyQuality(int degree, String note) {
    if ([2, 3, 6].contains(degree)) {
      return '$note''m';
    }
    if (degree == 7) {
      return '$note''dim';
    }
    return note;
  }

  static String applySlash(int degree, String chord, List<String> degrees) {
    if (degree == 3) {
      return '$chord or ${degrees[0]}/${degrees[2]}';
    }
    if (degree == 7) {
      return '$chord or ${degrees[4]}/${degrees[6]}';
    }
    return chord;
  }

  static List<String> returnDegree(String selectedKey) {
    final notes = useSharps(selectedKey) ? notesSharps : notesFlats;

    final root = notes.indexOf(selectedKey);
    List<int> majorIntervals = [0, 2, 4, 5, 7, 9, 11];

    List degrees = majorIntervals
        .map((interval) => (root + interval) % 12)
        .toList();

    return degrees.map((index) => notes[index]).toList();
  }

  static List<String> buildChords(String selectedKey) {
    final degrees = returnDegree(selectedKey);
    final List<String> result = [];

    for (int i = 0; i < degrees.length; i++) {
      final degree = i + 1;

      String chord = applyQuality(degree, degrees[i]);
      chord = applySlash(degree, chord, degrees);

      result.add(chord);
    }

    return result;
  }
}
