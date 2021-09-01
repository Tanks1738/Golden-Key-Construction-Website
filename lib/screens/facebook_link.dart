import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://flutter.dev';

class facebook_link_page extends StatefulWidget {
  facebook_link_page({Key? key})
      : super(key: key); //? for making the key to be non-null
  @override
  facebook_link_pageState createState() => facebook_link_pageState();
}

// void _launchURL() async =>
//     await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
//
// final Uri _emailLaunchUri = Uri(
//     scheme: 'mailto',
//     path: 'smith@example.com',
//     queryParameters: {
//       'subject': 'Example Subject & Symbols are allowed!'
//     }
// );

// ...

// mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
//launch(_emailLaunchUri.toString());
class facebook_link_pageState extends State<facebook_link_page> {
  //Future<void> _launched;
  String phoneNumber = '';
  String _launchUrl = 'https://www.google.com';

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
    return Material(
        child: Center(
        child: RaisedButton(
          onPressed:(){ _launchInBrowser(_launchUrl); },
          child: const Text('Launch in browser'),
        ),
      ),
    );
  }
}

// void main() => runApp(
//   const MaterialApp(
//     home: Material(
//       child: Center(
//         child: RaisedButton(
//           onPressed: _launchURL,
//           child: Text('Show Flutter homepage'),
//         ),
//       ),
//     ),
//   ),
// );

