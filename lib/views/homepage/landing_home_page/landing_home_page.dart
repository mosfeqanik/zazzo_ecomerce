import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mosfeqanik/utils/app_colors.dart';
import 'package:mosfeqanik/utils/asset_strings.dart';
import 'package:mosfeqanik/utils/themes_styles.dart';
import 'package:mosfeqanik/views/homepage/category_page/all_category_page.dart';
import 'package:mosfeqanik/views/homepage/landing_home_page/landing_home_page_controller.dart';
import 'package:mosfeqanik/views/homepage/landing_home_page/model/daily_deal_Model_Class.dart';

import 'model/product_category_model_class.dart';

class LandingHomePage extends StatelessWidget {
  LandingHomePageController controller = Get.put(LandingHomePageController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static const routeName ="/landing-home-page" ;

  List<DailyDealModelClass> DailyDealProduct = [
    DailyDealModelClass(
        imageUrl: AssetStrings.productImage1,
        productDiscountPercentage: "-15",
        productDiscountPrice: "1010",
        productPrice: "935",
        productName: "OnePlus 7T 8 GB Qualcomm"),
    DailyDealModelClass(
        imageUrl: AssetStrings.productImage2,
        productDiscountPercentage: "-15",
        productDiscountPrice: "1010",
        productPrice: "935",
        productName: "Samsung Note 1"),
  ];

  List<ProductCategoryModelClass> ProductCategoryList = [
    ProductCategoryModelClass(
        imageUrl: AssetStrings.apple_Categories_IMAGE,
        ProductCategoryName: "Apple"),
    ProductCategoryModelClass(
        imageUrl: AssetStrings.samsung_Categories_IMAGE,
        ProductCategoryName: "Samsung"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f5f2),
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: _myDrawer(),
                ),
                _searchBox(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: _paraHeading(ParaheadingName: "Daily Deals"),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  height: 260,
                  child: _productListView(),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AllCategoryPage.routeName);
                      },
                      child:
                          _paraHeading(ParaheadingName: "Product Categories")),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  height: 160,
                  child: _Productcategory(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myDrawer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "👋",
              style: TextStyle(fontSize: 30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextThemes.GreetingTextStyle,
                ),
                Text(
                  "Nicolas ",
                  style: TextThemes.UserNameStyle,
                )
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: SvgPicture.asset(
            AssetStrings.drawer_svg,
            width: 45,
            color: AppColors.kBlackColor,
          ),
        ),
      ],
    );
  }

  Widget _searchBox() {
    return TextFormField(
      onChanged: (val) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.searchboxGreyColor,
        focusedBorder: outlineInputBorderForSearchBox(),
        enabledBorder: outlineInputBorderForSearchBox(),
        hintText: "Search Products you wish",
        hintStyle: TextStyle(fontSize: 15),
        prefixIcon:
            Icon(Icons.search_outlined, color: AppColors.kSecondaryGreyColor),
      ),
    );
  }

  OutlineInputBorder outlineInputBorderForSearchBox() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Color(0xfff2f5f2), width: 2.0),
    );
  }

  Widget _paraHeading({required String ParaheadingName}) {
    return Row(
      children: [
        Text(
          ParaheadingName,
          style: TextThemes.ParaheadingStyle,
        )
      ],
    );
  }

  Widget _productListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 1, right: 6),
      itemCount: DailyDealProduct.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 250,
            width: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Center(
                      child: Image.asset(
                          DailyDealProduct[index].imageUrl.toString())),
                ),
                Positioned(
                  left: 0,
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: AppColors.kpinkColor,
                    ),
                    child: Text(
                      '-${DailyDealProduct[index].productDiscountPercentage.toString()}%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 0,
                    child: Container(
                      color: Color(0xFFFFFFF).withOpacity(0.8),
                      width: 200,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff277ffc).withOpacity(0.2),
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                  ),
                                  label: Text(
                                    'Add to Cart',
                                    style: TextThemes.AddtoCartButtonTextStyle,
                                  ),
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    size: 20,
                                    color: AppColors.kBlueColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: Color(0xFFfa395a).withOpacity(0.2),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    size: 20,
                                    color: AppColors.kpinkColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Flexible(
                              child: Text(
                            "${DailyDealProduct[index].productName.toString()}",
                            style: TextThemes.productNameTextStyle,
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("\$${DailyDealProduct[index].productPrice}",
                                  style: TextThemes.productPriceTextStyle),
                              Text(
                                  "\$${DailyDealProduct[index].productDiscountPrice}",
                                  style:
                                      TextThemes.productDisciuntPriceTextStyle)
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _Productcategory() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 1, right: 6),
      itemCount: ProductCategoryList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            width: 240,
            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage("${ProductCategoryList[index].imageUrl}",),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.white],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(0.5, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 30,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '${ProductCategoryList[index].ProductCategoryName}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

