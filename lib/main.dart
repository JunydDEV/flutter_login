import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppPageWidget();
  }
}

class MyAppPageWidget extends State<MyAppPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/facio.png",
                width: 150,
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  EmailFieldWidget(emailController),
                  PasswordFieldWidget(passwordController),
                  LoginButtonWidget(emailController, passwordController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    super.dispose();
  }
}

class LoginButtonWidget extends StatelessWidget {
  var emailController;
  var passwordController;

  LoginButtonWidget(TextEditingController emailController,
      TextEditingController passwordController) {
    this.emailController = emailController;
    this.passwordController = passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          child: Text(
            "LOGIN",
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the user has entered by using the
                  // TextEditingController.
                  content: Text(
                      emailController.text + "," + passwordController.text),
                );
              },
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          textColor: Colors.black,
          color: Colors.white,
          splashColor: Colors.green,
        ),
      ),
    );
  }
}

class PasswordFieldWidget extends StatelessWidget {
  var passwordController;

  PasswordFieldWidget(TextEditingController passwordController) {
    this.passwordController = passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextField(
        autofocus: false,
        obscureText: true,
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: "Enter password",
          hintStyle: TextStyle(color: Colors.white, fontSize: 18),
          filled: true,
          fillColor: Colors.green,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailFieldWidget extends StatelessWidget {
  var emailController;

  EmailFieldWidget(TextEditingController emailController) {
    this.emailController = emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: TextField(
        controller: emailController,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Enter email",
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white, fontSize: 18),
          filled: true,
          fillColor: Colors.green,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
