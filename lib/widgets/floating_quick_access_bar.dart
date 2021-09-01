import 'package:explore/screens/Download_App.dart';
import 'package:explore/screens/about_us.dart';
import 'package:explore/screens/construction_material.dart';
import 'package:explore/screens/nhbrc.dart';
import 'package:explore/screens/register_company.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Page {Register, DownloadApp, NHBRC} //People

// extension on Page {
//   String get route => describeEnum(this);
// }
// final Map<Page,Widget> _fragments = {
//   Page.Register: Register_Company(),
//   Page.DownloadApp: Download_App_Page(),
//   Page.NHBRC: nhbrc(),
// };

// @override
// Widget build(BuildContext context) {
//   final navigatorKey = GlobalObjectKey<NavigatorState>(context);
//
//   // return WillPopScope(
//   //     onWillPop: () async {
//   //   if (navigatorKey.currentState.canPop()) {
//   //     navigatorKey.currentState.pop();
//   //     return false;
//   //   }
//   // return true;
//   }

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();

}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {


  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['Register Your Company','Download App', 'Acquiring an NHBRC', 'Construction Material'];


  List<InkWell> ink = [
    // InkWell(
    //   onTap: () {
    //
    //   //     Navigator.push(
    //   //   context,
    //   //   MaterialPageRoute(builder: (context) => ImageAssets()),
    //   // );
    //     },
    // )
  ];



  List<IconData> icons =

  [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },

        //Routing to a different page after clicking
        onTap: () {
          if(i==0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              //Name of page you routing to
              Register_Company()
              ),
            );
          }else if(i==1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              //Name of page you routing to
              // Download_App_Page()
                  FileUploadButton()
              ),
            );
          }else if(i==2){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              //Name of page you routing to
              nhbrc()
              ),
            );
          }else if(i==2){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              //Name of page you routing to
              nhbrc()
              ),
            );
          }else if(i==3){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              //Name of page you routing to
              construction_material_Page()
              ),
            );
          }
          },

        child: Text(
          items[i],
          style: TextStyle(
            color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {


    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Colors.blueGrey,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  items[pageIndex],
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(),
                  ),
                ),
              ),
      ),
    );
  }
}

class DestinationScreen {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
// class _DestinationScreenState extends State<DestinationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ImageAssets()),
//         );
//       },
//       // child: Text(' screenSearch ...'),
//     );
//   }
// }
