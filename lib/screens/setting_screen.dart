import 'package:flutter/material.dart';
import 'package:meal/gen/strings.g.dart';
import 'package:meal/palette.dart';
import 'package:meal/widgets/meal_radio.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Language _language = Language.korean;
  WidgetRestaurant _widgetRestaurant = WidgetRestaurant.studentUnion1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.setting.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24) +
                  const EdgeInsets.only(top: 20, bottom: 6),
              child: Text(
                t.setting.language.label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Palette.dark,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: Language.values
                    .map(
                      (language) => Row(
                        children: [
                          MealRadio(
                            value: language,
                            groupValue: _language,
                            onChanged: (v) => setState(() => _language = v),
                          ),
                          Text(
                            t.setting.language.types(context: language),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Palette.dark,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24) +
                  const EdgeInsets.only(top: 20, bottom: 6),
              child: Text(
                t.setting.widgetSetting.label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Palette.dark,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: WidgetRestaurant.values
                    .map(
                      (restaurant) => Row(
                        children: [
                          MealRadio(
                            value: restaurant,
                            groupValue: _widgetRestaurant,
                            onChanged: (v) =>
                                setState(() => _widgetRestaurant = v),
                          ),
                          Text(
                            t.setting.widgetSetting.types(context: restaurant),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Palette.dark,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
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
