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
  
  String output = "0"; 

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed (String buttonText) {
    if (buttonText == "CLEAR") {

        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if (buttonText == ".") {

      if(_output.contains(".")) {
        print("Already contains a decimal!");
        return;
      } else {
      _output = _output + buttonText;
      } 

    } else if (buttonText == "=") {

    num2 = double.parse(output);

    if (operand == "+") {
      _output = (num1 + num2).toString();
    }

    if (operand == "-") {
      _output = (num1 + num2).toString();
    }

    if (operand == "X") {
      _output = (num1 * num2).toString();
    }

    if (operand == "/") {
      _output = (num1 / num2).toString();
    }

    num1 = 0.0;
    num2 = 0.0;
    operand = "";

  } else {

    _output = _output + buttonText;

  }

  print(_output);

  setState(() {
    output = double.parse(_output).toStringAsFixed(2);
  }); 
} 

  Widget newButton(String buttonText) {
    return Expanded(
        child: new OutlineButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          onPressed: () => 
            buttonPressed(buttonText)
          ,
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
        Container (
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 12.0,
          ),
          child: Text(output, style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
          ))),
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