import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mosfeqanik/views/homepage/category_page/all_category_page.dart';
import 'package:mosfeqanik/views/homepage/home_page.dart';
import 'package:mosfeqanik/views/homepage/landing_home_page/landing_home_page.dart';
import 'package:mosfeqanik/views/homepage/product_details_page/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Mosfeq_Anik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: HomePage.routeName, page: () => HomePage(),transition: Transition.fadeIn ),
        GetPage(name: LandingHomePage.routeName, page: ()=>LandingHomePage()),
        GetPage(name: AllCategoryPage.routeName, page: ()=>AllCategoryPage()),
        GetPage(name: ProductDetailPage.routeName, page: ()=>ProductDetailPage()),
      ],
    );
  }
}


