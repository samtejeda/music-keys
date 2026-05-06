import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {

  final VoidCallback onToggleTheme;

  const CustomAppbar({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.music_note, color: colors.primary, size: 30),
              const SizedBox(width: 5),
              Text('Music Keys', style: titleStyle),
              const SizedBox(width: 5),
              Spacer(),
              IconButton(
                onPressed: onToggleTheme,
                icon: Icon(Icons.dark_mode, color: colors.primary, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Brightness changeDarkMode() {
    Brightness currentBrightness =
        Brightness.dark; // Replace with actual brightness state
    if (currentBrightness == Brightness.dark) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }
}
