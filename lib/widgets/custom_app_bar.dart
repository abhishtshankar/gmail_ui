import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffADD8E6), // Light blue background color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0), // Round the bottom-left corner
          bottomRight: Radius.circular(20.0), // Round the bottom-right corner
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText( title:"General Tab"),
      ),
    );
  }
}