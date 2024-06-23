import 'package:flutter/material.dart';
import 'package:rice/palette.dart';
import 'package:rice/widgets/rice_radio.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24) +
                  const EdgeInsets.only(top: 20, bottom: 6),
              child: const Text(
                '언어',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Palette.dark,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      RiceRadio(value: true, onChanged: (_) {}),
                      const Text(
                        '한국어 (Korean)',
                        style: TextStyle(fontSize: 16, color: Palette.dark),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RiceRadio(value: false, onChanged: (_) {}),
                      const Text(
                        '영어 (English)',
                        style: TextStyle(fontSize: 16, color: Palette.dark),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24) +
                  const EdgeInsets.only(top: 20, bottom: 6),
              child: const Text(
                '위젯 식당 설정',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Palette.dark,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      RiceRadio(value: true, onChanged: (_) {}),
                      const Text(
                        '제 1학생식당',
                        style: TextStyle(fontSize: 16, color: Palette.dark),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RiceRadio(value: false, onChanged: (_) {}),
                      const Text(
                        '제 2학생식당',
                        style: TextStyle(fontSize: 16, color: Palette.dark),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            DefaultTextStyle.merge(
              style: const TextStyle(fontSize: 14, color: Palette.grey),
              child: const Column(
                children: [
                  Text('밥인지 v1.0.0'),
                  Text('Currently Managed by GSA Infoteam'),
                  Text('Originally Made by Hidden Layer'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
