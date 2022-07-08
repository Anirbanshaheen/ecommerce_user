import 'package:ecommerce_user/auth/auth_service.dart';
import 'package:ecommerce_user/pages/order_details_page.dart';
import 'package:ecommerce_user/providers/order_provider.dart';
import 'package:ecommerce_user/utils/constants.dart';
import 'package:ecommerce_user/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserOrderListPage extends StatefulWidget {
  static const String routeName = '/user_orders';

  const UserOrderListPage({Key? key}) : super(key: key);

  @override
  _UserOrderListPageState createState() => _UserOrderListPageState();
}

class _UserOrderListPageState extends State<UserOrderListPage> {
  late OrderProvider _orderProvider;

  @override
  void didChangeDependencies() {
    _orderProvider = Provider.of<OrderProvider>(context);
    _orderProvider.getUserOrders(AuthService.currentUser!.uid);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: _orderProvider.userOrderList.length,
        itemBuilder: (context, index) {
          final order = _orderProvider.userOrderList[index];
          return ListTile(
            onTap: () => Navigator.pushNamed(context, OrderDetailsPage.routeName, arguments: order.orderId),
            title: Text(getFormattedDate(order.timestamp.millisecondsSinceEpoch, 'dd/MM/yyyy hh:mm a')),
            subtitle: Text(order.orderStatus),
            trailing: Text('$takaSymbol${order.grandTotal}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          );
        },
      ),
    );
  }
}