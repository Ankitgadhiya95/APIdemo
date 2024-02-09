import 'package:get/get.dart';

import 'modelclass.dart';

class CartController extends GetxController {
  RxList<Welcome> cartList = <Welcome>[].obs;

  addCartData(welcome) {
    cartList.add(welcome);
    print(cartList.length);
  }

  removeCartData(index) {
    cartList.removeAt(index);
  }
}
