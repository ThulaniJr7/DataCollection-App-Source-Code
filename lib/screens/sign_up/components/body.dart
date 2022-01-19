import 'package:flutter/material.dart';
import 'package:tdmecommerce/components/socal_card.dart';
import 'package:tdmecommerce/constants.dart';
import 'package:tdmecommerce/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // This is the editor for the Logo image at the top of the page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/BlackandOrangeTDM1.png", width: 150, height: 150,),
                  ],
                ),

                Text("Register", style: headingStyle, textAlign: TextAlign.center,),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Please Select The Category That You Fall Under",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // SocalCard(
                    //   icon: "assets/icons/google-icon.svg",
                    //   press: () {},
                    // ),
                    // SocalCard(
                    //   icon: "assets/icons/facebook-2.svg",
                    //   press: () {},
                    // ),
                    // SocalCard(
                    //   icon: "assets/icons/twitter.svg",
                    //   press: () {},
                    // ),

                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                // Text(
                //   'By continuing your confirm that you agree \nwith our Term and Condition',
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.caption,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
