import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../contants/api.dart';
import '../../../models/Restaurant.dart';

// import 'package:flutter_food/models/Restaurant.dart';
// import 'package:flutter_food/contants/api.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard({
    this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(restaurant.name);
        Navigator.pushNamed(context, '/foods', arguments: restaurant);
      },
      child: Container(
        padding: EdgeInsets.only(top: 4, right: 1, left: 1, bottom: 0),
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      //child: Image.asset('assets/images/IconeFlutterFood.png')"${API_URL_NGROK}imgs/IconeFlutterFood.png",
                      child: CachedNetworkImage(
                        imageUrl: restaurant.image != ''
                            ? restaurant.image.replaceAll(
                                'larafood', "${API_URL_NGROK_NUMBERS}")
                            : 'assets/images/IconeFlutterFood.png',
                        // imageUrl: restaurant.image,
                        placeholder: (context, url) => Container(
                          height: 80,
                          width: 80,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(color: Colors.black54),
                  Expanded(
                    child: Text(
                      restaurant.name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// http://larafood/imgs/IconeFlutterFood.png
