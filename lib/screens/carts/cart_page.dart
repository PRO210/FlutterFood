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
      appBar: AppBar(title: Text('Carrinho'), centerTitle: true),
      body: _builContentCart(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(2),
    );
  }

  Widget _builContentCart(context) {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        // _buttonCheckout(),
        // _buildFormComment(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text(
        'Tortal (3) de Items',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Container(
      //color: Colors.amber,
      height: (MediaQuery.of(context).size.height - 175),
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: 6,
        itemBuilder: (context, index) => _buildCartItem(context),
      ),
    );
  }

  Widget _buildCartItem(context) {
    return Container(
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
                'http://f14095962e4e.ngrok.io/imgs/IconeFlutterFood.png'),
            _showDetailItemCart(context),
          ],
        ),
      ),
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
}
