import 'package:food_app/core/service_injector/service_injector.dart';
import 'package:food_app/shared/model/food_model.dart';

class FoodService {
  Future<List<FoodModel>> getAllFood() async {
    List<FoodModel> foods = [];
    await si.persistenceStorageservice
        .readJson('assets/json/food.json')
        .then((value) {
      List foodList = value['food'];
      for (var food in foodList) {
        foods.add(
          FoodModel(
            name: food['name'],
            category: food['category'],
            detail: food['detail'],
            rating: food['rating'],
            sales: food['numberOfSales'],
            price: food['price'],
            image: food['image'],
            country: food['country'],
          ),
        );
      }
    });
    return foods;
  }
}
