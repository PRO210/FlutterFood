import 'package:flutter/material.dart';
// import 'package:flutter_food/widgets/show_image_cached_network.dart';
// import 'package:flutter_food/widgets/flutter_bottom_navigator.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
      ),
      body: _builContentCart(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(2),
    );
  }

  Widget _builContentCart(context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        _buildFormComment(context),
        _buttonCheckout(context),
        _buildTextTotalCart()
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(16),
      child: Text(
        'Total (6) de Items',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Container(
      //Possível problema MediaQuery
      color: Colors.orangeAccent,
      height: (MediaQuery.of(context).size.height - 330),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => _buildCartItem(context),
      ),
    );
  }

  Widget _buildCartItem(context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Container(
            margin: EdgeInsets.all(2),
            child: Row(
              children: <Widget>[
                ShowImageCacheNetwork(
                    'http://232c992a87c0.ngrok.io/imgs/IconeFlutterFood.png'),
                _showDetailItemCart(context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.only(top: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Icon(
              Icons.close,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pizza',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).primaryColor)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("R\$399,00", style: TextStyle(color: Colors.green)),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove,
                            size: 24, color: Colors.grey.shade700),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(Icons.add, size: 24, color: Colors.grey.shade700),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextTotalCart() {
    return Container(
      child: Text(
        "Preço total : R\$ 499,00",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (value) {
          print('object');
        },
        decoration: InputDecoration(
          labelText: 'Comentário (Exemplo)',
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
    );
  }

  Widget _buttonCheckout(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.orange[800],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6,
            ),
          ]),
      child: RaisedButton(
        onPressed: () {
          print('object');
        },
        child: Text('Finalizar Pedido'),
        color: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  ///
  ///
}
