import 'package:flutter/material.dart';

class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Your Product'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('Here you can sell your products!',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
