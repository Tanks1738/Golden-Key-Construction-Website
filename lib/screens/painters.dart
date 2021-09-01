
import 'package:flutter/material.dart';

class painters_Page extends StatefulWidget {
  painters_Page({Key? key})
      : super(key: key); //? for making the key to be non-null
  @override
  painters_PageState createState() => painters_PageState();
}

class painters_PageState extends State< painters_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.yellow[700],
      //   centerTitle: true,
      //   title: Text("What we do?"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          child: Column(
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.only(top:100, bottom: 2,left: 15,right: 15),
                  child: RichText(textAlign: TextAlign.center, text: TextSpan(text:
                  "The Painters - People who paint households to make them look bright and beautiful.\n\n\n",
                      style:TextStyle(color: Colors.pink, fontSize: 30, fontFamily: 'Montserrat', fontWeight: FontWeight.bold,),

                        children:[

                          WidgetSpan( child: Align(alignment: Alignment.center,child:Text(
                            "Types of paints that can be done on your household: \n",
                            style:TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w800, color: Colors.black,),) ),),

                          WidgetSpan( child: Align(alignment: Alignment.center,child:Text(
                            " Flat/Matte paint ",
                            style:TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, color: Colors.black,),) ,),),

                          WidgetSpan( child: Align(alignment: Alignment.center,child:
                          Text(
                            " \n"
                            "Flat/Matte paint is a type of paint that has least amount\n"
                            "of shine. It can be used to cover holes, nails, or the side\n"
                            "that is least used on the house because they are easily\n"
                            "                                          damageable.",
                            style:TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.black,),) ,),),

                          WidgetSpan(child:Text(" "),),
                        ],
                        ),
                      )
                  ),
                Container(child: new Image.asset('assets/images/paint.jpg', height: 500.0, width: 500.0, fit: BoxFit.cover,),),


                ///Eggshell
                Padding(
                    padding: const EdgeInsets.only(top:30, bottom: 2,left: 15,right: 15),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text:
                      TextSpan(
                        children:[
                          WidgetSpan( child:Align(alignment: Alignment.center,
                            child:Text(
                               "Eggshell\n",
                              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, color: Colors.black,),),),),
                          WidgetSpan( child: Align(alignment: Alignment.center,child:Text(
                            "    This type of paint is shinier that flat paint and has\n"
                            "     medium duration but is it also damageable which\n"
                            "     is why it can be used on hallways, dining rooms,\n"
                            "                                        entryways etc.",
                            style:TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.black,),) ),),
                          WidgetSpan(child:Text(" "),),
                        ],
                      ),
                    )
                ),
                Container(child: new Image.asset('assets/images/Paint2.png', height: 500.0, width: 500.0, fit: BoxFit.cover,),),


                ///Satin
                Padding(
                    padding: const EdgeInsets.only(top:100, bottom: 2,left: 15,right: 15),
                    child: RichText(textAlign: TextAlign.justify, text:
                      TextSpan(
                        children:[
                          WidgetSpan( child:Align(alignment: Alignment.center,
                            child:Text(
                              "Satin\n",
                              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, color: Colors.black,),),),),
                          WidgetSpan( child: Align(alignment: Alignment.center,child:Text(

                                "     This paint has a velvety sheen look and not easily damageable\n"
                                "     with a high duration span. Which is why it is recommendable\n"
                                "     to use it in rooms like kitchen, bathrooms, playrooms, laundry\n"
                                "                                  rooms, as well as sleeping rooms..",

                            style:TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.black,),) ),),
                          WidgetSpan(child:Text(" "),),
                        ],
                      ),
                    )
                ),
                Container(child: new Image.asset('assets/images/Paint_Satin.png', height: 500.0, width: 500.0, fit: BoxFit.cover,),),


                ///Semi gloss
                Padding(
                    padding: const EdgeInsets.only(top:100, bottom: 2,left: 15,right: 15),
                    child: RichText(textAlign: TextAlign.justify, text:
                    TextSpan(
                      children:[
                        WidgetSpan( child:Align(alignment: Alignment.center,
                          child:Text(
                            "Semi-gloss \n",
                            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, color: Colors.black,),),),),
                        WidgetSpan( child: Align(alignment: Alignment.center,child:Text(

                              "     The semi-gloss paint is shinier than satin paint and high duration\n"
                              "     span as well. They can be used for outdoor trimming or sides that \n"
                              "                                                   get moisture mostly.\n",

                          style:TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.black,),) ),),
                        WidgetSpan(child:Text(" "),),
                      ],
                    ),
                    )
                ),
                Container(child: new Image.asset('assets/images/Semi_Gloss.png', height: 500.0, width: 500.0, fit: BoxFit.cover,),),


                ///High gloss
                Padding(
                    padding: const EdgeInsets.only(top:100, bottom: 2,left: 15,right: 15),
                    child: RichText(textAlign: TextAlign.justify, text:
                    TextSpan(
                      children:[
                        WidgetSpan( child:Align(alignment: Alignment.center,
                          child:Text(
                            "High-gloss\n",
                            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, color: Colors.black,),),),),
                        WidgetSpan( child: Align(alignment: Alignment.center,child:Text(

                          "     This paint is the shiniest of them all and it has high duration span.\n"
                          "     It can be used to paints outdoors, trimming as well, and doors.\n",

                          style:TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.black,),) ),),
                        WidgetSpan(child:Text(" "),),
                      ],
                    ),
                    )
                ),
                Container(child: new Image.asset('assets/images/High_Gloss.png', height: 500.0, width: 500.0, fit: BoxFit.cover,),),
                Container(child: new Image.asset('', height: 50.0, width: 500.0, fit: BoxFit.cover,),),
              ]
          ),
        ),
      ),

    );
  }
}

//
// 1.	PAINTERS - are people who paints households to make them look bright and beautiful.
// 	Types of paints that can be done on your household:
// •	Flat/Matte paint – is a type of paint that has least amount of shine. It can be used to cover holes, nails, or the side that is least used on the house because they are easily damageable.
