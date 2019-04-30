import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget newButton(String buttonText) {
    return Expanded(
        child: new OutlineButton(
          child: new Text(buttonText),
          padding: EdgeInsets.all(24.0),
          onPressed: () => {},
          color: Colors.lightBlue,
          textColor: Colors.blue,
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container (
        child: new Column(
      children: <Widget>[
          new Text("0"),
          new Expanded(
            child: new Divider(),
          ),

          Column(
            children: [
              Row(
                  children: [
                    newButton("7"),
                    newButton("8"),
                    newButton("9"),
                    newButton("/"),
              ],
        ),
              Row(
                  children: [
                    newButton("4"),
                    newButton("5"),
                    newButton("6"),
                    newButton("X"),
              ],
        ),
              Row(
                  children: [
                    newButton("1"),
                    newButton("2"),
                    newButton("3"),
                    newButton("-"),
              ],
        ),
              Row(
                  children: [
                    newButton("."),
                    newButton("0"),
                    newButton("00"),
                    newButton("+"),
              ],
        ),
              Row(
                  children: [
                    newButton("CLEAR"),
                    newButton("="),
              ],
        ),
              ],
            ),  
          ],
        )
      )
    );
  }
}