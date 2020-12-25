import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildProfileScreen(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(3),
    );
  }

  Widget _buildProfileScreen(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'André Freitas',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(height: 12),
          Text(
            'proandre21@ohmtail.com',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Container(height: 12),
          Container(
            child: RaisedButton(
              onPressed: () {
                print('Sair');
              },
              child: Text('Sair'),
              elevation: 2.5,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.redAccent)),
            ),
          ),
        ],
      ),
    );
  }
}
