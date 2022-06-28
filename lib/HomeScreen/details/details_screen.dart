import 'package:flutter/material.dart';
import 'package:Rentax/HomeScreen/constants.dart';
import 'package:Rentax/constants.dart';
import 'package:Rentax/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme_helper.dart';
import '../home/home_screen.dart';
import 'components/color_dot.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen({Key? key, required this.product}) : super(key: key);


  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isFavorited = false;

   int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {

      if (_isFavorited){

        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.bgColor,

      appBar: AppBar(
        leading: const BackButton(color: Colors.grey),
        title:  Text("",
          style: TextStyle(color: Colors.blueGrey.shade700, fontWeight: FontWeight.bold),
        ),


        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.grey),


        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blueGrey.shade700,
                    Colors.blueGrey.shade700
                    ,

                  ]
              )
          ),
        ),

        actions: [
          Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: ( _isFavorited
                  ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border)),
                  color: Colors.greenAccent.shade100,
                onPressed: _toggleFavorite,

              ),
            ),
                  SizedBox(
                          width: 18,
                             child: SizedBox(
                             child: Text('$_favoriteCount'),
                          ),
                        )
        ],
        ),



      body: Column(
        children: [
          Image.asset(
            widget.product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration:  BoxDecoration(
                color: Colors.blueGrey.shade700,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$" + widget.product.price.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "car details",
                    ),
                  ),
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Row(
                    children: const [
                      ColorDot(
                        color: Color(0xFFB32C38),
                        isActive: false,
                      ),
                      ColorDot(
                        color: Color(0xFF141B4A),
                        isActive: true,
                      ),
                      ColorDot(
                        color: Color(0xFFF4E5C3),
                        isActive: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text('request'.toUpperCase(),style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade700)),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],

            )

            );
  }
}
