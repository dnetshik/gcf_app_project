import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/crud.dart';
import 'utils/myprojects.dart';
import 'dart:async';
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
    );
  }
}

class _DashboardPage2State extends State<DashboardPage2> {
  String ProjectName;
  String ProjectDescription;

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

                  }).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
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
            content: Text('Added'),
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
          title: Text('Dashboard'),
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
        body: _carList());
  }

  Widget _carList() {
    if (Projects != null) {
      return ListView.builder(
        itemCount: Projects.documents.length,
        padding: EdgeInsets.all(5.0),
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

  ProjectD(this.ProjectName, this.Projectdesc);


}