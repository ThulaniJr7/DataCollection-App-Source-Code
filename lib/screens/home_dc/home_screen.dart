import 'package:flutter/material.dart';
import 'package:tdmecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:tdmecommerce/enums.dart';

import 'components/body.dart';

class HomeScreenDC extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDC(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
