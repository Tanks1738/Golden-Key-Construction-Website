import 'dart:html';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


/*class Download_App_Page extends StatefulWidget {
  Download_App_Page({Key? key})
      : super(key: key); //? for making the key to be non-null
  @override
  _Download_App_PageState createState() => _Download_App_PageState();
}*/

/*class _Download_App_PageState extends State<Download_App_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          centerTitle: true,
          title: Text("Download App"),
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
}*/

class FileUploadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles( type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'doc'],);

        if(result != null) { //single files
          //File file = File(result.files.single.path);
        } else {
          // User canceled the picker
        }


        if(result != null) {
          PlatformFile file = result.files.first;

          print(file.name);
          print(file.bytes);
          print(file.size);
          print(file.extension);
          print(file.path);
        } else {
          // User canceled the picker
        }

        if (result != null) {
          Uint8List fileBytes = result.files.first.bytes!;
          String fileName = result.files.first.name;

          // Upload file

          await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
          final snackBar = SnackBar(content: Text(fileName));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          // print(result.paths);
        }
      },
    );
  }
}



