import 'package:explore/screens/about_us.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });
       //Website it will launch to
  String _launchUrl = 'https://twitter.com/GoldenKeyConst';
  String _launchUrl2 = 'https://m.facebook.com/goldenkeyconstruction1738/';
  String _launchUrl3 = 'https://www.instagram.com/real_goldenkeyconstruction/';


  Future<void> _launchInBrowser(String url) async{
    if(await canLaunch(url)){
      await launch(url, forceSafariVC: false, forceWebView: false,
        headers:<String, String>{'header_key':'header_value'},);
    }else {
      throw 'could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              s1,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
            onTap:(){
              if( s1 == "Twitter"){
                _launchInBrowser(_launchUrl);
              }

            },
          ),
          SizedBox(height: 5),
          GestureDetector(
            child: Text(
              s2,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
            onTap:(){
               if( s2 == "Facebook"){
              _launchInBrowser(_launchUrl2);
              }else
                if(s2 == "About Us"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                    //Name of page you routing to
                    aboutUs_Page()
                    ),
                  );
                }
            },
          ),
          SizedBox(height: 5),
          GestureDetector(
            child: Text(
              s3,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
            onTap: () {
               if( s3 == "Instagram"){
              _launchInBrowser(_launchUrl3);
              }
            },
          ),
        ],
      ),
    );
  }
}
