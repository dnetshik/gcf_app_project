import 'dart:async';
import 'package:flutter_search_panel/flutter_search_panel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/crud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'utils/utils.dart' as util;

import 'dart:async';
import 'utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class DashboardPage2 extends StatefulWidget {
  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class ProjectDetails extends StatelessWidget {
  final ProjectD proj;

  QuerySnapshot Projects;


  ProjectMedthods ProjectObj = new ProjectMedthods();
  ProjectDetails(this.proj);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
       // title: Text('Project details'),
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text('Dashboard', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
        actions: <Widget>
        [
          Container
            (
            margin: EdgeInsets.only(right: 8.0),
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                Text('beclothed.com', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14.0)),
                Icon(Icons.arrow_drop_down, color: Colors.black54)
              ],
            ),
          )
        ],
      ),
      body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
      _buildTile(
      Padding
      (
      padding: const EdgeInsets.all(24.0),
      child: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Text(projectId, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
                Text('Total Views', style: TextStyle(color: Colors.blueAccent)),
              ],
            ),
            Material
              (
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24.0),
                child: Center
                  (
                    child: Padding
                      (
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                    )
                )
            )
          ]
      ),
    ),
    ),
      _buildTile(
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column
            (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Material
                  (
                    color: Colors.teal,
                    shape: CircleBorder(),
                    child: Padding
                      (
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
                    )
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                Text('General', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                Text('Images, Videos', style: TextStyle(color: Colors.black45)),
              ]
          ),
        ),
      ),
      _buildTile(
        Padding
          (
          padding: const EdgeInsets.all(24.0),
          child: Column
            (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Material
                  (
                    color: Colors.amber,
                    shape: CircleBorder(),
                    child: Padding
                      (
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.notifications, color: Colors.white, size: 30.0),
                    )
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                Text('Alerts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                Text('All ', style: TextStyle(color: Colors.black45)),
              ]
          ),
        ),
      ),
      _buildTile(
        Padding
          (
            padding: const EdgeInsets.all(24.0),
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Row
                  (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Revenue', style: TextStyle(color: Colors.green)),
                        Text('\$16K', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
                      ],
                    ),
                    /*DropdownButton
                      (
                        isDense: true,
                        value: actualDropdown,
                        onChanged: (String value) => setState(()
                        {
                          actualDropdown = value;
                          actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
                        }),
                        items: chartDropdownItems.map((String title)
                        {
                          return DropdownMenuItem
                            (
                            value: title,
                            child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
                          );
                        }).toList()
                    )*/
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 4.0)),
//                Sparkline
//                  (
//                //  data: charts[actualChart],
//                  lineWidth: 5.0,
//                  lineColor: Colors.greenAccent,
//                )
              ],
            )
        ),
      ),
      _buildTile(
        Padding
          (
          padding: const EdgeInsets.all(24.0),
          child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                Column
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>
                  [
                    Text('Shop Items', style: TextStyle(color: Colors.redAccent)),
                    Text('173', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                  ],
                ),
                Material
                  (
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center
                      (
                        child: Padding
                          (
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.store, color: Colors.white, size: 30.0),
                        )
                    )
                )
              ]
          ),
        ),
        onTap: (){} ,
  //  => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage()))
      )
          ],
        staggeredTiles: [
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(2, 220.0),
          StaggeredTile.extent(2, 110.0),
        ],
      )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
//        shadowColor: Color(0x802196F3),
        shadowColor: Colors.greenAccent[200],
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }
}
//      body: Center(
//          child: new OutlineButton(
//              borderSide: BorderSide(
//                  color: Colors.red, style: BorderStyle.solid, width: 3.0),
//              child: Text('Upload'),
//              onPressed: () {
//                Navigator.of(context).pushReplacementNamed('/uploadpicture');
//              })),
    //);
 // }
//}

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
                  decoration:
                      InputDecoration(hintText: 'Enter Project Description'),
                  onChanged: (value) {
                    this.ProjectDescription = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter Project Manager'),
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('All GCF Projects'),
          backgroundColor: Theme.of(context).backgroundColor,
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
     // int itemcounter = Projects.documents.length ;
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:  Projects.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          return new Column(children: <Widget>[
            Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
          )  ,
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(

               // decoration: BoxDecoration(color: Colors.white),
                child:  Material(
                  shadowColor: Colors.greenAccent[200],
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(12.0),
                  child: ListTile(
                    leading: Container(
                        child: Column(
                      children: <Widget>[
                        Icon(Icons.access_time,color: Colors.green[400], size: 27.9, ),
                        Padding(padding: EdgeInsets.only(top: 6.5)),
                        Text(
                            Projects.documents[i].data['projectenddate']
                                .toString()
                                .substring(0, 5),
                            style: TextStyle(fontSize: 12.0))
                      ],
                    )),
                    title: Container(
                        child: Row(children: <Widget>[
                      Text(Projects.documents[i].data['projectname'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          Padding(padding: EdgeInsets.only(bottom: 15.0))
                    ])),
                    subtitle: Text(Projects.documents[i].data['projectdesc'], maxLines: 3,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //Navigator.of(context).pop();
                      util.projectId =  Projects.documents[i].data['projectname'];
//                      Navigator.push(
//                          context,
//                          new MaterialPageRoute(
//                              builder: (context) => ProjectDetails(
//                                  Projects.documents[i].data[i])));
                      Navigator.of(context).pushNamed('/projectdetails');

                    })),
              ),
            ),

//            Divider(color: Theme.of(context).primaryColor,indent: 5.0,),
          ]);
        },
      );
    } else {
      return Text('Loading, Please wait..');
    }
  }
}

class ProjectD {
  String ProjectName;
  String Projectdesc;
  String ProjectManager;
  double Projectbudget;

  ProjectD(this.ProjectName, this.Projectdesc, this.ProjectManager,
      this.Projectbudget);
}