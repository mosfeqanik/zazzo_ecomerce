import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosfeqanik/components/rattings.dart';
import 'package:mosfeqanik/utils/app_colors.dart';
import 'package:mosfeqanik/utils/asset_strings.dart';
import 'package:mosfeqanik/utils/themes_styles.dart';
import 'package:mosfeqanik/views/homepage/category_page/all_category_page_controller.dart';
import 'package:mosfeqanik/views/homepage/category_page/category_model_class.dart';
import 'package:mosfeqanik/views/homepage/product_details_page/product_detail_page.dart';

import '../landing_home_page/landing_home_page_controller.dart';

class AllCategoryPage extends StatelessWidget {
  static const routeName = "/all-category-page";

  AllCategoryPageController _controller = Get.put(AllCategoryPageController());
  LandingHomePageController _allProductsController =
      Get.put(LandingHomePageController());

  List<CategoryModelClass> CategoryProductList = [
    CategoryModelClass(
        imageUrl: AssetStrings.sneacker_Image, productName: "Sneakers"),
    CategoryModelClass(
        imageUrl: AssetStrings.watch_Image, productName: "watches"),
    CategoryModelClass(
        imageUrl: AssetStrings.backpack_Image, productName: "BackPack"),
    CategoryModelClass(
        imageUrl: AssetStrings.sneacker_Image, productName: "Sneakers"),
    CategoryModelClass(
        imageUrl: AssetStrings.watch_Image, productName: "watches"),
    CategoryModelClass(
        imageUrl: AssetStrings.backpack_Image, productName: "BackPack"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f5f2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.drag_indicator_outlined,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Icon(
          Icons.star_rate_outlined,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                  child: _paraHeading(ParaheadingName: "Our Product"),
                ),
                Container(height: 50, child: _categoryList()),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  height: 600,
                  child: _allProductCategory(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paraHeading({required String ParaheadingName}) {
    return Text(
      ParaheadingName,
      style: TextThemes.ParaheadingStyle,
    );
  }

  Widget _categoryList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoryProductList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "${CategoryProductList[index].imageUrl}",
                    width: 30,
                  ),
                  Text(
                    "${CategoryProductList[index].productName}",
                    style: TextThemes.categoryListStyle,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _allProductCategory() {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _allProductsController.updatedProductDataListAPI.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .62,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(
              onTap: (){
                Get.toNamed(
                  ProductDetailPage.routeName,
                  arguments: {
                    'imgUrl':  _allProductsController.updatedProductDataListAPI[index].image.toString(),
                    'price':  _allProductsController.updatedProductDataListAPI[index].price.toString(),
                    'title':  _allProductsController.updatedProductDataListAPI[index].title.toString(),
                    'description':  _allProductsController.updatedProductDataListAPI[index].description.toString(),
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 180,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 28,
                          top: 50,
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff52b487),
                                ),
                                color: Color(0xff52b487),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          top: 60,
                          child: Image.network(
                            _allProductsController.updatedProductDataListAPI[index].image.toString(),
                            width: 70,
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              color: AppColors.kSkyblueColor,
                            ),
                            child: const Text(
                              '30%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Positioned(
                            right: 5,
                            top: 10,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.kpinkColor,
                            )),
                      ],
                    ),
                  ),
                  Flexible(child: Text('${_allProductsController.updatedProductDataListAPI[index].title}', overflow: TextOverflow.fade,)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(fontSize: 10),
                        ),
                         Text("${_allProductsController.updatedProductDataListAPI[index].price}",style: TextThemes.productPriceGridTextStyle,)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                    child: RattingStars(rattings:5),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
