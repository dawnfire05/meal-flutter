import 'package:flutter/material.dart';
import 'package:meal/palette.dart';
import 'package:meal/widgets/meal_radio.dart';

enum Language { korean, english }

enum WidgetRestaurant { first, second }

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Language _language = Language.korean;
  WidgetRestaurant _widgetRestaurant = WidgetRestaurant.first;
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
                      MealRadio(
                        value: Language.korean,
                        groupValue: _language,
                        onChanged: (v) => setState(() => _language = v),
                      ),
                      const Text(
                        '한국어 (Korean)',
                        style: TextStyle(fontSize: 16, color: Palette.dark),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MealRadio(
                        value: Language.english,
                        groupValue: _language,
                        onChanged: (v) => setState(() => _language = v),
                      ),
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
                      MealRadio(
                        value: WidgetRestaurant.first,
                        groupValue: _widgetRestaurant,
                        onChanged: (v) => setState(() => _widgetRestaurant = v),
                      ),
                      const Text(
                        '제 1학생식당',
                        style: TextStyle(fontSize: 16, color: Palette.dark),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MealRadio(
                        value: WidgetRestaurant.second,
                        groupValue: _widgetRestaurant,
                        onChanged: (v) => setState(() => _widgetRestaurant = v),
                      ),
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
