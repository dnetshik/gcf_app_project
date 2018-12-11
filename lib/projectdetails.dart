import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/crud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'utils/utils.dart' as util;
import 'dart:async';
import 'dart:io';

import 'dart:async';
import 'utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class ProjectDetailsPage extends StatefulWidget {
  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
//  final ProjectD proj;

  QuerySnapshot Projects;


  ProjectMedthods ProjectObj = new ProjectMedthods();
//  ProjectDetails(this.proj);

  @override
  void initState() {
    ProjectObj.getSpecificProjData().then((results) {
      setState(() {
        Projects =  results;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var getprojname =  Projects.documents[0].data['projectname'];
    var getprojdesc =  Projects.documents[0].data['projectdesc'];

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
//                          Text(getprojname , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                          Text(getprojdesc, style: TextStyle(color: Colors.blueAccent)),
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


