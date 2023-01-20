import 'package:flutter/material.dart';
import 'package:news_app/core/style/mytheme.dart';

import '../../core/model/Source.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceTab(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border:
              Border.all(color: Theme.of(context).primaryColor, width: 1.5)),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: isSelected == true
                ? MyTheme.whiteColor
                : Theme.of(context).primaryColor),
      ),
    );
  }
}
