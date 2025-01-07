import 'package:flutter/material.dart';

class TabBarView2 extends StatelessWidget {
  const TabBarView2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('TabBarView2 Item $index'),
          );
        });
  }
}
