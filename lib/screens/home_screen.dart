// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_keep/screens/card_details_page.dart';
import 'package:google_keep/screens/slider_menu.dart';
import 'package:google_keep/theme.dart';
import 'package:page_transition/page_transition.dart';

import '../components/header.dart';
import '../json/notes_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawer,
      backgroundColor: bgColor,
      drawer: SliderMenuPage(),
      body: body(),
      bottomSheet: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: cardColor,
        child: Center(
          child: SvgPicture.asset("assets/icons/google_icon.svg", width: 30),
        ),
      ),
    );
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 50),
        children: [
          Header(size: size, drawer: _drawer),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  "PINNED",
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              getGridView(),
            ],
          ),
        ],
      ),
    );
  }

  Widget getGridView() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(notes.length, (index) {
        List img = notes[index]['img'];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardDetailPage(
                  title: notes[index]['title'],
                  description: notes[index]['description'],
                  img: notes[index]['img'],
                  index: index,
                ),
              ),
            );
          },
          child: ElasticIn(
            duration: Duration(milliseconds: index * 850),
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cardColor,
                    border: Border.all(color: white.withOpacity(0.1))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, left: 8, right: 8, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notes[index]['title'],
                        style: TextStyle(
                            fontSize: 15,
                            color: white.withOpacity(0.9),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(notes[index]['description'],
                          style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: white.withOpacity(0.7),
                              fontWeight: FontWeight.w400)),
                      img.isNotEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: List.generate(
                                    img.length,
                                    (index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: white.withOpacity(0.1)),
                                            image: DecorationImage(
                                                image: NetworkImage(img[index]),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getFooter() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Container(
              width: size.width * 0.7,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_box_rounded,
                      color: white.withOpacity(0.7),
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.paintbrush,
                      color: white.withOpacity(0.7),
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic_none_rounded,
                      color: white.withOpacity(0.7),
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo,
                      color: white.withOpacity(0.7),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
