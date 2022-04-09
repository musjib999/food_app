// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_app/core/service_injector/service_injector.dart';
import 'package:food_app/module/screens/home/single_food.dart';
import 'package:food_app/shared/model/food_model.dart';
import 'package:food_app/shared/themes/colors.dart';
import 'package:food_app/shared/widgets/cards/food_card.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> homePageItems = [
    Column(
      children: [
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Discover \nAfrican Food',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 33.0,
                    height: 33.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.purple,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'V',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Ionicons.search),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                  iconDisabledColor: Colors.white,
                  icon: const Icon(Icons.expand_more),
                  style: const TextStyle(color: Colors.white),
                  value: 'Popular',
                  items: si.utilityService.getDropdownItems(
                    items: ['Popular'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.options,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: FutureBuilder<List<FoodModel>>(
        future: si.foodService.getAllFood(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<FoodModel>? foodList = snapshot.data;
          for (FoodModel food in foodList!) {
            Icon icon = const Icon(
              Icons.favorite_outline,
              color: Colors.red,
            );
            homePageItems.add(
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => si.routerService.nextRoute(
                      context,
                      SingleFood(
                        food: food,
                      ),
                    ),
                    child: FoodCard(
                      food: food,
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 320,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: icon,
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return ListView(children: homePageItems);
        },
      ),
    );
  }
}
