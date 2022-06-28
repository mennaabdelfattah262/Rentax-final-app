
import 'dart:convert';
import 'package:Rentax/login_page.dart';
import 'package:http/http.dart' as http;

import 'package:Rentax/header_widget.dart';
import 'package:flutter/material.dart';
import 'HomeScreen/home/home_screen.dart';
import 'networking/api.dart';
import 'networking/globals.dart';
import 'theme_helper.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool checkedValue = false;
  bool checkedboxValue = false;

  String _email = '';
  String _password = '';
  String _fisrtName = '';
  String _phone = '';
  String _lastName = '';


  createAccountPressed() async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
      await AuthServices.register(_fisrtName, _phone,_email, _password,_lastName);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,

      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(

                          child: Stack(
                            children: [

                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.fromLTRB(70, 70, 0, 0),
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.centerRight,
                                  icon: (
                                      Icon(Icons.add_circle)
                                  ),
                                  color: Colors.lightGreen.shade100,
                                  onPressed: () {

                                  },

                                ),
                              ),

                            ],
                          ),
                        ),


                        const SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            onChanged: (value) {
                              _fisrtName = value;
                            },
                            autofocus: false,
                            decoration: ThemeHelper().textInputDecoration('Name', 'Enter your name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),

                        ),

                        const SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            onChanged: (value) {
                              _lastName = value;
                            },
                            autofocus: false,
                            decoration: ThemeHelper().textInputDecoration('lastName', 'Enter your last name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),

                        ),


                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onChanged: (value) {
                              _email = value;
                            },
                            autofocus: false,
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),


                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onChanged: (value) {
                              _phone = value;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),

                        const SizedBox(height: 20.0),
                        Container(

                          child: TextFormField(
                            onChanged: (value) {
                              _password = value;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            autofocus: false,
                            obscureText: true,

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),

                        ),

                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkedboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkedboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    const Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkedboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),

                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(
                              context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            //onPressed: () => createAccountPressed(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  40, 10, 40, 10),
                              child: Text(
                                  'Create account',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey.shade700)),
                            ),

                              onPressed: () {

                              },
                          ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute(builder: (context) => HomeScreen()),);
                                },
                            ),
                        
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

