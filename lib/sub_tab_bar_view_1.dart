import 'package:flutter/material.dart';

class SubTabBarView1 extends StatelessWidget {
  const SubTabBarView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          physics: const NoImplicitScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              sliver: SliverGrid.builder(
                itemCount: 100,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('subTab one page $index'),
                  );
                },
              ),
            ),
          ],
        );
      }
    );
  }
}

class NoImplicitScrollPhysics extends AlwaysScrollableScrollPhysics {
  const NoImplicitScrollPhysics({super.parent});

  @override
  bool get allowImplicitScrolling => false;

  @override
  NoImplicitScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoImplicitScrollPhysics(parent: buildParent(ancestor));
  }
}
