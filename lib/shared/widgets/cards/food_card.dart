import 'package:flutter/material.dart';
import 'package:food_app/shared/model/food_model.dart';
import 'package:food_app/shared/widgets/cards/primary_card.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            food.country,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              food.category,
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
                                  '${food.rating} (133)',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
                        '\$${food.price}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 230,
                      child: Text(
                        food.detail,
                        style: const TextStyle(fontSize: 11),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: Image(
                image: NetworkImage(
                  food.image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
