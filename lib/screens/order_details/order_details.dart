import 'package:flutter/material.dart';
import 'package:flutter_food/contants/api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'package:flutter_food/models/Order.dart';
// import 'package:flutter_food/models/Food.dart';
// import 'package:flutter_food/widgets/food_card.dart';
// import 'package:flutter_food/models/Evaluation.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../widgets/food_card.dart';
import '../../models/Evaluation.dart';

class OrderDetailScreen extends StatelessWidget {
  Order _order = Order(
    identify: 'dsdfsdf46540',
    date: '22/12/2021',
    status: 'open',
    table: 'Mesa kk',
    total: (90).toDouble(),
    comment: 'coemdsdfsd',
    foods: [
      Food(
          identify: '01',
          image:
              '${API_URL_NGROK}storage/tenants/14e500e2-05a5-45af-a603-05c2df3ea4d8/products/WSU8RnnhDWnL5kplbtPxnSb05vxECcKnOMf9aqUY.jpeg',
          description: 'Apenas teste',
          price: '10.20',
          title: 'Humburguer'),
      Food(
          identify: '02',
          image:
              '${API_URL_NGROK}storage/tenants/14e500e2-05a5-45af-a603-05c2df3ea4d8/products/rrmzNZnvxPJp1HdQ0avY9br4xo4zaEOGbWi2Ec6N.jpeg',
          description: 'Apenas teste 02',
          price: '10.20',
          title: 'Açaí'),
    ],
    evaluation: [
      // Evaluation(
      //   comment: 'Pedido muito bom ',
      //   nameUser: 'André',
      //   stars: 4,
      // ),
      // Evaluation(
      //   comment: 'Pedido muito bom  02',
      //   nameUser: 'André 02',
      //   stars: 5,
      // ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Detalhes do Pedido'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _builOrdeDetails(context),
      ),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _builOrdeDetails(context) {
    return Container(
      padding: EdgeInsets.all(12),
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeTextOrder('Número', _order.identify),
          _makeTextOrder('Data', _order.date),
          _makeTextOrder('Status', _order.status),
          _makeTextOrder('Total', _order.total.toString()),
          _makeTextOrder('Mesa', _order.table),
          _makeTextOrder('Comentário', _order.comment),
          Container(height: 30),
          Text(
            'Comidas:',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          _buildFoodsOrder(),
          Container(height: 30),
          Text(
            'Avaliações:',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          _buildEvaluationsOrder(context),
        ],
      ),
    );
  }

  _makeTextOrder(String textLabel, String textValue) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Row(
        children: <Widget>[
          Text(
            textLabel + ' : ',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            textValue,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodsOrder() {
    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: _order.foods.length,
        itemBuilder: (context, index) {
          final Food food = _order.foods[index];
          return FoodCard(
            identify: food.identify,
            description: food.description,
            image: food.image,
            price: food.price,
            title: food.title,
            notShowIconCart: true,
          );
        },
      ),
    );
  }

  Widget _buildEvaluationsOrder(context) {
    return _order.evaluation.length > 0
        ? Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _order.evaluation.length,
              itemBuilder: (context, index) {
                final Evaluation evaluation = _order.evaluation[index];
                return _buildEvaluationItem(evaluation, context);
              },
            ),
          )
        : Container(
            height: 40,
            margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/evaluation-order');
              },
              color: Colors.orange,
              elevation: 2.5,
              child: Text('Avaliar o pedido'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.orangeAccent)),
            ),
          );
  }

  Widget _buildEvaluationItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          children: <Widget>[
            RatingBar.builder(
              initialRating: evaluation.stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
            Row(
              children: <Widget>[
                Text(
                  "${evaluation.nameUser} - ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  evaluation.comment,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //
  //
}
