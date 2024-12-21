import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../modal/recipe_modal.dart';

class RecipeController extends GetxController {
  RxList<RecipeModal> recipelist = <RecipeModal>[].obs;
  RxList<RecipeModal> addToCartList = <RecipeModal>[].obs;

  RecipeController() {
    loadRecipeJsonData();
  }

  Future<void> loadRecipeJsonData() async {
    String assetJsonPath = "assets/recipe.json";

    String recipeData = await rootBundle.loadString(assetJsonPath);

    List allrecipedata = jsonDecode(recipeData);

    recipelist.value = allrecipedata
        .map(
          (e) => RecipeModal.fromJson(json: e),
        )
        .toList();
  }

  void removeFromCart({required RecipeModal item}) {
    addToCartList.remove(item);
  }

  void addRecipeToCart({required RecipeModal item}) {
    addToCartList.add(item);

    log("Cart List Length : ${addToCartList.length}");

    Get.back();
  }
}
