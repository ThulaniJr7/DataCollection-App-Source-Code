import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tdmecommerce/screens/home_general/components/discount_banner_gen.dart';

import '../../../size_config.dart';
import 'categories.dart';
// import 'discount_banner_gen.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class BodyGen extends StatelessWidget {
  static final docRef = FirebaseFirestore.instance.collection("sales_agent_registrations");

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            // Categories(),
            // SpecialOffers(), // This is where the Partners are edited
            SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
      
    );

  }
}
