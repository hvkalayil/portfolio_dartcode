import 'dart:js' as js; // ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/theme.dart';

class HomePage extends StatelessWidget {
  static const SizedBox kSmallSpacing = SizedBox(height: 10);
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final size = w > h ? w : h;
    return Container(
      width: size - 100,
      height: h - 100,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              //Image
              Container(
                decoration: const BoxDecoration(
                    boxShadow: ultraDarkShadow, shape: BoxShape.circle),
                child: CircleAvatar(
                    radius: size * 0.1,
                    backgroundColor: kAccent,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/graphics/me.png'),
                              fit: BoxFit.fitWidth)),
                    )),
              ),
              kSmallSpacing,

              //Name
              Text(
                'Hosea Varghese Kalayil',
                style: TextStyle(
                    color: kAccent,
                    fontSize: size * 0.04,
                    fontWeight: FontWeight.w900),
              ),
              kSmallSpacing,

              //Description
              SizedBox(
                width: w * 0.8,
                child: Text(
                  "Hi there, my name is Hosea Varghese."
                  " I'am a computer science student. "
                  "This is my personal portfolio where I share my works and certifications."
                  " Take a look around and ring me up if you would like to chat with me",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size * 0.02, color: Colors.grey),
                ),
              ),
              kSmallSpacing,

              SizedBox(
                width: w * 0.8,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    createShareButtons(
                        ico: FontAwesomeIcons.linkedin,
                        link:
                            'https://www.linkedin.com/in/hosea-varghese-693503121/'),
                    createShareButtons(
                        ico: FontAwesomeIcons.whatsapp,
                        link: 'https://wa.me/919207202460'),
                    createShareButtons(
                        ico: FontAwesomeIcons.envelope,
                        link: 'mailto:hoseakalayil@gmail.com'),
                    createShareButtons(
                        ico: FontAwesomeIcons.hackerrank,
                        link: 'https://www.hackerrank.com/hoseakalayil'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container createShareButtons({IconData ico, String link}) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
      decoration:
          const BoxDecoration(boxShadow: darkShadow, shape: BoxShape.circle),
      child: RaisedButton(
        onPressed: () => js.context.callMethod('open', [link]),
        color: kPrimary,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        child: Icon(
          ico,
          color: kAccent,
        ),
      ),
    );
  }
}
