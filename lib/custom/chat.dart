import 'package:flutter/material.dart';
import 'package:mezan/constant/responsive.dart';
import 'package:mezan/fixed/colors.dart';

class Chat extends StatelessWidget {
  final String content;
  const Chat({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/logo .png'),
          ),
        ]),
        Container(
          width: ResponsiveScreen.screenWidth / 1.5,
          height: ResponsiveScreen.screenHeight / 9,
          decoration: const BoxDecoration(
              color: kPrimaryColor2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              content,
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  fontFamily: 'Lemoada'),
            ),
          ),
        )
      ],
    );
  }
}
