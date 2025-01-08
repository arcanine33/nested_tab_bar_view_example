import 'package:flutter/material.dart';
import 'package:nested_scroll_views/material.dart';

import 'tab_bar_view_1.dart';
import 'tab_bar_view_2.dart';
import 'tab_bar_view_3.dart';
import 'tab_bar_view_4.dart';

class NestedScrollViewScreen extends StatefulWidget {
  const NestedScrollViewScreen({super.key});

  @override
  State<NestedScrollViewScreen> createState() => _NestedScrollViewScreenState();
}

class _NestedScrollViewScreenState extends State<NestedScrollViewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              padding: EdgeInsets.only(left: 16, right: 16),
              indicatorColor: Colors.blue,
              tabs: [
                Tab(icon: Icon(Icons.cake),),
                Tab(icon: Icon(Icons.airplanemode_active_rounded),),
                Tab(icon: Icon(Icons.android_rounded),),
                Tab(icon: Icon(Icons.clean_hands_rounded))
              ],
            ),
            Expanded(
              child: NestedTabBarView(
                controller: _tabController,
                children: [
                  TabBarView1(),
                  TabBarView2(),
                  TabBarView3(),
                  TabBarView4(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
