import 'package:flutter/material.dart';
import 'package:news_app/core/style/mytheme.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> listItems = ['English', 'Arabic', ''];
  String selectedValue = "English";

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
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Language',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 15, color: MyTheme.primaryLight),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.green, width: 2)),
                    ),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: listItems.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
