import 'package:flutter/material.dart';
import 'package:news_app/view/category/source_tab_item.dart';
import 'package:news_app/view/news/news_list.dart';

import '../../core/model/Source.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map((source) => SourceTab(source,
                        widget.sources.indexOf(source) == selectedIndex))
                    .toList()),
            Expanded(child: NewsList(widget.sources[selectedIndex])),
          ],
        ),
      ),
    );
  }
}
