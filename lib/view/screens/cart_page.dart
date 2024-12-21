import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/recipe_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.addToCartList.isEmpty) {
          return const Center(
            child: Text(
              "Your Cart is Empty !",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.addToCartList.length,
          itemBuilder: (context, index) {
            var item = controller.addToCartList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(item.image),
                ),
                title: Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Price: \$${item.rating}",
                  style: TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    controller.removeFromCart(item: item);
                    Get.snackbar(
                      "Removed",
                      "${item.name} removed from cart",
                      backgroundColor: Colors.red.shade100,
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
