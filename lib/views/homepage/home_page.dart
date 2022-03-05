import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mosfeqanik/utils/app_colors.dart';
import 'package:mosfeqanik/views/homepage/category_page/all_category_page.dart';
import 'package:mosfeqanik/views/homepage/landing_home_page/landing_home_page.dart';


class HomePage extends StatefulWidget {
  static const routeName ="/" ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _page = 0;


  final pages = [
    LandingHomePage(),
    AllCategoryPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.white,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 600),
        buttonBackgroundColor: AppColors.kWhiteColor,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [

          Icon(
            Icons.house,
          ),
          Icon(
            Icons.category,
          ),

        ],
      ),
      body: pages[_page],
    );
  }
}


