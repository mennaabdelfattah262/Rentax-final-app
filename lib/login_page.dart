import 'dart:convert';
import 'package:Rentax/HomeScreen/home/home_screen.dart';
import 'package:Rentax/header_widget.dart';
import 'package:Rentax/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'forgot_password_page.dart';
import 'networking/api.dart';
import 'networking/globals.dart';
import 'registration_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  String _email = '';
  String _password = '';

  final double _headerHeight = 50;
  final Key _formKey = GlobalKey<FormState>();



  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>  HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.location_history),
            ),


            SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                      'RENTAX',
                      style: TextStyle(fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade100),
                    ),
                    const Text(
                      'Sign In into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30.0),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                onChanged: (value) {
                                  _email = value;
                                },

                                keyboardType: TextInputType.emailAddress,
                                decoration: ThemeHelper().textInputDecoration(
                                  'Email Address',)
                            ),
                            const SizedBox(height: 25.0),
                            TextFormField(
                              onChanged: (value) {
                                _password = value;
                              },

                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration:
                              ThemeHelper().passwordInputDecoration('Password'),
                            ),
                            const SizedBox(height: 25.0),


                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text("Don't have an account ?      Create"),
                              child: Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Forget password?",
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPasswordPage()));
                                              }
                                        ),

                                      ]
                                  )

                              ),
                            ),


                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(
                                  context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                       'Login',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade700)),
                                ),
                                onPressed: () => loginPressed(),
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text("Don't have an account ?      Create"),
                              child: Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Don't have an account ?"),
                                        TextSpan(
                                            text: "  Create",
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegistrationPage()));
                                              }
                                        ),

                                      ]
                                  )
                              ),
                            ),

                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}