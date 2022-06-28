import 'package:Rentax/profile/ProfilePage.dart';
import 'package:Rentax/theme_helper.dart';
import 'package:flutter/material.dart';
import 'HomeScreen/constants.dart';
import 'HomeScreen/details/details_screen.dart';
import 'HomeScreen/home/home_screen.dart';
import 'fav.dart';
import 'login_page.dart';
import 'maps.dart';
import 'models/Product.dart';
import 'notifications.dart';



class PopProducts extends StatelessWidget {
  static final String title = 'Card Example';
  const PopProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: MainPage(title: title),
  );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _drawerIconSize;
  var _drawerFontSize;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blueGrey.shade700,

    appBar: AppBar(
      title: const Text("All new arrivals",
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
                  Navigator.push( context, MaterialPageRoute(builder: (context) => LoginPage()), );
                },
              ),
            ],
          ),
        )
    ),


    body: ListView(
      padding: EdgeInsets.all(20),
      children: [
        buildImageInteractionCard(),
      ],
    ),
  );



  Widget buildImageInteractionCard() =>


      SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            demo_product.length,
                (index) =>
                Padding(

                  padding:  EdgeInsets.all(20),
                  child: Card(
                    color: Colors.greenAccent.shade100,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/nissan.jpg'),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              left: 16,
                              child: Text(
                                'Nissan Sunny',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(16).copyWith(bottom: 0),
                          child: Text(
                            'Nissan sunny'
                                '    price: 300'
                                '    color: red',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              child: Text('View car'),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(product: demo_product[index]),
                                  ),
                                );
                              },
                            ),

                          ],
                        )
                      ],
                    ),

                  ),

                ),
          ),
        ),
      );




}