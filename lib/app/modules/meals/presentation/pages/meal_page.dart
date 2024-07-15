import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal/app/modules/meals/data/data_sources/remote/meal_api.dart';
import 'package:meal/app/di/locator.dart';
import 'package:meal/app/router/routes.dart';
import 'package:meal/gen/assets.gen.dart';
import 'package:meal/gen/strings.g.dart';
import 'package:meal/palette.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final days = List.generate(5, (i) => DateTime.now().add(Duration(days: i)));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.sync),
          //   onPressed: () {},
          // ),
          title: Text(DateFormat.MMMEd().format(days[index])),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => const SettingRoute().push(context),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Palette.primary,
            labelColor: Palette.primary,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            dividerColor: Palette.grey,
            dividerHeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Palette.primary,
                  width: 3,
                ),
              ),
            ),
            tabs: [
              Tab(
                child: Text(context.t.meal.restaurant
                    .types(context: WidgetRestaurant.studentUnion1)),
              ),
              Tab(
                child: Text(context.t.meal.restaurant
                    .types(context: WidgetRestaurant.studentUnion2)),
              ),
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
          context.t.meal.requestParams.countryCode,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: _NoMealData(),
            );
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
                  title: context.t.meal.time.types(context: MealTime.breakfast),
                  duration: '08:00 ~ 09:00',
                  menus: snapshot.data?.breakfast ?? [],
                ),
                const SizedBox(height: 16),
                _MealContent(
                  title: context.t.meal.time.types(context: MealTime.lunch),
                  duration: '11:30 ~ 13:00',
                  menus: snapshot.data?.lunch ?? [],
                ),
                const SizedBox(height: 16),
                _MealContent(
                  title:
                      context.t.meal.time.types(context: MealTime.lunchSpecial),
                  duration: '11:30 ~ 13:00',
                  menus: snapshot.data?.lunchCorner ?? [],
                ),
                if (index == 0) ...[
                  const SizedBox(height: 16),
                  _MealContent(
                    title: context.t.meal.time
                        .types(context: MealTime.lunchRenaissance),
                    duration: '11:30 ~ 13:00',
                    menus: snapshot.data?.lunchRenaissance ?? [],
                  ),
                ],
                const SizedBox(height: 16),
                _MealContent(
                  title: context.t.meal.time.types(context: MealTime.dinner),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.logo.svg(
          width: 120,
          height: 120,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            context.t.meal.widgetNoMeal.noMealMessage,
            style: const TextStyle(
              color: Palette.grey,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
