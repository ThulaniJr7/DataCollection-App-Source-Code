import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import 'package:tdmecommerce/screens/home/components/default_button_home.dart';
import 'package:tdmecommerce/screens/home/components/discount_banner_advertising.dart';
import 'package:tdmecommerce/screens/home/components/discount_banner_graphic.dart';
import 'package:tdmecommerce/screens/home/components/discount_banner_marketing.dart';
import 'package:tdmecommerce/screens/home/service_screens/advertising_service.dart';
import 'package:tdmecommerce/screens/home/service_screens/finance_service.dart';
import 'package:tdmecommerce/screens/home/service_screens/graphic_service.dart';
import 'package:tdmecommerce/screens/home/service_screens/marketing_service.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'discount_banner_finance.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
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
            SizedBox(height: getProportionateScreenWidth(10)),
            SpecialOffers(), // This is where the Partners are edited
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBannerFinance(),
            DefaultButton(
              text: "Apply for Finance",
              press: () async {
                changeScreen(context, financeService());
              },
            ),

            DiscountBannerMarketing(),
            DefaultButton(
              text: "Apply for Marketing",
              press: () async {
                changeScreen(context, marketingService());
              },
            ),

            DiscountBannerAdvertising(),
            DefaultButton(
              text: "Apply for Advertising",
              press: () async {
                changeScreen(context, advertisingService());
              },
            ),

            DiscountBannerGraphic(),
            DefaultButton(
              text: "Apply for Graphic Design",
              press: () async {
                changeScreen(context, graphicDesignService());
              },
            ),

            // Categories(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],

        ),
      ),
      
    );

  }
}
