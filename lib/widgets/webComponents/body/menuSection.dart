import 'package:flutter/material.dart';
import 'package:flutterweb/modelo/menu.dart';
import 'package:flutterweb/values/responsive.dart';
import 'package:flutterweb/values/stringApp.dart';
import 'package:flutterweb/widgets/webComponents/container/sectionContainer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'container/menuContainer.dart';


class MenuSection extends StatelessWidget {

  AutoScrollController _scrollController;
  MenuSection(this._scrollController);
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    return Column(
      children: [
        SectionContainer(
          title: sectionMenuTitleStr,
          subTitle: sectionMenuSubTitleStr, color: Colors.red,
        ),
        Padding(padding: responsiveApp.edgeInsetsApp.onlyExLargeTopEdgeInsets,child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              menu.length, (index) => MenuContainer(index: index,onPress:()=> scrollIndex(index+1))),
        ))
      ],
    );
  }

  scrollIndex(index){
    _scrollController.scrollToIndex(index);
  }
}