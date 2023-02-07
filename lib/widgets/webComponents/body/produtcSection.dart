import 'package:flutter/material.dart';
import 'package:flutterweb/modelo/section.dart';
import 'package:flutterweb/widgets/components/productListView.dart';

import 'container/sectionContainer.dart';

class ProductSection extends StatelessWidget {
  Section section;
  ProductSection(this.section);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionContainer(
          title:section.title ,
          subTitle: section.subtitle,
          color: section.color,
        ),
       ProductListView(section.list)
      ],
    );
  }

}