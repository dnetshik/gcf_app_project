import 'package:flutter/material.dart';
import 'addProj.dart';
import 'services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllUsersPage extends StatefulWidget {
  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {

  QuerySnapshot Projects;


  ProjectMedthods ProjectObj = new ProjectMedthods();

  @override
  void initState() {
    ProjectObj.getUserData().then((results) {
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
        title: Text('Users'),
      ),

        body: _ProjectList(),
    );
  }



  Widget _ProjectList() {

    if (Projects != null) {
      //print("Proj is: " + Projects.documents.toString());
      //int itemcounter = Projects.documents.length ;
     // print(itemcounter);
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:  Projects.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          print("Project2");
          return new Column(children: <Widget>[
            Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white30),
                child: ListTile(
                    leading: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.access_time),
                            Padding(padding: EdgeInsets.only(top: 7.5)),
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
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => ProjectDetails(
                                  Projects.documents[i].data[i])));
                    }),
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



