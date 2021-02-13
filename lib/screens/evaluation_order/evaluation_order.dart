import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/orders.store.dart';

class EvaluationOrderSreen extends StatelessWidget {
  String orderIdentify;
  int stars = 1;
  TextEditingController _comment = TextEditingController();
  OrdersStore _ordersStore;

  @override
  Widget build(BuildContext context) {
    _ordersStore = Provider.of<OrdersStore>(context);
    RouteSettings settings = ModalRoute.of(context).settings;
    orderIdentify = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(
        builder: (context) => _buildScreenEvaluationOrder(context),
      ),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildHearder(context),
          Container(height: 20),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHearder(context) {
    return Container(
      child: Text(
        'Avaliar o Pedido: $orderIdentify',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            child: RatingBar.builder(
              initialRating: stars.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) => stars = value.toInt(),
            ),
          ),
          Container(height: 20),
          TextFormField(
            controller: _comment,
            autocorrect: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            cursorColor: Theme.of(context).primaryColor,
            onSaved: (value) {
              print('object');
            },
            decoration: InputDecoration(
              labelText: 'Comentário (Muito bom)',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Container(height: 20),
          Container(
            child: RaisedButton(
              onPressed: () =>
                  _ordersStore.isLoading ? null : makeEvaluationOrder(context),
              color: Theme.of(context).primaryColor,
              elevation: 2.5,
              child: Text(
                _ordersStore.isLoading ? 'Avaliando . . .' : 'Avaliar o pedido',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
        ],
      ),
    );
  }

  Future makeEvaluationOrder(context) async {
    await _ordersStore.evaluationOrder(orderIdentify, stars,
        comment: _comment.text);

    Navigator.pushReplacementNamed(context, '/my-orders');
  }
}
