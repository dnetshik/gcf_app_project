import 'dart:async';
import 'package:flutter_search_panel/flutter_search_panel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/crud.dart';

import 'dart:async';
import 'utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
class DashboardPage2 extends StatefulWidget {
  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class ProjectDetails extends StatelessWidget
{
  final ProjectD proj;
  ProjectDetails(this.proj);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Project details'),
      ),

        body: Padding(padding: EdgeInsets.symmetric(vertical: 15.0),
        child: new RaisedButton(child: Text('Press to upload'),
    onPressed: () {
      Navigator.of(context).pushReplacementNamed('/uploadpicture');
    }
    ),
        ),







//      body: Center(
//        child: new OutlineButton(
//            padding: EdgeInsets.symmetric(vertical: 15.0),
//            borderSide: BorderSide(
//                color: Colors.greenAccent, style: BorderStyle.solid, width: 3.0),
//            child: Text('Press to upload'),
//            onPressed: () {
//              Navigator.of(context).pushReplacementNamed('/uploadpicture');
//            }
//        )
//    ),
    );
  }
}


class _DashboardPage2State extends State<DashboardPage2> {
  String ProjectName;
  String ProjectDescription;
  double Projectbudget;
  String ProjectManager;

  QuerySnapshot Projects;


  ProjectMedthods ProjectObj = new ProjectMedthods();


  Future<bool> addDialog(BuildContext context) async {
    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Text('Add Data', style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter Project Name'),
                  onChanged: (value) {
                    this.ProjectName = value;
                  },

                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter Project Description'),
                  onChanged: (value) {
                    this.ProjectDescription = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter Project Manager'),

                  onChanged: (value) {
                    this.ProjectManager = value;
                  },

                ),

                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter Project budget'),

                  onChanged: (value) {
                    this.Projectbudget = double.parse(value);
                  },

                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add Project'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  ProjectObj.addData({
                    'projectname': this.ProjectName,
                    'projectdesc': this.ProjectDescription,
                    'projectmanager': this.ProjectManager,
                    'projectbudget': this.Projectbudget,

                  }).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                textColor: Colors.red,
                onPressed: () => Navigator.pop(context),

              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Job Done', style: TextStyle(fontSize: 15.0)),
            content: Text('Project Added'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    ProjectObj.getData().then((results) {
      setState(() {
        Projects = results;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Admin'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                ProjectObj.getData().then((results) {
                  setState(() {
                    Projects = results;
                  });
                });
              },
            )
          ],
        ),
        drawer: addDrawer(context),
        body: _ProjectList());
  }

  Widget _ProjectList() {
    if (Projects != null) {
      return ListView.builder(
        itemCount: Projects.documents.length,
        padding: EdgeInsets.all(3.0),
        itemBuilder: (context, i) {
          return new ListTile(
              title: Text(Projects.documents[i].data['projectname']),
              subtitle: Text(Projects.documents[i].data['projectdesc']),

              onTap: () {
                //Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ProjectDetails(Projects.documents[i].data[i])));

              }
          );
        },
      );
    } else {
      return Text('Loading, Please wait..');
    }
  }
}

class ProjectD

{
  String ProjectName;
  String Projectdesc;
  String ProjectManager;
  double Projectbudget;
  ProjectD(this.ProjectName, this.Projectdesc, this.ProjectManager, this.Projectbudget);
}
