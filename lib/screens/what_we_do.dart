

import 'package:flutter/material.dart';

class whatWeDo_Page extends StatefulWidget {
  whatWeDo_Page({Key? key})
      : super(key: key); //? for making the key to be non-null
  @override
  whatWeDo_PageState createState() => whatWeDo_PageState();
}

class whatWeDo_PageState extends State< whatWeDo_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        centerTitle: true,
        title: Text("What we do?"),
      ),
      body: Column(

          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top:100, bottom: 2,left: 15,right: 15),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:

                    "The problem identified is that there is a gap between Contractors, Engineers, Architects, Designers, Suppliers, Sub-contractors and their target market.\n"
                    "People also find it difficult and time consuming to go to the actual construction stores to compare building material prices.\n"
                        "People don’t always know the correct order or procedure to follow when embarking on a construction project.\n"
                        "There is little to none digital advertising for the independent contractors because they do not have a digital "
                        "platform where they can advertise their products and expose themselves to potential customers.\n\n\n"

                    "What we did is build a system that will help bridge the gap between Contractors, Engineers, Architects, Designers, Suppliers, Sub-contractors and those who need it.\n"
                  "The system will also act as an Online platform for customers to have large pool of experts around them to pick from.\n\n"
                  "The app will help guide consumers with decision making by acting as a step-by-step guide to individuals or companies \n"
                        "when starting or in the middle of a construction project, which will help aid to the success of the project.\n\n"
                 "The app will also provide a gateway to acquiring the NHDRC certificate. We will provide information like what it is, how can you acquire it and why should one acquire it.",


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
