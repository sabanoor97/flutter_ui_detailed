import 'package:flutter/material.dart';

class DialogsExample extends StatelessWidget {
  const DialogsExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(32.0),
        children: <Widget>[
          RaisedButton(
              color: Colors.white10,
              child: Text('Alert Dialog'),
              onPressed: () {
                // The function showDialog<T> returns Future<T>.
                // Use Navigator.pop() to return value (of type T).
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Dialog title'),
                    content: Text(
                      'Sample alert',
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                      ),
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ).then((returnVal) {
                  if (returnVal != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You clicked: $returnVal'),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ),
                    );
                  }
                });
              }),
          RaisedButton(
            color: Colors.teal,
            child: Text('Simple dialog'),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                  title: Text('Dialog Title'),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('user@example.com'),
                      onTap: () => Navigator.pop(context, 'user@example.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('user2@gmail.com'),
                      onTap: () => Navigator.pop(context, 'user2@gmail.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text('Add account'),
                      onTap: () => Navigator.pop(context, 'Add account'),
                    ),
                  ],
                ),
              ).then((returnVal) {
                if (returnVal != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You clicked: $returnVal'),
                      action: SnackBarAction(label: 'OK', onPressed: () {}),
                    ),
                  );
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.red,
            child: Text('Time Picker Dialog'),
            onPressed: () {
              DateTime now = DateTime.now();
              showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
              ).then((TimeOfDay value) {
                if (value != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${value.format(context)}'),
                      action: SnackBarAction(label: 'OK', onPressed: () {}),
                    ),
                  );
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.indigo,
            child: Text('Date Picker Dialog'),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2018),
                lastDate: DateTime(2025),
              ).then((DateTime value) {
                if (value != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Selected datetime: $value')),
                  );
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.cyan,
            child: Text('Bottom Sheet'),
            onPressed: () {
              // Or: showModalBottomSheet(), with model bottom sheet, clicking
              // anywhere will dismiss the bottom sheet.
              showBottomSheet<String>(
                context: context,
                builder: (BuildContext context) => Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black12)),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      ListTile(
                        dense: true,
                        title: Text('This is a bottom sheet'),
                      ),
                      ListTile(
                        dense: true,
                        title: Text('Click OK to dismiss'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]
            .map(
              (Widget button) => Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: button,
              ),
            )
            .toList(),
      ),
    );
  }
}
