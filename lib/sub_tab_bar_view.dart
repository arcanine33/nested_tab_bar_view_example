import 'dart:async';

import 'package:flutter/material.dart';

class SubTabBarView extends StatefulWidget {
  final int index;
  const SubTabBarView({required this.index, super.key});

  @override
  State<SubTabBarView> createState() => _SubTabBarViewState();
}

class _SubTabBarViewState extends State<SubTabBarView> with AutomaticKeepAliveClientMixin {

  late ScrollController scrollController;

  Timer? _throttle;
  int throttleMilliseconds = 300;
  int itemCount = 50;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);

    print('sub tab initState: ${widget.index + 1}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Builder(
      builder: (context) {
        return CustomScrollView(
          key: PageStorageKey<int>(widget.index),
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              sliver: SliverGrid.builder(
                itemCount: itemCount,
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

  void _onScroll() {
    _throttle ??= Timer(Duration(milliseconds: throttleMilliseconds), () {
      _throttle = null;
      if (scrollController.position.extentAfter <= 300) {
        setState(() {
          itemCount += 50;
          print('load more');
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
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
