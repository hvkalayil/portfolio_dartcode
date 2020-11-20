// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/theme.dart';

class MyWorks extends StatelessWidget {
  static const List<String> kDetails = [
    //Waverix
    'This is a simple music player app with a focus on design. '
        'It uses a neumorphistic design philosophy. '
        'It can be used both in online and offline mode. '
        'The app is released on playstore',

    //Who Am I
    'This is a simple app that can be used to store personal data. '
        'You can store social media details and personal documents all '
        'in one place. It is available online and offline. Not Deployed yet.',

    //CR Lab
    'This is a website created for the Combustion Research Lab, IIT Bombay. '
        'Its build using python by implementing FLASK framework. '
        'Database functionality is enabled using SQL Alchemy. Awaiting Deployment.',

    //Calculator
    'This is a basic calculator build using Flutter. It was intended to explore '
        'the capabilities of flutter web.',

    //Aqua ly
    'This is an online shopping website which focuses specifically on pet fishes. '
        'It uses flutter for the front end and DJANGO REST in the backend. '
        'This is a group project.'
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final bool isDesk = w > h;
    final size = isDesk ? w : h;
    return Container(
      width: isDesk ? w - 100 : w,
      height: h - 100,
      padding: EdgeInsets.all(isDesk ? 20 : 0),
      child: ListView(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              makeWorks(
                  isDesk: isDesk,
                  link:
                      'https://play.google.com/store/apps/details?id=com.hoseakalayil.musicplayer',
                  name: 'Waverix',
                  image: 'waverix.png',
                  tool: 'Flutter',
                  details: kDetails[0],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link: 'https://github.com/hvkalayil/who_am_i',
                  name: 'Who Am I',
                  image: 'whoami.png',
                  tool: 'Flutter',
                  details: kDetails[1],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link: 'http://crlab.herokuapp.com/',
                  name: 'CR Lab',
                  image: 'crl.png',
                  tool: 'Flask',
                  details: kDetails[2],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link: 'https://hvkalayil.github.io/calculator.github.io/#/',
                  name: 'Calculator',
                  image: 'icon',
                  ico: FontAwesomeIcons.calculator,
                  tool: 'Flutter Web',
                  details: kDetails[3],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link: 'https://github.com/hvkalayil/aqualy_mob',
                  name: 'Aqua.ly',
                  image: 'icon',
                  ico: FontAwesomeIcons.water,
                  tool: 'Flutter',
                  details: kDetails[4],
                  width: size),
            ],
          ),
          FlatButton(
            onPressed: () => js.context.callMethod('open',
                ['https://hvkalayil.github.io/firstportfolio.github.io/#']),
            child: Text(
              'Take a look at my 🎨',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector makeWorks(
      {bool isDesk,
      IconData ico,
      String link,
      String name,
      String image,
      String tool,
      String details,
      double width}) {
    return GestureDetector(
      onTap: () => js.context.callMethod('open', [link]),
      child: Container(
        width: isDesk ? width * 0.42 : width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: darkShadow),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: darkShadow,
                    shape: BoxShape.circle,
                  ),
                  child: image == 'icon'
                      ? Icon(
                          ico,
                          size: 28,
                          color: kAccent,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image:
                                      AssetImage('assets/graphics/$image')))),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: kAccent, fontSize: width * 0.025),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Built with ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: width * 0.015,
                              fontFamily: 'QuickSand'),
                          children: [
                            TextSpan(
                                text: tool,
                                style: const TextStyle(
                                    color: kAccent, fontFamily: 'QuickSand'))
                          ]),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              details,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
