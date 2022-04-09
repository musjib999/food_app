import 'package:flutter/material.dart';
import 'package:food_app/shared/themes/colors.dart';
import 'package:food_app/shared/widgets/forms/search_textfield.dart';
import 'package:ionicons/ionicons.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<Widget> homePageItems = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        const Text(
          'Explore',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SearchTextField(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.options,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView(children: homePageItems),
    );
  }
}
