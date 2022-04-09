import 'package:flutter/material.dart';
import 'package:food_app/module/screens/cart.dart';
import 'package:food_app/module/screens/explore.dart';
import 'package:food_app/module/screens/favourites.dart';
import 'package:food_app/module/screens/home.dart';
import 'package:food_app/module/screens/more.dart';

List<Widget> pages = <Widget>[
  const Home(),
  const Explore(),
  const Cart(),
  const Favourites(),
  const More(),
];
