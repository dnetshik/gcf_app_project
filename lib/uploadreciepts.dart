import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'utils/tabs.dart';
import 'package:upload_image/projectdetails.dart';


class UploadReceiptsPage extends StatefulWidget {
  @override
  _UploadReceiptsPageState createState() => new _UploadReceiptsPageState();
}

class _UploadReceiptsPageState extends State<UploadReceiptsPage> {
  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Upload'),
        centerTitle: true,
      ),
      body: new Center(
        child: sampleImage == null ? Text('Select an image') : enableUpload(),

      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.camera_alt),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget enableUpload() {

    String filename = sampleImage.path;
    List  splitFileName = filename.split("/");
    String baseName = splitFileName.removeLast();
    return Container(

        child: Column(
            children: <Widget>[
              Image.file(sampleImage, height: 300.0, width: 300.0),
              RaisedButton(
                  elevation: 7.0,
                  child: Text('Upload'),
                  textColor: Colors.white,
                  color: Colors.blue,

                  onPressed: () {
//                    final StorageReference firebaseStorageRef = FirebaseStorage
//                        .instance.ref().child('Reciepts Images/$name/$baseName');

//                    final StorageUploadTask task = firebaseStorageRef.putFile(
//                        sampleImage);
                    var dwnurl =

                    Navigator.of(context).pushNamed('/projectdetails');
                  }
              ),

            ])

    );}




}

