import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order_providers.dart';

//todo 2 (finish)
class OrderItemWidget extends StatelessWidget {
  OrderItem order;

  OrderItemWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(
                order.dateTime,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
