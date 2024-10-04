import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    String userData = await fetchUserData();

    Map<String, dynamic> userMap = jsonDecode(userData);
    String userId = userMap['id'];

    String? ordersData = await fetchUserOrders(userId);

    if (ordersData == null) {
      return -1;
    }

    List<dynamic> orders = jsonDecode(ordersData);

    double totalPrice = 0.0;

    for (var product in orders) {
      String productPriceData = await fetchProductPrice(product);

      double productPrice = (jsonDecode(productPriceData) as num).toDouble();
      totalPrice += productPrice;
    }

    return totalPrice;
  } catch (error) {
    print('error caught: $error');
    return -1;
  }
}
