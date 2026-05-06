import 'package:flutter/material.dart';
import 'package:music_keys/data_structures/keys_data_structure/keys_data.dart';

class KeyDegrees extends StatelessWidget {
  final String note;

  const KeyDegrees({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final List<String> degrees;
    degrees = Notes.buildChords(note);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          const SizedBox(height: 50),
      
          ...List.generate(7, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  SizedBox(
                    width: 50,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        fixedSize: const Size(70, 60),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
      
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '${index + 1}',
                        ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FilledButton.tonal(
                    style: FilledButton.styleFrom(
                        fixedSize: const Size(100, 60),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
      
                        ),
                      ),
                    onPressed: () {},
                    child: Text(degrees[index]),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
