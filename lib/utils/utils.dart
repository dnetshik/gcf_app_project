import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:upload_image/utils/addstep.dart';
import 'addstep.dart' as step;

String currentProfilePic = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

Drawer addDrawer(context){
        return new Drawer(
            child: new ListView(
            children: <Widget>[
//            new DrawerHeader(
//            child: new Text("DRAWER HEADER.."),
//          decoration: new BoxDecoration(
//              color: Theme.of(context).primaryColor,
//          ),
//        ),
            new UserAccountsDrawerHeader(
            accountEmail: new Text("bramvbilsen@gmail.com"),
            accountName: new Text("Username"),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(currentProfilePic),
              ),
              onTap: () => print("This is your current account."),
            ),

            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                    fit: BoxFit.fill
                )
            ),),

              new ExpansionTile(
                title: new Text('Projects'),
                leading: Icon(Icons.work),
                //trailing: new Icon(Icons.arrow_forward),
                children: <Widget>[
                  new ListTile(
                    contentPadding: EdgeInsets.only(left: 30.0),
                    title: new Text('Add projects'),
                      onTap: () {
                      Navigator.of(context).pop();
                       Navigator.of(context).pushNamed('/addstep');
                      //addDialog(context)


                      //ROUTING TO STEPPERS
//                          Navigator.of(context).pop();
//                          Navigator.push(context, MaterialPageRoute(builder: (context) => step.addProjectStepper()));
//                          Navigator.of(context).push(
//                              new MaterialPageRoute(
//                                  builder: (BuildContext context) => addProjectStepper()));
                        // Navigator.of(context).pushNamed(step.addProjectStepper.routeName);





                    }
                  ),
                  new ListTile(
                    contentPadding: EdgeInsets.only(left: 30.0),
                    title: new Text('Active projects'),
                   // onTap: step.addProjectStepper.,
                  ),
                  new ListTile(
                    contentPadding: EdgeInsets.only(left: 30.0),
                    title: new Text('All projects'),
                     onTap: (){
                      Navigator.of(context).pushNamed('/addProj');
                     },

                  )
                ],

              ),
            new ExpansionTile(
              title: new Text('Upload'),
              leading: Icon(Icons.cloud_upload),
              //trailing: new Icon(Icons.arrow_forward),
              children: <Widget>[
                new ListTile(
                  contentPadding: EdgeInsets.only(left: 30.0),
                  title: new Text('Reciepts'),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.only(left: 30.0),
                  title: new Text('Site images'),
                )
              ],

            ),
            new ExpansionTile(
              title: new Text('Users'),
              leading: Icon(Icons.people_outline),
              //trailing: new Icon(Icons.arrow_forward),
              children: <Widget>[
                new ListTile(
                  contentPadding: EdgeInsets.only(left: 30.0),
                  title: new Text('Add User'),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.only(left: 30.0),
                  title: new Text('All Users'),
                )
              ],

            ),
              new ListTile(
                  title: new Text('Close'),
                  trailing: new Icon(Icons.cancel),
                onTap: () {
              Navigator.of(context).pop();
              },
              ),
            ])
    );
}

