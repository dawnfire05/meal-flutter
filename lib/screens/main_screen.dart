import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal/api/meal_api.dart';
import 'package:meal/di/locator.dart';
import 'package:meal/gen/assets.gen.dart';
import 'package:meal/palette.dart';
import 'package:meal/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final days = List.generate(5, (i) => DateTime.now().add(Duration(days: i)));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {},
          ),
          title: Text(DateFormat.MMMEd().format(DateTime.now())),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingScreen()),
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Palette.primary,
            labelColor: Palette.primary,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            dividerColor: Palette.grey,
            dividerHeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Palette.primary,
                  width: 3,
                ),
              ),
            ),
            tabs: [
              Tab(text: '제 1학생식당'),
              Tab(text: '제 2학생식당'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(
            2,
            (tabIndex) => _Meals(
              key: Key(tabIndex.toString()),
              day: days[index],
              index: tabIndex,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.dark,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          currentIndex: index,
          onTap: (day) => setState(() => index = day),
          items: days
              .map(
                (day) => BottomNavigationBarItem(
                  activeIcon: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Palette.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Text(
                    day.day.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Palette.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  label: DateFormat.E().format(day),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Meals extends StatelessWidget {
  const _Meals({
    super.key,
    required this.day,
    required this.index,
  });

  final DateTime day;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sl<MealApi>().getMeal(
          day.year,
          day.month,
          day.day,
          (index + 1).toString(),
          '0',
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const _NoMealData();
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                _MealContent(
                  title: '아침',
                  duration: '08:00 ~ 09:00',
                  menus: snapshot.data?.breakfast ?? [],
                ),
                const SizedBox(height: 16),
                _MealContent(
                  title: '점심 (일반)',
                  duration: '11:30 ~ 13:00',
                  menus: snapshot.data?.lunch ?? [],
                ),
                const SizedBox(height: 16),
                _MealContent(
                  title: '점심 (코너)',
                  duration: '11:30 ~ 13:00',
                  menus: snapshot.data?.lunchCorner ?? [],
                ),
                if (index == 0) ...[
                  const SizedBox(height: 16),
                  _MealContent(
                    title: '점심 (2층 르네상스)',
                    duration: '11:30 ~ 13:00',
                    menus: snapshot.data?.lunchRenaissance ?? [],
                  ),
                ],
                const SizedBox(height: 16),
                _MealContent(
                  title: '저녁',
                  duration: '17:00 ~ 18:30',
                  menus: snapshot.data?.dinner ?? [],
                ),
              ],
            ),
          ));
        });
  }
}

class _MealContent extends StatelessWidget {
  const _MealContent({
    required this.title,
    required this.duration,
    required this.menus,
  });

  final String title;
  final String duration;
  final List<String> menus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildTitle(),
          const SizedBox(height: 6),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, i) => Text(
              menus[i],
              style: const TextStyle(fontSize: 16, color: Palette.dark),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 2),
            itemCount: menus.length,
          ),
        ],
      ),
    );
  }

  Row _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          duration,
          style: const TextStyle(fontSize: 14, color: Color(0xFF6E6E73)),
        )
      ],
    );
  }
}

class _NoMealData extends StatelessWidget {
  const _NoMealData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.logo.svg(
            width: 120,
            height: 120,
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "등록된 식단이 없습니다.",
                style: TextStyle(
                  color: Palette.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ))
        ]);
  }
}
