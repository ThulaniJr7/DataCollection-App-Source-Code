import 'package:flutter/material.dart';
import 'package:tdmecommerce/screens/cart/cart_screen.dart';
import 'package:tdmecommerce/screens/profile/components/body.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // This should be made out to be a Hamburger icon which will take the user to their profile page

          // Find out why the ".routeName" clashes with the other
          // IconBtnWithCounter(
          //     svgSrc: "assets/icons/Cart Icon.svg",
          //     press: () => Navigator.pushNamed(context, Body().routeName)
          // ),

          // SearchField(),

          // This is the editor for the image in the home page
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/BlackandOrangeTDM.png",
                width: 100,
                height: 60,
              fit: BoxFit.fitWidth,),
            ],
          ),

          Spacer(),

          //This Icon takes you to the shopping cart
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Cart Icon.svg",
          //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
          // ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
