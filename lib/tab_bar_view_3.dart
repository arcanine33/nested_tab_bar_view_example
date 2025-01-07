import 'package:flutter/material.dart';

class TabBarView3 extends StatelessWidget {
  const TabBarView3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('TabBarView3 Item $index'),
          );
        });
  }
}
