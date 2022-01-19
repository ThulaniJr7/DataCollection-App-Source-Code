import 'package:flutter/material.dart';
import 'package:tdmecommerce/components/default_button.dart';
import 'package:tdmecommerce/models/Product.dart';
import 'package:tdmecommerce/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [

                    // The line of code below represents the different colour selections available if need be
                    // ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(20),
                          top: getProportionateScreenWidth(10),
                        ),

                        // The code below represents the Add to cart button. Need to add functionality that allows a user to pick how many items they want and add
                        // child: DefaultButton(
                        //   text: "Add To Cart",
                        //   press: () {},
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
