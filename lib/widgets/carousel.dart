import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore/screens/architects.dart';
import 'package:explore/screens/builders.dart';
import 'package:explore/screens/civil_engineers.dart';
import 'package:explore/screens/facebook_link.dart';
import 'package:explore/screens/painters.dart';
import 'package:explore/screens/plumbers.dart';
import 'package:explore/screens/tilers.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/painter.jpg',
    'assets/images/female-civil-engineer.jpg',
    'assets/images/architect-drawing.jpg',
    'assets/images/plumber.jpg',
    'assets/images/builder.jpg',
    'assets/images/female-tiler.jpg',
  ];

  final List<String> places = [
    'PAINTERS',
    'CIVIL ENGINEERS',
    'ARCHITECTS',
    'PLUMBERS',
    'BUILDERS',
    'TILERS',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 21 / 8,               ///Aspect ratio
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        // GestureDetector(
        //   onTap: (){
        //     if(_current == 0){
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) =>
        //         //Name of page you routing to
        //         facebook_link_page(),
        //         ),
        //       );
        //     } else if(_current == 1){
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) =>
        //         //Name of page you routing to
        //         facebook_link_page(),
        //         ),
        //       );
        //     }
        //   },
        // ),
        AspectRatio(
          aspectRatio: 20 / 8,               ///Aspect ratio
          child: Center(
            child: Text(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 20 / 8,                  ///Aspect ratio
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),

                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: screenSize.height / 30,    //changes here
                              bottom: screenSize.height / 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < places.length; i++)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onHover: (value) {
                                          setState(() {
                                            value
                                                ? _isHovering[i] = true
                                                : _isHovering[i] = false;
                                          });
                                        },
                                      //  onTap: () {
                                        //  _controller.animateToPage(i);
                                      //    GestureDetector(
                                            onTap: (){
                                              if( places[i] == "PAINTERS"){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  //Name of page you routing to
                                                  painters_Page(),
                                                  ),
                                                );
                                              } else if(places[i] == "CIVIL ENGINEERS"){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  //Name of page you routing to
                                                  civilEngineers_Page(),
                                                  ),
                                                );
                                              }else if(places[i]  == "ARCHITECTS"){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  //Name of page you routing to
                                                  archicts_Page(),
                                                  ),
                                                );
                                              }else if(places[i]  == "PLUMBERS"){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  //Name of page you routing to
                                                  plumbers_Page(),
                                                  ),
                                                );
                                              }else if(places[i]  == "BUILDERS"){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  //Name of page you routing to
                                                  builders_Page(),
                                                  ),
                                                );
                                              }else if(places[i]  == "TILERS"){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  //Name of page you routing to
                                                  tilers_Page(),
                                                  ),
                                                );
                                              }
                                            },
                                       //   );
                                 //       },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenSize.height / 80,
                                              bottom: screenSize.height / 90),
                                          child: Text(
                                            places[i],
                                            style: TextStyle(
                                              color: _isHovering[i]
                                                  ? Colors.blueGrey[900]
                                                  : Colors.blueGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: _isSelected[i],
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 400),
                                          opacity: _isSelected[i] ? 1 : 0,
                                          child: Container(
                                            height: 5,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            width: screenSize.width / 10,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}
