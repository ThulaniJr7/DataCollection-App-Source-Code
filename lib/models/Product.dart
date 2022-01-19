import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products with the different hampers on offer

List<Product> demoProducts = [

  // The code below allows you to have an image and a number of images for that sellection if need be
  // Product(
  //   id: 1,
  //   images: [
  //     "assets/images/ps4_console_white_1.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Hamper 1",
  //   price: 360.00,
  //   description: hamperOneDes,
  //   rating: 4.8,
  //   isFavourite: true,
  //   isPopular: true,
  // ),

  Product(
    id: 1,
    images: [
      "assets/images/hamper1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 1",
    price: 360.00,
    description: hamperOneDes,
    // rating: 4.1,
    isPopular: true,
  ),

  Product(
    id: 2,
    images: [
      "assets/images/hamper2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 2",
    price: 400.00,
    description: hamperTwoDes,
    // rating: 4.1,
    isPopular: true,
  ),

  Product(
    id: 3,
    images: [
      "assets/images/hamper3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 3",
    price: 220.00,
    description: hamperThreeDes,
    // rating: 4.1,
    // isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 4,
    images: [
      "assets/images/hamper4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 4",
    price: 200.00,
    description: hamperFourDes,
    // rating: 4.1,
    // isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 5,
    images: [
      "assets/images/hamper5.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 5",
    price: 470.00,
    description: hamperFiveDes,
    // rating: 4.1,
    isPopular: true,
  ),

  Product(
    id: 6,
    images: [
      "assets/images/hamper6.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 6",
    price: 610.00,
    description: hamperSixDes,
    // rating: 4.1,
    // isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 7,
    images: [
      "assets/images/hamper7.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 7",
    price: 730.00,
    description: hamperSevenDes,
    // rating: 4.1,
    // isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 8,
    images: [
      "assets/images/hamper8.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 8",
    price: 350.00,
    description: hamperEightDes,
    // rating: 4.1,
    isPopular: true,
  ),

  Product(
    id: 9,
    images: [
      "assets/images/hamper9.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hamper 9",
    price: 200.00,
    description: hamperNineDes,
    // rating: 4.1,
    // isFavourite: true,
    isPopular: true,
  ),

];

// The different hamper descriptions
const String description =
    "";

// Hamper 1 Description information
const String hamperOneDes =
    "2x 400g Lucky Star Tin Fish \n1x 2kg Sunlight Handwash \n1x 5kg White Star Mealie Meal \n1x 5kg Spekko Rice \n1x 2kg Selati Brown Sugar \n1x 2L Excella Sunflower Oil \n1x 80s Fresh Pack Rooibos Tea";

// Hamper 2 Description information
const String hamperTwoDes =
    "2x 400g Lucky Star Tin Fish \n1x 2kg Sunlight Washing Powder \n1x 5kg Iwisa Mealie Meal \n1x 5kg Trims Rice \n1x 2kg Selati Brown Sugar \n1x 2L Excella Sunflower Oil \n1x 100s Trinco Tea Bags";

// Hamper 3 Description information
const String hamperThreeDes =
    "1x 100g Five Roses/Joko \n1x 80g Freshpack \n1x 250g Frisco/Ricoffy \n1x 1kg Ellis Brown/Cremora \n1x 2kg Selati Brown Sugar";

// Hamper 4 Description information
const String hamperFourDes =
    "2x 200g Blue Label Marie Biscuits \n2x 200g Eet-Sum-Mor Biscuits \n2x 200g Tennis Biscuits \n2x 200g Red Label Cream Biscuits \n2x 200g Red Label Cream Biscuits \n2x 200g Romany Creams";

// Hamper 5 Description information
const String hamperFiveDes =
    "2x 400g Lucky Star Tin Fish \n1x 2kg Sunlight Handwash \n1x 12.5kg Iwisa Mealie Meal \n1x 5kg Spekko Rice \n1x 2kg Splendid Brown Sugar \n1x 2L Excella Sunflower Oil \n1x 80s Fresh Pack Rooibos Tea \n1x 750ml Sunlight Dishwashing Liquid \n1x 500g Sunlight Bar Soap";

// Hamper 6 Description information
const String hamperSixDes =
    "2x 400g Lucky Star Tin Fish \n1x 2kg Sunlight Handwash \n1x 5kg White Star Mealie Meal \n1x 10kg Spekko Rice \n1x 5kg Selati Brown Sugar \n1x 2L Excella Sunflower Oil \n1x 80s Fresh Pack Rooibos Tea \n1x 750ml Sunlight Dishwashing Liquid \n1x 500g Sunlight Bar Soap \n1x 500g Sunlight Bar Soap \n1x 100ml Colgate Toothpaste \n1x 10s Aunt Sallies Toilet Roll";

// Hamper 7 Description information
const String hamperSevenDes =
    "2x 400g Lucky Star Tin Fish \n1x 2kg Sunlight Handwash \n1x 12.5kg Iwisa Mealie Meal \n1x 10kg Spekko Rice \n1x 5kg Splendid Brown Sugar \n1x 2L Excella Sunflower Oil \n1x 750ml Sunlight Dishwashing Liquid \n1x 500g Sunlight Bar Soap \n1x 500g Sunlight Bar Soap \n1x 80s Fresh Pack Rooibos Tea \n1x 100ml Colgate Toothpaste \n1x 10s Aunt Sallies Toilet Roll";

// Hamper 8 Description information
const String hamperEightDes =
    "1x 12.5kg Ace Maize Meal \n1x 5kg Tastic Rice \n1x 5kg Selati Brown Sugar \n1x 2L Excella Sunflower Oil";

// Hamper 9 Description information
const String hamperNineDes =
    "1x 750ml Jik \n1x 175g Detol Soap \n1x 250ml Detol Anticeptic \n1x Cobra Tile Cleaner \n1x Detol Cream \n1x Airwick";



