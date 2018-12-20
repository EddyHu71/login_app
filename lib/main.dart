import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,

      ),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation<double> iconAnimation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 500,)
      );

      iconAnimation = new CurvedAnimation(
        parent: animationController, 
        curve: Curves.bounceOut);
      iconAnimation.addListener(()=> this.setState((){})
      );
      animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/logo.png"),
          fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: iconAnimation.value * 100,

              ),
            new Form(
                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      )
                    ),
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                            decoration: new InputDecoration(
                            hintText: "Enter Email",
                        ),
                            keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter your password",
                          ),
                          obscureText: true,
                        ),
                        new Padding(padding: EdgeInsets.only(top : 20.0),),
                        new MaterialButton(
                            height: 40.0,
                            minWidth: 60.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Icon(Icons.arrow_forward),
                            onPressed: () => {},
                            splashColor: Colors.redAccent,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}