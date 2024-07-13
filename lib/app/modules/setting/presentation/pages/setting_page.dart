import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal/app/di/locator.dart';
import 'package:meal/app/modules/setting/domain/repositories/language_setting_repository.dart';

import 'package:meal/gen/strings.g.dart';
import 'package:meal/palette.dart';
import 'package:meal/app/modules/meals/presentation/widgets/meal_radio.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // final WidgetRestaurant _widgetRestaurant = WidgetRestaurant.studentUnion1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.setting.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24) +
                  const EdgeInsets.only(top: 20, bottom: 6),
              child: Text(
                context.t.setting.language.label,
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
                children: AppLocale.values
                    .map(
                      (language) => MealRadio(
                        value: language,
                        groupValue: LocaleSettings.currentLocale,
                        onChanged: (v) {
                          sl<LanguageSettingRepository>().setLanguage(v);
                          LocaleSettings.setLocale(v);
                          Intl.defaultLocale = v.languageCode;
                        },
                        child: Text(
                          context.t.setting.language.types(context: language),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Palette.dark,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24) +
            //       const EdgeInsets.only(top: 20, bottom: 6),
            //   child: Text(
            //     context.t.setting.widgetSetting.label,
            //     style: const TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.w600,
            //       color: Palette.dark,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Column(
            //     children: WidgetRestaurant.values
            //         .map(
            //           (restaurant) => Row(
            //             children: [
            //               MealRadio(
            //                 value: restaurant,
            //                 groupValue: _widgetRestaurant,
            //                 onChanged: (v) =>
            //                     setState(() => _widgetRestaurant = v),
            //                 child: Text(
            //                   context.t.setting.widgetSetting
            //                       .types(context: restaurant),
            //                   style: const TextStyle(
            //                     fontSize: 16,
            //                     color: Palette.dark,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //       )
            //       .toList(),
            // ),
            // ),
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
