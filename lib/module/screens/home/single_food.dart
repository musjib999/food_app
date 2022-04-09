import 'package:flutter/material.dart';
import 'package:food_app/core/service_injector/service_injector.dart';
import 'package:food_app/shared/model/food_model.dart';
import 'package:food_app/shared/themes/colors.dart';
import 'package:food_app/shared/widgets/buttons/primary_raised_button.dart';
import 'package:food_app/shared/widgets/cards/other_food_card.dart';
import 'dart:io' show Platform;

import 'package:food_app/shared/widgets/cards/primary_card.dart';
import 'package:ionicons/ionicons.dart';

import 'tabs/details.dart';
import 'tabs/menu.dart';
import 'tabs/reviews.dart';

class SingleFood extends StatefulWidget {
  final FoodModel food;
  const SingleFood({Key? key, required this.food}) : super(key: key);

  @override
  _SingleFoodState createState() => _SingleFoodState();
}

class _SingleFoodState extends State<SingleFood> {
  bool isFavourite = false;
  int otherFoodsNum = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.food.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () => si.routerService.popRoute(context),
                          icon: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        icon: Icon(
                          isFavourite ? Icons.favorite_outline : Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 140.0,
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: PrimaryCard(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      widget.food.country,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.food.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        widget.food.category,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              size: 15, color: Colors.yellow),
                                          const Icon(Icons.star,
                                              size: 15, color: Colors.yellow),
                                          const Icon(Icons.star,
                                              size: 15, color: Colors.yellow),
                                          const Icon(Icons.star,
                                              size: 15, color: Colors.yellow),
                                          const Icon(Icons.star_border_sharp,
                                              size: 15, color: Colors.grey),
                                          Text(
                                            '${widget.food.rating} (133)',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Text(
                                  '\$${widget.food.price}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.schedule,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '10am-10pm',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Ionicons.locate_outline,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '1.5miles',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Ionicons.location_outline,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Direction',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Ionicons.bag_outline,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '1.5miles',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: PrimaryCard(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.normal,
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(
                            child: Text('Details'),
                          ),
                          Tab(
                            child: Text('Menu'),
                          ),
                          Tab(
                            child: Text('Reviews'),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: MediaQuery.of(context).size.height / 5 + 100,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TabBarView(
                          children: [
                            Details(detail: widget.food.detail),
                            const Menu(),
                            const Reviews(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: PrimaryButton(
                onTap: (startLoading, stopLoading, btnState) {},
                buttonTitle: 'Make an Order',
                borderRadius: 25,
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Other Foods',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                height: 500,
                child: FutureBuilder<List<FoodModel>>(
                  future: si.foodService.getAllFood(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    List<FoodModel>? otherFood = snapshot.data;
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: otherFood!.length >= 4
                          ? otherFoodsNum
                          : otherFood.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        // Icon icon = const Icon(
                        //   Icons.favorite_outline,
                        //   color: Colors.red,
                        // );
                        return Stack(
                          children: [
                            OtherFoodCard(food: otherFood[index]),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 170, left: 140),
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                child: const Icon(
                                  Icons.favorite_outline,
                                  // color: Colors.red,
                                ),
                                onTap: () {},
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        otherFoodsNum + 4;
                      });
                    },
                    child: const Text(
                      'Show More...',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
