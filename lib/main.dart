import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/home_page.dart';
import 'package:portfolio/my_certificates.dart';
import 'package:portfolio/my_works.dart';

import 'theme.dart';

void main() {
  runApp(Portfolio());
}

const List<IconData> icons = [
  FontAwesomeIcons.home,
  FontAwesomeIcons.trophy,
  FontAwesomeIcons.stamp,
];
const List<String> messages = ['Home', 'Works', 'Certificates'];

List<Widget> content = [HomePage(), MyWorks(), MyCertificates()];

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      title: 'Hosea Varghese Kalayil',
      home: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, box) {
              //Mobile
              if (box.maxWidth < 600) {
                return Column(
                  children: [
                    // Navigation Buttons
                    Container(
                      width: box.maxWidth,
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          color: kPrimary,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 2,
                                blurRadius: 4)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: icons
                            .asMap()
                            .entries
                            .map((e) => createButtons(e.key))
                            .toList(),
                      ),
                    ),

                    //Body
                    content[currentIndex]
                  ],
                );
              }

              //Desktop
              else {
                return Row(
                  children: [
                    // Navigation Buttons
                    Container(
                      height: box.maxHeight,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: kPrimary,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 2,
                                blurRadius: 4)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Logo
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/graphics/logo.png'))),
                          ),

                          //Buttons
                          Column(
                            children: icons
                                .asMap()
                                .entries
                                .map((e) => createButtons(e.key))
                                .toList(),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),

                    //Body
                    content[currentIndex]
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Container createButtons(int index) {
    final IconData ico = icons[index];
    final String msg = messages[index];
    final bool isActive = index == currentIndex;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: darkShadow, shape: BoxShape.circle),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
              },
              color: kPrimary,
              shape: const CircleBorder(),
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(20),
              child: Icon(
                ico,
                size: 18,
                color: isActive ? kAccent : Colors.grey,
              ),
            ),
          ),
          Text(
            msg,
            style: TextStyle(color: isActive ? kAccent : Colors.grey),
          )
        ],
      ),
    );
  }
}
