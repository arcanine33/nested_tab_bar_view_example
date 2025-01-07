import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nested_tab_bar_view/sub_tab_bar_view_1.dart';

class TabBarView2 extends StatefulWidget {
  const TabBarView2({super.key});

  @override
  State<TabBarView2> createState() => _TabBarView2State();
}

class _TabBarView2State extends State<TabBarView2>  with TickerProviderStateMixin {
  late final TabController _tabController;
  double appBarHeight = 50;


  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 0, // between major tab space 0
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight), // optional
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.one_k),),
                  Tab(icon: Icon(Icons.two_k),),
                  Tab(icon: Icon(Icons.three_k),),
                  Tab(icon: Icon(Icons.four_k),),
                  Tab(icon: Icon(Icons.five_k),),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          SubTabBarView1(),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('subTab two page $index'),
            ),
            itemCount: 100,
          ),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('subTab three page $index'),
            ),
            itemCount: 100,
          ),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('subTab four page $index'),
            ),
            itemCount: 100,
          ),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('subTab five page $index'),
            ),
            itemCount: 100,
          ),
        ],
      ),
    );
  }

  bool _showSubTabBar(UserScrollNotification notification) {
    if (notification.depth == 2) {
      final currentOffset = PrimaryScrollController.of(context).offset;
      if (notification.direction == ScrollDirection.reverse) {
        if (currentOffset >= appBarHeight) {
          return false;
        }
        PrimaryScrollController.of(context).animateTo(
          appBarHeight,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
        );
        return false;
      }

      if (notification.direction == ScrollDirection.forward) {
        if (currentOffset <= 0.0) {
          return false;
        }
        PrimaryScrollController.of(context).animateTo(
          0.0,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
        );
        return false;
      }
    }
    return false;
  }
}
