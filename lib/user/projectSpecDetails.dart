import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upload_image/services/crud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:upload_image/utils/utils.dart' as util;
import 'dart:async';
import 'dart:io';
import 'package:upload_image/utils/tabs.dart';
import 'dart:async';
import 'package:upload_image/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

var name;


QuerySnapshot Projects;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
//  final ProjectD proj;





  ProjectMedthods ProjectObj = new ProjectMedthods();


//  ProjectDetails(this.proj);

  @override
  void initState() {

    if (Projects != null){
      ProjectObj.getSpecificProjData().then((results) {
        setState(() {
          Projects = results;
        });
      });

//    super.initState();
    }
    else if(Projects == null){
      ProjectObj.getSpecificProjData().then((results) {
        setState(() {
          Projects = results;
        });
      });

      super.initState();
    }
    else
      print('error');
    super.initState();
    print(Projects.toString());
  }

  bool _checkbox = false;
  bool _checked = false;

  bool _something() {
    setState(() {
      if (_checkbox == false)
        _checkbox = !_checked;
      else {
        _checkbox = _checked;
        print("changed");
      }
    });
    return _checkbox;
  }
  @override
  Widget build(BuildContext context) {
    var getprojname;
    var getprojdesc;
    var numberofempperproj;
    var projectmanger;
    var projectbudget;

    var projectobj;

    name = getprojname;



    if (Projects.documents != null) {

      getprojname =  Projects.documents[0].data['projectname'];
      getprojdesc =  Projects.documents[0].data['projectdesc'];
      numberofempperproj =  Projects.documents[0].data['numberofempPerproj'].toString();
      projectmanger =  Projects.documents[0].data['projectmanager'];
      projectbudget = Projects.documents[0].data['projectbudget'].toString();
      projectobj = Projects.documents[0].data['objectives'];
      name = getprojname;

      // TODO: implement build
      return Scaffold(
          appBar: AppBar(
            // title: Text('Project details'),
            elevation: 2.0,
            backgroundColor: Colors.white,

            title: Text(getprojname, style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 19.0)),
            actions: <Widget>
            [
              Container
                (
                margin: EdgeInsets.only(right: 8.0),
                child: Row
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  /*children: <Widget>
                  [
                    Text('beclothed.com', style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0)),
                    Icon(Icons.arrow_drop_down, color: Colors.black54)
                  ],*/
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Row
                    (

//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>
                      [
                        Container(
                            width: 240.0,
                            child: Column
                              (

//                        mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>
                              [
                                Text('Description', style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,), maxLines: 4,),
                                Text(getprojdesc,
                                    style: TextStyle(
                                        color: Colors.blueAccent)),
                              ],
                            )),
//                      Material
//                        (
//                          color: Colors.blue,
//                          borderRadius: BorderRadius.circular(24.0),
//                          child: Center
//                            (
//                              child: Padding
//                                (
//                                padding: const EdgeInsets.all(16.0),
//                                child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
//                              )
//                          )
//                      )
                      ]
                  ),
                ),
              ),
              _buildTile(
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column
                    (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
//                      Material
//                        (
//                          color: Colors.teal,
//                          shape: CircleBorder(),
//                          child: Padding
//                            (
//                            padding: const EdgeInsets.all(16.0),
//                            child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
//                          )
//                      ),
                        Text("Employees Details:", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0)),
                        Padding(padding: EdgeInsets.only(bottom: 7.5)),

                        Row(children: <Widget>[
                          Icon(Icons.person, color: Colors.green,),
                          Text(projectmanger, style: TextStyle(
                              color: Colors.blueAccent, fontSize: 12.0)),
                        ],),
                        Padding(padding: EdgeInsets.only(bottom: 3.5)),

                        Row(children: <Widget>[
                          Icon(Icons.people, color: Colors.green,),
                          Text(numberofempperproj,
                              style: TextStyle(color: Colors.blueAccent)),
                        ]),
//                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
//                      Text('General', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),


                        Padding(padding: EdgeInsets.only(bottom: 10.5)),
                        Text("Project Cost:", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0)),
                        Padding(padding: EdgeInsets.only(bottom: 7.5)),

                        Row(children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            color: Colors.amber[800],),
                          Text(projectbudget, style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700)),
                        ],),

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
                              child: Icon(
                                  Icons.notifications, color: Colors.white,
                                  size: 30.0),
                            )
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 16.0)),
                        Text('Alerts', style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                        Text(
                            'All ', style: TextStyle(color: Colors.black45)),
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
                                Text('Objectives',
                                    style: TextStyle(color: Colors.green)),
                                SizedBox(
                                  width: 326,
                                  height: 127,
                                  child: ListView.builder(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 5.0),
                                      scrollDirection: Axis.vertical,

//                                      reverse: false,
//                                      primary: true,
                                      itemCount: projectobj.length,
                                      itemBuilder: (BuildContext context,
                                          int index) =>
                                          Row(children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.only(left: 5.0)),
                                            Checkbox(
                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                activeColor: Colors.green,
                                                value: _checkbox,
                                                onChanged: (bool e ) => _something()),
                                            Text(
                                                "${projectobj[index].toString()}")
                                          ])
//                                    itemBuilder: (BuildContext context, int index) =>  Text("${projectobj[index].toString()}")

                                  ),
                                ),
//                                Checkbox(value: _test,
//                                    onChanged: (bool tester){
//                                      setState(() {
//
//                                      });
//                                    }
//                                )


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
                            Text('Upload Reciepts Pictures',
                                style: TextStyle(color: Colors.blueAccent)),
                            //Text('173', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
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
                                  child: Icon(
                                      Icons.image, color: Colors.white,
                                      size: 30.0),
                                )
                            )
                        )
                      ]
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/tabs');
                },
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
    else
    {
      return Text("please man");
    }

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


