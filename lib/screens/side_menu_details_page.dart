import 'package:flutter/material.dart';
import 'package:google_keep/theme.dart';

class SideMenuDetailsPage extends StatefulWidget {
  const SideMenuDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SideMenuDetailsPage> createState() => _SideMenuDetailsPageState();
}

class _SideMenuDetailsPageState extends State<SideMenuDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: white.withOpacity(0.7),
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            color: white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
