import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EvaluationOrderSreen extends StatelessWidget {
  const EvaluationOrderSreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreenEvaluationOrder(context),
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
        'Avaliar o Pedido: 321651teste',
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
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Container(height: 20),
          TextFormField(
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
              onPressed: () {
                Navigator.pushNamed(context, '/evaluation-order');
              },
              color: Theme.of(context).primaryColor,
              elevation: 2.5,
              child: Text(
                'Avaliar o pedido',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
