import 'package:flutter/material.dart';

class KeysDropdown extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onSelected;

  const KeysDropdown({
    super.key,
    required this.initialValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: initialValue,
      dropdownMenuEntries: [
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
      ].map((value) => DropdownMenuEntry(value: value, label: value)).toList(),
      onSelected: (value) {
        if (value != null) {
            onSelected(value);
}
      },
    );
  }
}
