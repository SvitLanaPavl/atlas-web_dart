import 'dart:convert';
import '4-util.dart';

Future<num> calculateTotal() async {
  try {
    Map userData = jsonDecode(await fetchUserData());

    String userId = userData['id'];

    List<dynamic> ordersData = jsonDecode(await fetchUserOrders(userId));

    double totalPrice = 0.0;

    for (var product in ordersData) {
      totalPrice += double.parse(await fetchProductPrice(product));
    }

    return totalPrice;
  } catch (error) {
    return -1;
  }
}
