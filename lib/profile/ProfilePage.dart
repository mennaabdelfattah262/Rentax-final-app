import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Rentax/addCar.dart';
import 'package:Rentax/theme_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen/home/home_screen.dart';
import '../fav.dart';
import '../login_page.dart';
import '../maps.dart';
//my main profile page


class ProfilePage extends StatefulWidget {
  static const String routeName = '/ProfilePage';

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  double _drawerIconSize = 24;




  @override
  Widget build(BuildContext context) {
    var _drawerFontSize;
    return Scaffold(

        appBar: AppBar(
          title: const Text("Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace:Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  colors: [ Colors.blueGrey.shade700,Colors.blueGrey.shade700,],
                )
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only( top: 16, right: 16,),

            )
          ],
        ),

        drawer: Drawer(
            child: Container(
              color: Colors.blueGrey.shade700,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration:BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.center,

                            colors: [
                              Colors.blueGrey.shade700,
                              Colors.blueGrey.shade700,
                            ]
                        )
                    ) ,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text("Menna abdelfattah",
                        style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle, size: _drawerIconSize, color: Colors.grey,),
                    title: Text('My profile', style: TextStyle(fontSize: 17, color: Colors.grey),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                  ),
                  const Divider(color: Colors.grey, height: 5,),

                  ListTile(
                    leading: Icon(Icons.map, size: _drawerIconSize, color: Colors.grey,),
                    title: Text('nearby cars', style: TextStyle(fontSize: 17, color: Colors.grey),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
                    },
                  ),
                  const Divider(color: Colors.grey, height: 5,),

                  ListTile(
                    leading: Icon(Icons.home, size: _drawerIconSize,color: Colors.grey),
                    title: Text('Home Page',style: TextStyle(fontSize: _drawerFontSize,color: Colors.grey),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
                    },
                  ),

                  const Divider(color: Colors.grey, height: 5,),
                  ListTile(
                    leading: Icon(Icons.favorite, size: _drawerIconSize,color: Colors.grey),
                    title: Text('Favourits',style: TextStyle(fontSize: _drawerFontSize,color: Colors.grey),),
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => const Fav()),);
                    },
                  ),


                  const Divider(color: Colors.grey, height: 5,),

                  ListTile(
                    leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Colors.grey),
                    title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Colors.grey),),
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => LoginPage()), );
                    },
                  ),
                ],
              ),
            )
        ),
      
        body: Container(
          color: Colors.blueGrey.shade700,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    color: Colors.blueGrey.shade700,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[

                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Stack(fit: StackFit.loose, children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
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
                                          Icons.person,
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
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 90.0, right: 100.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[

                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey.shade700,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[

                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 90.0, right: 25.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Personal Information',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),

                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Text(
                                        'name',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),


                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter your name",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter your email",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Text(
                                        'Mobile number',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter your phone number",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),

                          !_status ? _getActionButtons() : Container(),

                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 150.0, right: 25.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Edit Car',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),

                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Model',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),

                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter car model",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Color',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter color of your car"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'License ID',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter License ID"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),

                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Car number',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter car number"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Availability',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter availability time"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),


                          !_status ? _getActionButtons() : Container(),
                        ],
                      ),

                    ),

                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.blueGrey.shade700,),
                    child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),

                        child: Padding(

                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            "add car".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                        ),

                        onPressed: () {

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const AddCar()
                              ),
                                  (Route<dynamic> route) => false
                          );
                        }

                    ),
                  ),





                ],
              ),
            ],
          ),




        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                    child: const Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green.shade100,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                    child: const Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }



  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );


  }

}