import 'package:flutter/material.dart';
import 'package:upload_image/uploadsiteimages.dart';


class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}


class _TabsState extends State<Tabs>
{
  @override
  Widget build(BuildContext context) {
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
                 // Icon(Icons.receipt),

                  new OutlineButton(
                    child: Text('Uplaod Receipt'),
                    onPressed: () {Navigator.of(context).pushNamed('/uploadreciepts');},
                  )
                ],
              ),
              new Column(
                children: <Widget>[
                  //Icon(Icons.image),
                  new OutlineButton(
                    child: Text('Upload Site Images'),
                    onPressed: () {Navigator.of(context).pushNamed('/uploadsiteimages');},
                  )
                ],
              )
            ],
          ),


        ),
      ),
    );
    }

}