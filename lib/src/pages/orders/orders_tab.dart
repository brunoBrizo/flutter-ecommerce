import 'package:flutter/material.dart';
import 'package:quitanda_app/src/config/app_data.dart' as app_data;
import 'package:quitanda_app/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (c, index) {
            return const SizedBox(
              height: 10.0,
            );
          },
          itemBuilder: (c, index) {
            return OrderTile(order: app_data.orders[index]);
          },
          itemCount: app_data.orders.length),
    );
  }
}
