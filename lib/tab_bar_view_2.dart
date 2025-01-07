import 'package:flutter/material.dart';

class TabBarView2 extends StatefulWidget {
  const TabBarView2({super.key});

  @override
  State<TabBarView2> createState() => _TabBarView2State();
}

class _TabBarView2State extends State<TabBarView2>  with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 0, // between major tab space 0
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50), // optional
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
          Container(child: Text('subTab one page'),),
          Container(child: Text('subTab two page'),),
          Container(child: Text('subTab three page'),),
          Container(child: Text('subTab four page'),),
          Container(child: Text('subTab five page'),),
        ],
      ),
    );
  }
}
