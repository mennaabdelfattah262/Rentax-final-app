import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Rentax/profile/ProfilePage.dart';
import 'HomeScreen/home/home_screen.dart';
import 'forgot_password_page.dart';
import 'forgot_password_verification_page.dart';
import 'login_page.dart';

void main() => runApp(Maps());

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rentax',
      home: MapSample(),
    );
  }
}


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}


class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();




  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.8781944995, 31.2888392264),
    zoom: 14.4746,

  );

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: const InfoWindow(title: 'My location'),
    icon:
    BitmapDescriptor.defaultMarker,
    position: LatLng(29.8781944995, 31.2888392264),


  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(29.8971, 31.3040),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kLakeMarker'),
    infoWindow: const InfoWindow(title: 'Car'),
    icon:
    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(29.8971, 31.3040),


  );

  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(29.8781944995, 31.2888392264),
        LatLng(29.8971, 31.3040),
      ],
      width: 5
  );




  @override
  Widget build(BuildContext context) {
    var _drawerIconSize;
    var _drawerFontSize;


    return new Scaffold(


      appBar: AppBar(
        title: const Text("Nearby cars",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ Colors.blueGrey.shade700, Colors.blueGrey.shade700,],
              )
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16,),

          )
        ],
      ),

      drawer: Drawer(
          child: Container(
            color: Colors.blueGrey.shade700,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.center,

                          colors: [
                            Colors.blueGrey.shade700,
                            Colors.blueGrey.shade700,
                          ]
                      )
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text("Menna abdelfattah",
                      style: TextStyle(fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle, size: _drawerIconSize,
                    color: Colors.grey,),
                  title: Text('My profile',
                    style: TextStyle(fontSize: 17, color: Colors.grey),),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                const Divider(color: Colors.grey, height: 5,),

                ListTile(
                  leading: Icon(
                    Icons.map, size: _drawerIconSize, color: Colors.grey,),
                  title: Text('nearby cars',
                    style: TextStyle(fontSize: 17, color: Colors.grey),),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Maps()));
                  },
                ),
                const Divider(color: Colors.grey, height: 5,),

                ListTile(
                  leading: Icon(
                      Icons.home, size: _drawerIconSize, color: Colors.grey),
                  title: Text('Home Page', style: TextStyle(
                      fontSize: _drawerFontSize, color: Colors.grey),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()),);
                  },
                ),

                const Divider(color: Colors.grey, height: 5,),
                ListTile(
                  leading: Icon(Icons.favorite, size: _drawerIconSize,
                      color: Colors.grey),
                  title: Text('Favourits', style: TextStyle(
                      fontSize: _drawerFontSize, color: Colors.grey),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage()),);
                  },
                ),
                const Divider(color: Colors.grey, height: 5,),
                ListTile(
                  leading: Icon(
                      Icons.verified_user_sharp, size: _drawerIconSize,
                      color: Colors.grey),
                  title: Text('Verification Page', style: TextStyle(
                      fontSize: _drawerFontSize, color: Colors.grey),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => const ForgotPasswordVerificationPage()),);
                  },
                ),
                const Divider(color: Colors.grey, height: 5,),
                ListTile(
                  leading: Icon(Icons.logout_rounded, size: _drawerIconSize,
                      color: Colors.grey),
                  title: Text('Logout', style: TextStyle(
                      fontSize: _drawerFontSize, color: Colors.grey),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginPage()),);
                  },
                ),
              ],
            ),
          )
      ),


      body:
      GoogleMap(
        mapType: MapType.normal,
        //hybrid
        markers: {_kGooglePlexMarker,
          _kLakeMarker},
        polylines: {
          _kPolyline,
        },
        polygons: {},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
          String style = await DefaultAssetBundle.of(context).loadString('assets/JSON/night.json');
controller.setMapStyle(style);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Locate car'), backgroundColor: Colors.blueGrey.shade700,
        icon: Icon(Icons.location_on),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}