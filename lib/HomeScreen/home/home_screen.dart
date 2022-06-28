import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Rentax/HomeScreen/constants.dart';
import 'package:Rentax/maps.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../fav.dart';
import '../../login_page.dart';
import '../../networking/api.dart';
import '../../notifications.dart';
import '../../profile/ProfilePage.dart';
import '../../theme_helper.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';
import 'components/search_form.dart';



class HomeScreen extends StatefulWidget {
  static String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    var _drawerIconSize;
    var _drawerFontSize;
    return Scaffold(
backgroundColor: Colors.blueGrey.shade700,

      appBar: AppBar(
        title: const Text("Rentax",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.grey),
        flexibleSpace:Container(
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 2.0],
                  colors: [
                    Colors.blueGrey.shade700,
                    Colors.blueGrey.shade700
                    ,
                  ]


              ),
          ),
        ),
        actions: [

          Container(


      child: ElevatedButton(
 style: ThemeHelper().buttonStyle(),
          child: Stack(

            children: <Widget>[
              const Icon(Icons.notifications),

              Positioned(
                right: 0,
                child: Container(
                  //color: Colors.blueGrey.shade700,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                  constraints: const BoxConstraints( minWidth: 12, minHeight: 12, ),
                  child: const Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),

                ),
              )
            ],
          ),

          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Notify()),
            );
          },
      ),
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
                    Navigator.push( context, MaterialPageRoute(builder: (context) => const LoginPage()),);
                  },
                ),
              ],
            ),
          )
      ),




      drawerScrimColor: Colors.black54,

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            NewArrivalProducts(),
            PopularProducts(),
          ],
        ),
      ),
    );
  }

}
