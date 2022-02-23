import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Our Partners",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              SpecialOfferCard(
                image: "assets/images/African-ACCENT_1.png",
                category: "African Accent",
                // numOfBrands: 18,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/gep-logo_1.png",
                category: "Gauteng Enterprise Propeller",
                // numOfBrands: 24,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/mapha_1.png",
                category: "Mapha",
                // numOfBrands: 24,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/nydalogo_1.png",
                category: "National Youth Development Agency",
                // numOfBrands: 24,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/Salgalogo_1.png",
                category: "SALGA",
                // numOfBrands: 24,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/teta_1.png",
                category: "Teta",
                // numOfBrands: 24,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/Tri-Bev_1.png",
                category: "Tri-Bev",
                // numOfBrands: 24,
                press: () {},
              ),

              SpecialOfferCard(
                image: "assets/images/youth_1.png",
                category: "Youth Empowerment Service",
                // numOfBrands: 24,
                press: () {},
              ),

              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Our Services",
            press: () {},
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
