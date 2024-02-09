import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.cartList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 230,
                color: Colors.red,
                child: Column(
                  children: [
                    Image(
                      image: NetworkImage(
                        controller.cartList[index].url.toString(),
                      ),
                      height: 100,
                    ),
                    Text(
                      controller.cartList[index].title.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.removeCartData(index);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
