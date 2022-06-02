// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_keep/json/icons.dart';
import 'package:google_keep/screens/home_screen.dart';
import 'package:google_keep/screens/side_menu_details_page.dart';
import 'package:google_keep/theme.dart';

class SliderMenuPage extends StatefulWidget {
  SliderMenuPage({Key? key}) : super(key: key);

  @override
  State<SliderMenuPage> createState() => _SliderMenuPageState();
}

class _SliderMenuPageState extends State<SliderMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: cardColor,
        ),
        child: ListView(
          children: [
            header(),
            sectionOne(),
            sectionTwo(),
            sectionThree(),
            sectionFour(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: white.withOpacity(0.1),
          ),
        ),
      ),
      child: DrawerHeader(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30),
          child: Text(
            "Google Keep",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: white,
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Column(
      children: [
        Column(
          children: List.generate(
            2,
            (index) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (index == 0) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SideMenuDetailsPage(
                                  title: sideMenuItem[index]['text'],
                                )));
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        sideMenuItem[index]['icon'],
                        color: white.withOpacity(0.7),
                        size: 22,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        sideMenuItem[index]['text'],
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 75.0),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  Widget sectionTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            'LABELS',
            style: TextStyle(
              color: white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SideMenuDetailsPage(
                        title: sideMenuItem[index + 2]['text'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        sideMenuItem[index + 2]['icon'],
                        color: white.withOpacity(0.7),
                        size: 22,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        sideMenuItem[index + 2]['text'],
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 75.0),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  Widget sectionThree() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: List.generate(
            2,
            (index) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SideMenuDetailsPage(
                        title: sideMenuItem[index + 7]['text'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        sideMenuItem[index + 7]['icon'],
                        color: white.withOpacity(0.7),
                        size: 22,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        sideMenuItem[index + 7]['text'],
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 75.0),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  Widget sectionFour() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: List.generate(
            3,
            (index) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SideMenuDetailsPage(
                        title: sideMenuItem[index + 9]['text'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25),
                  child: Row(
                    children: [
                      Icon(
                        sideMenuItem[index + 9]['icon'],
                        color: white.withOpacity(0.7),
                        size: 22,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        sideMenuItem[index + 9]['text'],
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
