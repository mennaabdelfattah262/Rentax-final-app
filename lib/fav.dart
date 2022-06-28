
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
const Fav({Key? key}) : super(key: key);

@override
State<Fav> createState() => _Fav();
}

class _Fav extends State<Fav> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Favourites",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.grey),
        flexibleSpace:Container(
          decoration:  BoxDecoration(
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

    );
  }
}