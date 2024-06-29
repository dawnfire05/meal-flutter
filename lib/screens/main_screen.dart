import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal/palette.dart';
import 'package:meal/screens/setting_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                _MealContent(
                  title: '아침',
                  duration: '08:00 ~ 09:00',
                  menus: [
                    '흑미밥',
                    '콩나물국',
                    '계란찜',
                    '생선까스*타르소스',
                    '오징어감자조림',
                    '무말랭이무침',
                    '배추김치',
                    '시리얼*우유[우유]',
                    '토스트*잼',
                    '야채샐러드*D',
                  ],
                ),
                SizedBox(height: 16),
                _MealContent(
                  title: '점심 (일반)',
                  duration: '11:30 ~ 13:00',
                  menus: [
                    '흑미밥',
                    '대패삼겹차슈덮밥',
                    '치킨너겟*머스타드',
                    '애호박나물',
                    '오복지무침',
                    '콩나물국',
                    '배추김치',
                  ],
                ),
                SizedBox(height: 16),
                _MealContent(
                  title: '점심 (코너)',
                  duration: '11:30 ~ 13:00',
                  menus: [
                    '돈까스정식(수제돈까스* 스프*모닝빵*후식음료*샐러드*단무지*배추김치) [돼지고기]',
                  ],
                ),
                SizedBox(height: 16),
                _MealContent(
                  title: '점심 (2층 르네상스)',
                  duration: '11:30 ~ 13:00',
                  menus: [
                    '잡곡밥',
                    '치즈닭갈비',
                  ],
                ),
              ],
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
          items: days
              .map((day) => BottomNavigationBarItem(
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
                  ))
              .toList(),
        ),
      ),
    );
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
