//@dart=2.9
import 'dart:ui';
import 'package:explore/utils/authen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';


class Register_Company extends StatefulWidget {
  Register_Company({Key key})
      : super(key: key); //? for making the key to be non-null
  @override
  _Register_CompanyState createState() => _Register_CompanyState();
}

class _Register_CompanyState extends State<Register_Company> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String name, surname, companyName, companyAddress, contactNumber, emailAddress, areaOfExpertise,fileName,imgUrl;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // String imgUrl;

  // void chooseFileUsingFilePicker() async {
  //   //-----pick file by file picker,
  //   var result = await FilePicker.platform.pickFiles(
  //     withReadStream:
  //     true, // this will return PlatformFile object with read stream
  //   );
  //
  //   if (result != null) {
  //     setState(() {
  //       objFile = result.files.single;
  //     });
  //   }
  // }
  // void uploadSelectedFile() async {
  //   //---Create http package multipart request object
  //   final request = http.MultipartRequest(
  //     "POST",
  //     Uri.parse("Your API URL"),
  //   );
  //   //-----add other fields if needed
  //   request.fields["id"] = "abc";
  //   //-----add selected file with request
  //   request.files.add(new http.MultipartFile(
  //       "Your parameter name on server side", objFile.readStream, objFile.size,
  //       filename: objFile.name));
  //   //-------Send request
  //   var resp = await request.send();
  //   //------Read response
  //   String result = await resp.stream.bytesToString();
  //   //-------Your response
  //   print(result);
  // }

  uploadToStorage() {
    InputElement input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('newfile').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange,
      //   appBar: AppBar(
      //     iconTheme: IconThemeData(
      //     color: Colors.white,                                        ///App bar back button color
      //   ),
      //     backgroundColor: Colors.brown[300],                        ///App bar background color
      //     centerTitle: true,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //             bottomLeft:Radius.circular(30),
      //             bottomRight:Radius.circular(30)
      //         )
      //     ),
      //     title: Text(
      //       " Register Company",
      //       style: GoogleFonts.oswald(                                ///App bar font style
      //         color:Colors.white,                                     ///App bar Text colour
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //         fontStyle: FontStyle.italic,
      //       ),
      //     ),
      //   ),

        body: Container(
          height: 850,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/architect3.png"),   ///Bacground IMAGE
              fit: BoxFit.cover,
            )
          ),
            child: Center(
              child: new SingleChildScrollView(
                // child:,
                  //  child: Padding(
                   //   padding: const EdgeInsets.only(left:500.0, right:500.0,),
                      child: new Container(
                    //    padding: new EdgeInsets.only(right:500.0, left:500.0),
                        // child: Padding(
                        // padding: EdgeInsets.only(left:500.0, right:500.0),
                        width: 350.0 * MediaQuery.of(context).devicePixelRatio ,
                        child: new Form(
                            key: _key,
                            autovalidate: _validate,
                            child: userEmail == null ? FormAY():FormUI(),
                          ),
                        ),
                      ),
          //  ),
                  ),
              //  ),
            ),
          //  ),
         // ),
  //     ),

    );
  }
  Widget FormAY(){
    return new Column(
      children: [
        Text(
          "Hello.\n\n"
          "Please login first to register.",
          style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, ),textAlign: TextAlign.center,),
      ],
    );
  }
  Widget FormUI() {
    return new Column(
      children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something Went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return  Column(
                  children: [
                    imgUrl == null
                        ? Placeholder(
                      fallbackHeight: 200,
                      fallbackWidth: 400,
                    )
                        : Container(
                      height: 200,
                      width: 200,
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      onPressed: () => uploadToStorage(),
                      color: Colors.red,
                      child: Text("Insert Image"),
                    ),
                  ],
                );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
    ),
      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
           //   textAlign: TextAlign.center,
              decoration: new InputDecoration(
                 // hintText: 'Name',
                labelText: 'Name',
               // fillColor: Colors.white,
                labelStyle:
                  GoogleFonts.oswald(
                    color:Colors.white,                                ///Text colour
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
              //  color: Colors.orange,
             //   filled: false,
                alignLabelWithHint: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateName,
              onSaved: (String val) {
                name = val;
              }
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
              decoration: new InputDecoration(
                  // hintText: 'Surname'
                labelText: 'Surname',
                labelStyle:
                GoogleFonts.oswald(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  color:Colors.white,                                ///Text colour
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                    borderRadius: BorderRadius.circular(20.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateSurname,
              onSaved: (String val) {
                surname = val;
              }
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
              decoration: new InputDecoration(
                  // hintText: 'Company Name'
                labelText: 'Company Name',
                labelStyle:
                GoogleFonts.oswald(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  color:Colors.white,                                ///Text colour
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                    borderRadius: BorderRadius.circular(20.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateCompanyName,
              onSaved: (String val) {
                companyName = val;
              }
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
              decoration: new InputDecoration(
                  // hintText: 'Location'
                labelText: 'Company Address',
                labelStyle:
                GoogleFonts.oswald(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  color:Colors.white,                                ///Text colour
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                    borderRadius: BorderRadius.circular(20.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateCompanyAddress,
              onSaved: (String val) {
                companyAddress = val;
              }
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
              decoration: new InputDecoration(
                // hintText: 'Location'
                labelText: 'Contact Number',
                labelStyle:
                GoogleFonts.oswald(
                  color:Colors.white,                                ///Text colour
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color:Colors.white, width: 1), ///Border line colour
                    borderRadius: BorderRadius.circular(20.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateContactNumber,
              onSaved: (String val) {
                contactNumber = val;
              }
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
              decoration: new InputDecoration(
                // hintText: 'Location'
                labelText: 'Email Address',
                labelStyle:
                GoogleFonts.oswald(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  color:Colors.white,                                ///Text colour
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                    borderRadius: BorderRadius.circular(20.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateEmailAddress,
              onSaved: (String val) {
                emailAddress = val;
              }
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new TextFormField(
              decoration: new InputDecoration(
                  // hintText: 'Area of expertise'
                labelText: 'Area of expertise',
                labelStyle:
                GoogleFonts.oswald(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  color:Colors.white,                                ///Text colour
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                    borderRadius: BorderRadius.circular(20.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: validateAoE,
              onSaved: (String val) {
                areaOfExpertise = val;
              }
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(0.0),                                    ///Upload File
         // child:
          //new TextFormField(
            //   textAlign: TextAlign.center,
            //   decoration: new InputDecoration(
            //     // hintText: 'Name',
            //     labelText: fileName,
            //     // fillColor: Colors.white,
            //     suffixIcon: ButtonTheme(
            //       minWidth: 5.0,
            //       height: 5.0,
                  child: ElevatedButton(
    child: Text('UPLOAD NHBRC'),
    onPressed: () async {
    FilePickerResult result = await FilePicker.platform.pickFiles( type: FileType.custom,
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
    Uint8List fileBytes = result.files.first.bytes;
    fileName = result.files.first.name;

    // Upload file

    var snapshotFile = await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);

    String fileNameUrl = await snapshotFile.ref.getDownloadURL();
    setState(() {
      fileName = fileNameUrl;
    });
    final snackBar = SnackBar(content: Text('uploaded file: '+fileName));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // print(result.paths);
    }
    }, style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.orange)
                          )
                      )
                  ),
    ),
                ),
                // labelStyle:
                // GoogleFonts.oswald(
                //   color:Colors.white,                                ///Text colour
                //   fontSize: 18,
                //   fontWeight: FontWeight.w700,
                //   fontStyle: FontStyle.italic,
           //     ),
                //  color: Colors.orange,
                //   filled: false,
                // alignLabelWithHint: true,
                // enabledBorder: OutlineInputBorder(
                //   borderSide:  BorderSide(color: Colors.white, width: 1), ///Border line colour
                //   borderRadius: BorderRadius.circular(20.0),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white,width: 2), ///Border line colour when clicked
                //   borderRadius: BorderRadius.circular(25.0),
                // ),
       //       ),
              // validator: validateName,
              // onSaved: (String val) {
              //   name = val;
            //  }
     //     ),
     //   ),


        new SizedBox(height: 20.0),
    ButtonTheme(                                              ///Submit button
    minWidth: 120.0,
    height: 50.0,
        child: new ElevatedButton(
          onPressed:  _sendToServer,
         // color:Colors.orange,
          child: new Text(
              'Submit',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.orange)
                  )
              )
          ),
        ),
    ),
      ],
    );
  }


  ///Validations

  String validateName(String value) {               ///Validate Name
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateSurname(String value) {            ///validate Surname
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Surname is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Surname must be a-z and A-Z";
    }
    return null;
  }

  String validateCompanyName(String value) {       ///Validate Company Name
    String patttern = r'(^[a-zA-Z0-9 ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return " Company Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Company Name must be a-z and A-Z";
    }
    return null;
  }

  String validateCompanyAddress(String value) {     ///Validate Company Address
  //  String patttern = r'(^[a-zA-Z0-9 ]*$)';
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    alphanumeric.hasMatch('abc123');
  //  RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return " Company Address is Required";
    } else if (!alphanumeric.hasMatch('abc123')) {
      return "Company Address must be a-z and/or A-Z and 0-9";
    }
    return null;
  }

  String validateContactNumber(String value) {     ///Validate Contact Number
   // Pattern pattern = r'/^(?:[+0]9)?[0-9]{10}$/';
    String pattern = r'(^(?:9)?[0-9]{10}$)';

    RegExp regex = new RegExp(pattern);
    if (value.length == 0)
    {
      return "Contact Number is Required";
    }else
    if (!regex.hasMatch(value))
    {
      return 'Enter a valid phone number';
    }
    //  else
    //    if (value.length != 10){
    //    return "Contact Number must be 10 digits";
    // }
    return null;
  }

  String validateEmailAddress(String value) {        ///Validate Email Address
   // assert(EmailValidator.validate(emailAddress));
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return "Email Address is Required";
    } else
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateAoE(String value) {                ///Validate Area of expertise
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Area of expertise is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Area of expertise must be a-z and A-Z";
    }
    return null;
  }


 ///Sending data to database
  _sendToServer(){
    if (_key.currentState.validate() ){
      //No error in validator
      _key.currentState.save();
      FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = FirebaseFirestore.instance.collection('contractors');

        await reference.add(
            {"Name": "$name",
              "Surname": "$surname",
              "Company Name": "$companyName",
              "Location": "$companyAddress",
              "Contact Number": "$contactNumber",
              "Email address": "$emailAddress",
              "Area of Expertise": "$areaOfExpertise",
              "ImageURL": "$imgUrl",
              "Document": "$fileName"
            });
      });
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }

  }
}

