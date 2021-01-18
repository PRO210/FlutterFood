import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';
import '../../models/Food.dart';
import '../../stores/foods.store.dart';
import '../../stores/restaurant.store.dart';

import '../../contants/api.dart';

class CartScreen extends StatelessWidget {
  FoodsStore _foodsStore;
  RestaurantsStore _restaurantsStore;

  @override
  Widget build(BuildContext context) {
    _foodsStore = Provider.of<FoodsStore>(context);
    _restaurantsStore = Provider.of<RestaurantsStore>(context);

    final String titlePage = _restaurantsStore.restaurant != null
        ? "Carrinho - ${_restaurantsStore.restaurant.name}"
        : 'Carrinho';

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(titlePage),
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
        _buildTextTotalCart(),
        _buildFormComment(context),
        _buttonCheckout(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Observer(
      builder: (context) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16),
        child: Text(
          "Total (${_foodsStore.cartItems.length}) de Items",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Observer(
      builder: (context) => Container(
        height: (MediaQuery.of(context).size.height - 330),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _foodsStore.cartItems.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> itemCart = _foodsStore.cartItems[index];
            return _buildCartItem(itemCart, context);
          },
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> itemCart, context) {
    final Food food = itemCart['product'];
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
                ShowImageCacheNetwork(food.image != ''
                    ? food.image
                    : '${API_URL_NGROK}imgs/IconeFlutterFood.png'),
                _showDetailItemCart(food, itemCart, context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => _foodsStore.removeFoodCart(food),
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
        ),
      ],
    );
  }

  Widget _showDetailItemCart(
      Food food, Map<String, dynamic> itemCart, context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(food.title,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).primaryColor)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("R\$ ${food.price}",
                      style: TextStyle(color: Colors.green)),
                  Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _foodsStore.decrementFoodCart(food),
                          child: Icon(Icons.remove,
                              size: 30, color: Colors.grey.shade700),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            itemCart['qty'].toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _foodsStore.incrementFoodCart(food),
                          child: Icon(Icons.add,
                              size: 30, color: Colors.grey.shade700),
                        ),
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
    return Observer(
      builder: (context) => Container(
        child: Text(
          "Preço total : R\$ ${_foodsStore.totalCart}",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
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
