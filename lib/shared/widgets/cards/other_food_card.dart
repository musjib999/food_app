import 'package:flutter/material.dart';
import 'package:food_app/shared/model/food_model.dart';

class OtherFoodCard extends StatelessWidget {
  final FoodModel food;
  const OtherFoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        food.country,
                      ),
                      radius: 12,
                    ),
                  ],
                ),
                Text(
                  food.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  food.category,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 15, color: Colors.yellow),
                    const Icon(Icons.star, size: 15, color: Colors.yellow),
                    const Icon(Icons.star, size: 15, color: Colors.yellow),
                    const Icon(Icons.star, size: 15, color: Colors.yellow),
                    const Icon(Icons.star_border_sharp,
                        size: 15, color: Colors.grey),
                    Text(
                      '${food.rating} (133)',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
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
