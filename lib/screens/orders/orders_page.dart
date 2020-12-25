import 'package:flutter/material.dart';

// import 'package:flutter_food/models/Order.dart';
// import 'package:flutter_food/widgets/flutter_bottom_navigator.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  List<Order> _orders = [
    new Order(date: '21/12/2020', identify: 'sdfsf65461'),
    new Order(date: '22/12/2020', identify: 'sdfsf65462'),
    new Order(date: '23/12/2020', identify: 'sdfsf65463'),
    new Order(date: '24/12/2020', identify: 'sdfsf65464'),
    new Order(date: '25/12/2020', identify: 'sdfsf65465'),
    new Order(date: '26/12/2020', identify: 'sdfsf65466'),
    new Order(date: '21/12/2020', identify: 'sdfsf65461'),
    new Order(date: '22/12/2020', identify: 'sdfsf65462'),
    new Order(date: '23/12/2020', identify: 'sdfsf65463'),
    new Order(date: '24/12/2020', identify: 'sdfsf65464'),
    new Order(date: '25/12/2020', identify: 'sdfsf65465'),
    new Order(date: '26/12/2020', identify: 'sdfsf65466'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        centerTitle: true,
      ),
      body: _builOrderScreen(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _builOrderScreen(context) {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _buildOrdersList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Text(
        'Meus Pedidos',
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOrdersList() {
    return Expanded(
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final Order order = _orders[index];
          return _buildItemOrder(order, context);
        },
      ),
    );
  }

  Widget _buildItemOrder(Order order, context) {
    return ListTile(
      title: Text(
        "Pedido #${order.identify}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        " ${order.date}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/order-details',
            arguments: order.identify);
      },
    );
  }
}
