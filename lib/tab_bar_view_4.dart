import 'package:flutter/material.dart';

class TabBarView4 extends StatelessWidget {
  const TabBarView4({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('TabBarView4 Item $index'),
          );
        });
  }
}
