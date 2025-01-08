import 'package:flutter/material.dart';

class SubTabBarView extends StatefulWidget {
  final int index;
  const SubTabBarView({required this.index, super.key});

  @override
  State<SubTabBarView> createState() => _SubTabBarViewState();
}

class _SubTabBarViewState extends State<SubTabBarView>  {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          key: PageStorageKey<int>(widget.index),
          controller: ScrollController(),
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
                    title: Text('subTab ${widget.index + 1} page $index'),
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
