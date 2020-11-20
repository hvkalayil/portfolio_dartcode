import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/theme.dart';

class MyCertificates extends StatelessWidget {
  static const List<String> kDetails = [
    //Python
    'A 5 course specialization available on Coursera. '
        'Its conducted by the University of Michigan',

    //Google
    'A course offered by google that explores the basics of '
        'Google Cloud Fundamentals. Available on coursera',

    //Android
    'A course that teaches the basics of native android development. '
        'Available on coursera',

    //Flutter
    'Selected as a flutter developer intern at Saudha Tech. I was responsible'
        ' for developing a mobile application for their client along with the backend'
        ' which was implemented in PHP',

    //Foodcub
    'Selected as a graphic design intern at FoodCubo. I was responsible for creating'
        ' promotional content for marketing the company in social media.'
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
                      'https://coursera.org/share/d3c3c744bc1ad6c961f5c68d44b8e872',
                  name: 'Python Specialization',
                  image: 'icon',
                  ico: FontAwesomeIcons.python,
                  details: kDetails[0],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link:
                      'https://coursera.org/share/079514b943e1fa501b0e43621b692cbd',
                  name: 'Google Cloud Fundamentals',
                  image: 'icon',
                  ico: FontAwesomeIcons.google,
                  details: kDetails[1],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link:
                      'https://drive.google.com/file/d/18fCyu89foxvkCnStevYnR5SZhuJjpUjQ/view?usp=drive_open',
                  name: 'Native Android Development',
                  image: 'icon',
                  ico: FontAwesomeIcons.android,
                  details: kDetails[2],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link:
                      'https://internshala.com/student/certificate/49511622/DEF55FDC-E434-63A9-3F48-56DAAA59C4B8',
                  name: 'Flutter Developer Intern',
                  image: 'icon',
                  ico: FontAwesomeIcons.userGraduate,
                  details: kDetails[3],
                  width: size),
              makeWorks(
                  isDesk: isDesk,
                  link:
                      'https://internshala.com/student/certificate/12515818/FC984016-30C5-62DD-0E88-C256E29041FF',
                  name: 'Graphic Design Intern',
                  image: 'icon',
                  ico: FontAwesomeIcons.userGraduate,
                  details: kDetails[4],
                  width: size),
            ],
          ),
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
                SizedBox(
                  width: width * 0.25,
                  child: Text(
                    name,
                    style: TextStyle(color: kAccent, fontSize: width * 0.025),
                  ),
                ),
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
