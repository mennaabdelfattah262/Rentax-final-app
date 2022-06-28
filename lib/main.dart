import 'package:Rentax/login_page.dart';
import 'package:Rentax/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:Rentax/routes/pageRoute.dart';
import 'package:Rentax/HomeScreen/home/home_screen.dart';
import 'package:Rentax/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

  class _MyAppState extends State<MyApp> {

    bool _isLoggedIn = false;

    @override
    void initState() {
      _checkIfLoggedIn();
      super.initState();
    }


    void _checkIfLoggedIn() async {
      // check if token is there
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');
      if (token != null) {
        setState(() {
          _isLoggedIn = true;
        });
      }
    }


    @override
    Widget build(BuildContext context) {
      //var signOut;
      return MaterialApp(
        title: 'Rentax',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blueGrey.shade700,
            primaryColorDark: const Color(0xffc13131)),
        home: Scaffold(
          body: _isLoggedIn ? HomeScreen() :  LoginPage(),
        ),
        routes: <String, WidgetBuilder>{
          //SPLASH_SCREEN: (BuildContext context) => new MapScreen(),
          PROFILE: (BuildContext context) => SplashScreen(title: '',),

          pageRoutes.home: (context) => HomeScreen(),
          //pageRoutes.contact: (context) => contactPage(),
          //pageRoutes.profile: (context) => ProfilePage(),
          //pageRoutes.signOut: (context) => HomeScreen(),
        },

      );
    }

  }



