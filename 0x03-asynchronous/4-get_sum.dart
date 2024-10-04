import 'dart:convert';
import '4-util.dart';

Future<int> calculateTotal() async {
  try {
    String userData = await fetchUserData();

    Map<String, dynamic> userMap = jsonDecode(userData);
    String userId = userMap['id'];

    String? ordersData = await fetchUserOrders(userId);

    if (ordersData == null) {
      throw 'Orders not found for user ID: $userId';
    }

    List<dynamic> orders = jsonDecode(ordersData) as List<dynamic>? ?? [];

    if (orders.isEmpty) {
      throw 'No orders found for user ID: $userId';
    }

    double totalPrice = 0.0;

    for (var product in orders) {
      String productPriceData = await fetchProductPrice(product);
      
      double productPrice = (jsonDecode(productPriceData) as num).toDouble();
      totalPrice += productPrice;
    }

    return totalPrice.toInt();
  } catch (error) {
    print('error caught: $error');
    return -1;
  }
}
