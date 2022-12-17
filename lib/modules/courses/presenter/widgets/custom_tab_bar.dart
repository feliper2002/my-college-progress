import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/custom_tab_bar_item.dart';

class CustomTabBar extends StatefulWidget {
  final PageController controller;
  final List<CustomTabBarItem> items;
  const CustomTabBar(
      {super.key, required this.items, required this.controller});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentPage = 0;

  @override
  void initState() {
    WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((_) {
      widget.controller.addListener(() {
        if (widget.controller.page != null) {
          currentPage = widget.controller.page!.round();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...widget.items.map((e) {
          return InkWell(
            onTap: () {
              setState(() {
                widget.controller.jumpToPage(e.index);
              });
            },
            child: CustomTabBarItem(
              title: e.title,
              index: e.index,
              selectedColor: (e.index == currentPage ? Colors.white : null),
            ),
          );
        })
      ],
    );
  }
}
