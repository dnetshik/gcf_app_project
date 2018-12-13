import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:upload_image/component/addprojectform.dart' as addProject;
import 'package:upload_image/services/crud.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>();
var email;


class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  String ProjectName;
  String Projectdesc;
  double Projectbudget;
  String ProjectManager; // init the step to 0th position
  String ProjectAdd;
  String ProjectStartDate;
  String ProjectEndDate;
  int ProjectEmp;
  ProjectMedthods ProjectObj = new ProjectMedthods();
  int current_step = 0;
  DateTime _dateTime = new DateTime.now();
  DateTime _Intialdate = new DateTime.now();
  String _dateselected = "";

  final TextEditingController _controller = new TextEditingController();

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Am here', style: TextStyle(fontSize: 15.0)),
            content: Text('Project Added'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: () {

                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/addProj');

                },
              )
            ],
          );
        });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    List<Step> my_steps = [
      new Step(
          // Title of the Step
          title: new Text("Details"),
          isActive: true,
          // Content, it can be any widget here. Using basic Text for this example
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Project Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    this.ProjectName = value;
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Site Address'),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    this.ProjectAdd = value;
                  }
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Project Description'),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 90,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    this.Projectdesc = value;
                  }
                },
              ),
            ],
          )),
      new Step(
          title: new Text("User"),
          content: Column(children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0)),
            Title(
                color: Colors.black,
                child: Text(
                  "Assign User:",
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
                )),
            new StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  var length = snapshot.data.documents.length;
                  DocumentSnapshot ds = snapshot.data.documents[length - 1];
                  return new Container(
                      width: 205.0,
                      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: DropdownButton(
                        hint: Text("Select username"),
                        items: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          for (int i = 0;
                              i < document.data['email'].length;
                              i++) {
                            return new DropdownMenuItem(
                              value: document.data['email'],
                              child: new Text(
                                document.data['email'].toString(),
                                style: TextStyle(
                                    fontSize: 17.5, color: Colors.black54),
                              ),
                            );
                          }
                        }).toList(),
                        value: email,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                            this.ProjectManager = email;
                          });
                        },
                      ));
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 65.0),
              child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Number of crew members",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the number of employee';
                    } else {
                      this.ProjectEmp = int.parse(value);
                    }
                  }),
            ),
          ]),
          // You can change the style of the step icon i.e number, editing, etc.
          state: StepState.editing,
          isActive: true),
      new Step(
          title: new Text("Cost & Duration"),
          content: Column(children: <Widget>[
            //datepicker form
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                labelText: 'Project start date:',
              ),
              controller: _controller,
              keyboardType: TextInputType.datetime,
              validator: (val) => isValidDob(val)
                  ? this.ProjectStartDate = val
                  : 'Not a valid date',
            ),

            new TextFormField(
              decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  labelText: 'Project end date:',
                  hintText: 'Estimated:'),
              keyboardType: TextInputType.datetime,
              validator: (val) => isValidDob(val)
                  ? this.ProjectEndDate = val
                  : 'Not a valid date',
            ),
            new TextFormField(
              decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  labelText: 'Project Cost:',
                  hintText: 'Estimated:'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  this.Projectbudget = double.parse(value);
                }
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (true) {
                    // If the form is valid, we want to show a Snackbar
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ]),
          isActive: true)
    ];

    return new Scaffold(
        // Appbar
        appBar: new AppBar(
          // Title
          title: new Text("Adding Project"),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        // Body
        body: new Container(
          child: new Form(
              autovalidate: true,
              key: _formKey,
              child: new Stepper(
                type: StepperType.horizontal,
                // Using a variable here for handling the currentStep
                currentStep: this.current_step,
                // List the steps you would like to have
                steps: my_steps,
                // Define the type of Stepper style
                // StepperType.horizontal :  Horizontal Style
                // StepperType.vertical   :  Vertical Style
                // type: StepperType.vertical,
                // Know the step that is tapped
                onStepTapped: (step) {
                  // On hitting step itself, change the state and jump to that step
                  setState(() {
                    // update the variable handling the current step value
                    // jump to the tapped step
                    current_step = step;
                  });
                  // Log function call
                  print("onStepTapped : " + step.toString());
                },
                onStepCancel: () {
                  // On hitting cancel button, change the state
                  setState(() {
                    // update the variable handling the current step value
                    // going back one step i.e subtracting 1, until its 0
                    if (current_step > 0) {
                      current_step = current_step - 1;
                    } else {
                      current_step = 0;
                    }
                  });
                  // Log function call
                  print("onStepCancel : " + current_step.toString());
                },
                // On hitting continue button, change the state
                onStepContinue: () {
                  setState(() {
                    // update the variable handling the current step value
                    // going back one step i.e adding 1, until its the length of the step
                    if (current_step < my_steps.length - 1) {
                      current_step = current_step + 1;
                    } else {
                     current_step = 0;
                      ProjectObj.addData({
                        'projectname': this.ProjectName,
                        'projectdesc': this.Projectdesc,
                        'projectmanager': this.ProjectManager,
                        'projectbudget': this.Projectbudget,
                        'projectaddress': this.ProjectAdd,
                        'projectstartdate': this.ProjectStartDate,
                        'projectenddate': this.ProjectEndDate,
                        'numberofempPerproj': this.ProjectEmp,
                      }).then((result) {
                        dialogTrigger(context);
                      }).catchError((e) {
                        print(e);
                      });
                    }
                  });
                  // Log function call
                  print("onStepContinue : " + current_step.toString());
                },
              )),
        ));
  }
}

class ProjectD {
  String ProjectName;
  String ProjectStartDate;
  String ProjectEndDate;
  String Projectdesc;
  String ProjectManager;
  double Projectbudget;
  String ProjectAdd;
  int ProjectEmp;

  ProjectD(
      this.ProjectName,
      this.Projectdesc,
      this.ProjectManager,
      this.Projectbudget,
      this.ProjectAdd,
      this.ProjectStartDate,
      this.ProjectEndDate,
      this.ProjectEmp);
}
