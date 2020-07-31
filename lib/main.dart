import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.elasticIn);
    animationController.duration = Duration.zero;
    animationController.forward();
    animationController.duration = Duration(milliseconds: 5500);
    animationController.reverse();
  }

  Widget _buildButton(String text, Color textColor, Color backgroundColor) =>
      Container(
        height: 50,
        width: double.infinity,
        child: FlatButton(
          onPressed: () => {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          color: backgroundColor,
        ),
      );

  Widget _buildForm() => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ]),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Email or Phone number",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(5))),
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                        child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Flexible(flex: 1, child: Text("Forgot password?")),
            Flexible(
                flex: 1,
                child: FractionallySizedBox(
                    widthFactor: .5,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, .001)
                        ..rotateX(.5 * pi * animation.value),
                      child: _buildButton(
                          "Login", Colors.white, Colors.deepOrange),
                    ))),
            Flexible(flex: 1, child: Text("Continue with social media")),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(),
                  Expanded(
                      flex: 4,
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateX(-.5 * pi * animation.value),
                          alignment: FractionalOffset.bottomCenter,
                          child: _buildButton(
                              "Facebook", Colors.white, Colors.blue))),
                  Spacer(),
                  Expanded(
                      flex: 4,
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateX(-.5 * pi * animation.value),
                          alignment: FractionalOffset.bottomCenter,
                          child: _buildButton(
                              "GitHub", Colors.white, Colors.black))),
                  Spacer()
                ],
              ),
            )
          ],
        ),
      );
  Widget _buildTitle() => Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Center(
          child: Container(
            width: double.infinity,
            color: Colors.deepOrange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 2, child: _buildTitle()),
                Expanded(flex: 5, child: _buildForm())
              ],
            ),
          ),
        ));
      },
    );
  }
}
