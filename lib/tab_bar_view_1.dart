import 'package:flutter/material.dart';

class TabBarView1 extends StatelessWidget {
  const TabBarView1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
      return ListTile(
        title: Text('TabBarView1 Item $index'),
      );
    });
  }
}
