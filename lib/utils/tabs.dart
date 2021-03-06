import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upload_image/projectdetails.dart';
import 'package:upload_image/uploadsiteimages.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:cache_image/cache_image.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}


class _TabsState extends State<Tabs> {
  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }

  final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://userlogin-12f9f.appspot.com');  //gs://userlogin-12f9f.appspot.com/Reciepts Images

  Uint8List imageBytes;
  String errorMsg;


_TabsState() {

  String filename = 'gs://userlogin-12f9f.appspot.com/Reciepts Images/';

  storage.ref().child(filename).getData(10000000).then((data) =>
      setState(() {
        imageBytes = data;
      })
  ).catchError((e) =>
      setState(() {
        errorMsg = e.error;
      })
  );
}








  @override
  Widget build(BuildContext context) {


    var img = imageBytes != null ? Image.memory(
      imageBytes,
      fit: BoxFit.cover,
    ) : Text(errorMsg != null ? errorMsg : "Loading...");

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.receipt)),
                Tab(icon: Icon(Icons.image)),


              ],
            ),
            title: Text('Recipts || Site images'),
          ),
//          body: TabBarView(
//            children: [
//              Icon(Icons.receipt),
//              Icon(Icons.image),
//             // new ListTile(onTap: (){Navigator.of(context).pushNamed('/uploadpicture');},
//
//            ]),
          
          body: TabBarView(
            children: <Widget>[




              new Column(
                children: <Widget>[
           new Container(
             height: 300,
          child: Center( child: img,)
      ),
                  // Icon(Icons.receipt),
                new FloatingActionButton(
              onPressed: getImage,
                tooltip: 'Add Image',
                child: new Icon(Icons.camera_alt),

              ),
//              new OutlineButton(
//                    child: Text('Uplaod Receipt'),
//                    onPressed: () {
//                      Navigator.of(context).pushNamed('/uploadreciepts');
//                    },
//                  )
                ],
              ),
              new Column(
                children: <Widget>[
                  new Container(
                      height: 360,
                      child: Center( child: sampleImage == null ? Text('No images') : enableUpload2(),)

//                children: <Widget>[
//                  //Icon(Icons.image),
//                  new OutlineButton(
//                    child: Text('Upload Site Images'),
//                    onPressed: () {
//                      Navigator.of(context).pushNamed('/uploadsiteimages');
//                    },
//                  )
//                ],
              ),
                  new FloatingActionButton(
                    onPressed: getImage,
                    tooltip: 'Add Image',
                    child: new Icon(Icons.camera_alt),

                  ),
            ],
          ),


        ]),
      ),
    )
    );}


  Widget enableUpload() {
    String filename = sampleImage.path;
    List splitFileName = filename.split("/");
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
                    final StorageReference firebaseStorageRef = FirebaseStorage
                        .instance.ref().child(
                        'Reciepts Images/$name/$baseName');
                    final StorageUploadTask task = firebaseStorageRef.putFile(
                        sampleImage);
                    Navigator.of(context).pushNamed('/projectdetails');
                  }
              ),

            ])

    );
  }



  Widget enableUpload2() {
    String filename = sampleImage.path;
    List splitFileName = filename.split("/");
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
                    final StorageReference firebaseStorageRef = FirebaseStorage
                        .instance.ref().child(
                        'Site Images/$name/$baseName');
                    final StorageUploadTask task = firebaseStorageRef.putFile(
                        sampleImage);
                    Navigator.of(context).pushNamed('/projectdetails');
                  }
              ),

            ])

    );
  }

}