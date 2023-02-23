import 'package:flutter/material.dart';
import 'package:news_app/core/style/mytheme.dart';
import 'package:news_app/view/search/search_screen.dart';
import 'package:news_app/view/settings_screen.dart';

import '../category/category_news_list_widget.dart';
import 'category_grad_view_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categoryList = [
    Category(
      categoryID: 'sports',
      categoryImage: 'assets/images/sports.png',
      categoryTitle: 'Sports',
      categoryBackground: MyTheme.redColor,
    ),
    Category(
      categoryID: 'general',
      categoryImage: 'assets/images/Politics.png',
      categoryTitle: 'General',
      categoryBackground: MyTheme.blueColor,
    ),
    Category(
      categoryID: 'health',
      categoryImage: 'assets/images/health.png',
      categoryTitle: 'Health',
      categoryBackground: MyTheme.pinkColor,
    ),
    Category(
      categoryID: 'business',
      categoryImage: 'assets/images/bussines.png',
      categoryTitle: 'Business',
      categoryBackground: MyTheme.brownColor,
    ),
    Category(
      categoryID: 'technology',
      categoryImage: 'assets/images/environment.png',
      categoryTitle: 'Technology',
      categoryBackground: MyTheme.babyBlueColor,
    ),
    Category(
      categoryID: 'science',
      categoryImage: 'assets/images/science.png',
      categoryTitle: 'Science',
      categoryBackground: MyTheme.yellowColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: MyTheme.primaryLight,
            title: Text(
              selectedItem == null ? 'News App ' : selectedItem!.categoryTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            actions: [
              selectedItem == null
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.search_outlined,
                          size: 28,
                        ),
                      ),
                    )
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 36),
                  width: double.infinity,
                  height: 110,
                  color: MyTheme.primaryLight,
                  child: Text(
                    'News App!',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: MyTheme.whiteColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedItem = null;
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headline2,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Settings',
                          style: Theme.of(context).textTheme.headline2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: selectedItem == null
              ? Container(
                  margin: EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pick your category \n of interest',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 22,
                                  childAspectRatio: 5 / 6),
                          itemBuilder: (context, index) => CategoryGridView(
                            index: index,
                            category: categoryList[index],
                            onClickItem: onClick,
                          ),
                          itemCount: categoryList.length,
                        ),
                      ),
                    ],
                  ),
                )
              : CategoryNewsList(
                  category: selectedItem!,
                ),
        ),
      ],
    );
  }

  Category? selectedItem = null;

  void onClick(Category category) {
    setState(() {
      selectedItem = category;
    });
  }
}
