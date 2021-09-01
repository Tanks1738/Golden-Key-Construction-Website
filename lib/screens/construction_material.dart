import 'package:flutter/material.dart';

class construction_material_Page extends StatefulWidget {
  construction_material_Page({Key? key})
      : super(key: key); //? for making the key to be non-null
  @override
  _construction_material_PageState createState() => _construction_material_PageState();
}

class _construction_material_PageState extends State< construction_material_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          centerTitle: true,
          title: Text("FInd your construction material here"),
        ),
        body: Container(
          child: Center(
              // child: Image.asset(
              //   "assets/images/QR.jpeg",
              //   width: 200,
              //   height: 200,
              //   fit: BoxFit.fill,
              // )
          ),
        ));
  }
}

