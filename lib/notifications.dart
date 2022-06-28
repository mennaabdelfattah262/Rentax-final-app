import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  const Notify({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Notifications",
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
