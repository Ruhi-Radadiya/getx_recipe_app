import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/recipe_controller.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeController controller = Get.put(RecipeController());

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Recipes",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(
              () => CartPage(),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  CupertinoIcons.cart_fill,
                  color: Colors.grey,
                  size: 35,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Transform.translate(
                      offset: const Offset(0, -2),
                      child: Obx(
                        () => Text(
                          "${controller.addToCartList.length}",
                          style: const TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: (controller.recipelist.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.63,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var item = controller.recipelist[index];
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 180,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                item.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$ ${item.rating}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.red,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          onPressed: () =>
                              controller.addRecipeToCart(item: item),
                        ),
                      )
                    ],
                  );
                },
                itemCount: controller.recipelist.length,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
