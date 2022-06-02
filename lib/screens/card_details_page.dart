// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_keep/theme.dart';

import '../json/notes_json.dart';

class CardDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List img;
  final int index;
  const CardDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.img,
    required this.index,
  }) : super(key: key);

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  get index => null;

  @override
  void initState() {
    super.initState();
    setState(() {
      _title.text = widget.title;
      _description.text = widget.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _appBar(context),
      body: _body(),
      bottomSheet: getFooter(),
    );
  }

  Widget _body() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      children: [
        TextField(
          controller: _title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: white.withOpacity(0.7),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        TextField(
          maxLines: 10,
          controller: _description,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: white.withOpacity(0.7),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        Row(
          children: List.generate(
            widget.img.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: white.withOpacity(0.1)),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.img[index],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: white.withOpacity(0.7),
          size: 22,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.pin_fill,
            color: white.withOpacity(0.7),
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: white.withOpacity(0.7),
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.archive_rounded,
            color: white.withOpacity(0.7),
            size: 22,
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: black.withOpacity(0.2), spreadRadius: 1, blurRadius: 3),
        ],
        color: cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25, right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  notes[index]['title'] = _title.text;
                  notes[index]['title'] = _description.text;
                });
              },
              icon: Icon(
                Icons.add_box_rounded,
                size: 22,
                color: white.withOpacity(0.7),
              ),
            ),
            Text(
              "Edited Apr 3",
              style: TextStyle(fontSize: 12, color: white.withOpacity(0.7)),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert_rounded,
                size: 22,
                color: white.withOpacity(0.7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
