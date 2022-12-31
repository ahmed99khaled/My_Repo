import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
 Category category;
 int index;
 CategoryGridView({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:category.categoryBackground,
        borderRadius:BorderRadius.only(
          topLeft:Radius.circular(30),
          topRight:Radius.circular(30) ,
          bottomLeft:Radius.circular(index%2 == 0?30 : 0),
          bottomRight:Radius.circular(index%2!= 0?30 : 0),
        ),
      ),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Image.asset(category.categoryImage),
          Text(category.categoryTitle,
            style:Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}

class Category{
  String cateoreyID;
  String categoryTitle;
  String categoryImage;
  Color  categoryBackground;

   Category({
     required this.cateoreyID,
     required this.categoryImage,
     required this.categoryTitle,
     required this.categoryBackground});
}