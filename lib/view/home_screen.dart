import 'package:flutter/material.dart';
import 'package:news_app/core/style/mytheme.dart';
import 'category_grad_view_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home screen';


  List<Category>categoryList = [
    Category(
      cateoreyID: 'Sports',
      categoryImage: 'assets/images/sports.png',
      categoryTitle: 'sports',
      categoryBackground: MyTheme.redColor,
    ),
    Category(
      cateoreyID: 'Generl',
      categoryImage: 'assets/images/Politics.png',
      categoryTitle: 'politics',
      categoryBackground: MyTheme.blueColor,
    ),
    Category(
      cateoreyID: 'Health',
      categoryImage: 'assets/images/health.png',
      categoryTitle: 'health',
      categoryBackground: MyTheme.pinkColor,
    ),
    Category(
      cateoreyID: 'Bussines',
      categoryImage: 'assets/images/bussines.png',
      categoryTitle: 'bussines',
      categoryBackground: MyTheme.brownColor,
    ),
    Category(
      cateoreyID: 'Environment',
      categoryImage: 'assets/images/environment.png',
      categoryTitle: 'environment',
      categoryBackground: MyTheme.babyBlueColor,
    ),
    Category(
      cateoreyID: 'Science',
      categoryImage: 'assets/images/science.png',
      categoryTitle: 'science',
      categoryBackground: MyTheme.yellowColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color:Colors.white,
          width:double.infinity,
          height:double.infinity,
          child:Image.asset('assets/images/pattern.png',fit: BoxFit.fill,),

        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: MyTheme.primaryLight,
            title: Text('News App ',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline1,
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                )
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 36),
                  width: double.infinity,
                  height: 110,
                  color: MyTheme.primaryLight,
                  child: Text('News App!',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline2!
                        .copyWith(
                        color: MyTheme.whiteColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.menu, size: 30,),
                      SizedBox(width: 8,),
                      Text('Categories',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline2,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 30,),
                      SizedBox(width: 8,),
                      Text('Settings',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            margin:EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text('Pick your category \n of interest',
                style:Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight:FontWeight.bold,
                  color:Colors.grey.shade600
                ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding:EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing:22,
                        childAspectRatio:5/6
                    ),
                    itemBuilder: (context, index) =>
                        CategoryGridView(
                          index: index,
                          category: categoryList[index],
                        ),
                    itemCount: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
