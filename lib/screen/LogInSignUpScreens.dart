import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets.dart';

class LogInScreen extends StatefulWidget {

  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isChecked =false;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Welcome back!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('See the list of likes of your food to order',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            SizedBox(height: 75),
            Text('Email*', style: TextStyle(fontSize: 17)),
            Textbox(text: 'Email', obscureText: false),
            SizedBox(height: 25),
            Text('Password*', style: TextStyle(fontSize: 17)),
            Textbox(text: 'Password', obscureText: true),
            Row(children: [
              Expanded(
                  child: ListTile(

                      leading: Checkbox(value: isChecked , activeColor: Colors.deepOrange, onChanged: (bool? value) {setState(() {
                        isChecked = value!;
                      });}),
                      title: Text('Remember me',
                          style: TextStyle(color: Colors.grey)),
                      horizontalTitleGap: -10,
                      contentPadding: EdgeInsets.symmetric(horizontal: 0))),
              TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password',
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold))),
            ]),
            SizedBox(height: 30),
           LargeTextButton(text: 'Login', textColor: Colors.white, color: Color(0xff10182b), onPressed:(){Navigator.pushNamed((context), 'PreferanceScreen');}),
            Center(
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Don\'t have any account?',
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SignUpScreen();
                          });
                    },
                    child: Text('Sign Up!',
                        style: TextStyle(
                            color: Color(0xff10182b),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold))),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked =false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Welcome!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('See the list of likes of your food to order',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            SizedBox(height: 50),
            Text('Email*', style: TextStyle(fontSize: 17)),
            Textbox(text: 'Email', obscureText: false),
            SizedBox(height: 25),
            Text('Password*', style: TextStyle(fontSize: 17)),
            Textbox(text: 'Password', obscureText: true),
            SizedBox(height: 25),
            Text('Confirm Password*', style: TextStyle(fontSize: 17)),
            Textbox(text: 'Confirm Password', obscureText: true),
            SizedBox(height: 30),
            LargeTextButton(text: 'Sign up', textColor: Colors.white, color: Colors.deepOrange, onPressed:(){Navigator.pushNamed((context), 'PreferanceScreen');}),
            Center(
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Already have an account?',
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return LogInScreen();
                          });

                    },
                    child: Text('Log in!',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold))),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
