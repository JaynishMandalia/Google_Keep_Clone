// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
    required GlobalKey<ScaffoldState> drawer,
  })  : _drawer = drawer,
        super(key: key);

  final Size size;
  final GlobalKey<ScaffoldState> _drawer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _drawer.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Search Notes",
                    style: TextStyle(
                      color: white.withOpacity(0.7),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.grid_view_rounded,
                    color: white.withOpacity(0.7),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/me.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
