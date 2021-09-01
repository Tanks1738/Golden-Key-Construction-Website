import 'package:flutter/material.dart';

class aboutUs_Page extends StatefulWidget {
  aboutUs_Page({Key? key})
      : super(key: key); //? for making the key to be non-null
  @override
  aboutUs_PageState createState() => aboutUs_PageState();
}

class aboutUs_PageState extends State< aboutUs_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          centerTitle: true,
          title: Text("Who are we?"),
        ),
        body: Column(

          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top:100, bottom: 2),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:   "Golden Key Construction acts as a 'Middle man' between workers and people wanting to build.\n"
                      " We provide an informative online platform that guides users wanting to build their dream homes.\n"
                      "We also provide a platform for independent contractors to market themselves.\n\n"

                  "We have developed app can act as an online intermediary between Contractors, Engineers, Architects, Designers, Suppliers, Sub-contractors and the public."
                      "Central online space which can help guide individuals and businesses step by step in the construction space to help them build successful projects.",
                  

                  style:TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,

                  ),
                )


              ),
            ),
          ]
        ),

    );
  }
}

