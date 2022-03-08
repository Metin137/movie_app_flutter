import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/detail_screen/detail_screen.dart';

// Define Routes
import 'package:movie_app/screens/home_screen/home_screen.dart';

// Route Names
const String homeScreen = 'homeScreen';
const String detailScreen = 'detailScreen';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case detailScreen:
      return MaterialPageRoute(builder: (context) => DetailScreen(movie: args!['movie']));
    default:
      throw ('This route name does not exit');
  }
}
