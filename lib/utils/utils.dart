import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


Drawer addDrawer(context){
        return new Drawer(
            child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text('My Projects'),
                trailing: new Icon(Icons.arrow_forward)
              ),
              new ListTile(
                title: new Text('Assign user project'),
                trailing: new Icon(Icons.arrow_forward)
              ),
              new ListTile(
                  title: new Text('Close'),
                  trailing: new Icon(Icons.cancel)
              ),
            ])
    );
}
