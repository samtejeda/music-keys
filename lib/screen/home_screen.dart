import 'package:flutter/material.dart';
import 'package:music_keys/widgets/custom_app_bar.dart';
import 'package:music_keys/widgets/key_degrees.dart';
import 'package:music_keys/widgets/keys_dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onToggleTheme});
  final VoidCallback onToggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedKey = 'C';
  bool isMinor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(onToggleTheme: widget.onToggleTheme),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Key')),
                const SizedBox(width: 20),
                KeysDropdown(
                  initialValue: selectedKey,
                  onSelected: (value) {
                    setState(() {
                      selectedKey = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: false, label: Text('Major')),
                  ButtonSegment(value: true, label: Text('Minor')),
                ],
                selected: {isMinor},
                onSelectionChanged: (value) {
                  setState(() {
                    isMinor = value.first;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: KeyDegrees(note: selectedKey, isMinor: isMinor),
            ),
          ],
        ),
      ),
    );
  }
}
