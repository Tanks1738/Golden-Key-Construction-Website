import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class nhbrc extends StatefulWidget {
  nhbrc({Key? key}) : super(key: key); //? for making the key to be non-null
  @override
  _nhbrcState createState() => _nhbrcState();
}

class _nhbrcState extends State<nhbrc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          centerTitle: true,
          title: Text("National Home Builders Registration Council"),
        ),
        body: Container(

          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 100, bottom: 2, left: 15, right: 15),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "WHAT IS NHBRC?\n"
                            "The National Home Builders Registration Council (NHBRC) is a regulatory body of the home building industry. It was established in 1998 in accordance with the provisions of the Housing Consumers Protection Measures Act, 1998 (Act No. 95 of 1998)\n\n"
                            "THE IMPORTANCE OF NHBRC \n"
                            "#NHBRC serves as an confirmation that your business is legit. \n"
                            "#A registered contractor gain access to apply for tenders and government contracts. \n"
                            "#A contrator gains client's trust trust if they are registered and have a certificate. \n\n"
                            "HOW CAN ONE GET NHBRC?\n"
                            "Documents required for the registration:\n"
                            " a)Company registration \n"
                            " b)SARS tax registration verification. \n"
                            " c)If a contractor have employees, PAYE/ UIF/ SDL registration is reqiured. \n"
                            " d) If a contractor have partners, a share certificate is required. \n"
                            " e) Business bank account. \n"
                            " f)SARS tax clearance certificate. \n\n"
                            "Please scan or click the QR Code below to find out more about NHBRC services: \n\n",
                        //"NHBRC Registration: https://www.nhbrcregistration.co.za "
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Image.asset(
                    'assets/images/QR.jpeg', // On click should redirect to an URL
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )



              ],
            ),
          ),
        ));
  }

  _launchURL() async {
    const url = 'https://www.nhbrcregistration.co.za';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
