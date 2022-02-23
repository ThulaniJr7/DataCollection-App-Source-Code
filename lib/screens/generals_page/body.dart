import 'package:flutter/material.dart';
import 'package:tdmecommerce/screens/generals_page/discount_banner_finance.dart';
import 'package:tdmecommerce/screens/generals_page/discount_banner_general.dart';
import 'package:tdmecommerce/screens/generals_page/home_header.dart';
import 'package:tdmecommerce/screens/generals_page/popular_product.dart';
import 'package:tdmecommerce/screens/generals_page/special_offers.dart';

import '../../size_config.dart';
import 'discount_banner_general.dart';
import 'home_header.dart';

class genBody extends StatefulWidget {

  // @override
  _genBodyState createState() => _genBodyState();
}

class _genBodyState extends State<genBody> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBannerGen(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBannerFinance(),
            // Categories(),
            // SpecialOffers(), // This is where the Partners are edited
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
