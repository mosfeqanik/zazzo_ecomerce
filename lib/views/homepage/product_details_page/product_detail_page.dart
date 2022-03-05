import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:mosfeqanik/utils/themes_styles.dart';
import 'package:mosfeqanik/views/homepage/product_details_page/product_detail_page_controller.dart';

import '../../../utils/app_colors.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = "/product-detail-page";

  ProductDetailPageController _controller =
      Get.put(ProductDetailPageController());

  @override
  Widget build(BuildContext context) {
    print("title from categorpage${Get.arguments['title']}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Icon(
          Icons.star_rate_outlined,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: 40,
            height: 15,
            decoration: BoxDecoration(
              color: Color(0xFFfa395a).withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _imageDetail(),
                _productTitle(),
                _productDescription(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: _sizeCategoryPart(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: _avaiableColor(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: _addToCartButtonBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageDetail() {
    return Container(
      width: 400,
      height: 320,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 40,
            top: 50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff52b487),
                  ),
                  color: Color(0xff52b487),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
          ),
          Positioned(
            left: 90,
            top: 80,
            child: Image.network(
              "${Get.arguments['imgUrl']}",
              width: 150,
            ),
          ),
          Positioned(
            left: 150,
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
        ],
      ),
    );
  }

  Widget _productTitle() {
    return Text(
      "${Get.arguments['title']}",
      style: TextThemes.ParaheadingStyle,
    );
  }

  Widget _productDescription() {
    return Text(
      "${Get.arguments['description']}",
      style: TextThemes.productDescriptionTextStyle,
    );
  }

  Widget _sizeCategoryPart() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Size',
            style: TextThemes.ParaheadingStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0)),
          ),
          child: Text(
            'US 6',
            style: TextThemes.ParaheadingStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'US 7',
            style: TextThemes.ParaheadingStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'US 8',
            style: TextThemes.ParaheadingStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'US 9',
            style: TextThemes.ParaheadingStyle,
          ),
        ),
      ],
    );
  }

  Widget _avaiableColor() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Avaiable',
            style: TextThemes.ParaheadingStyle,
          ),
        ),
        Container(
          width: 20,
          height: 20,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: 20,
          height: 20,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _addToCartButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              "${Get.arguments['price']}",
              style: TextThemes.PriceTextStyle,
            )
          ],
        ),
        Container(
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color(0xff052963).withOpacity(0.2),
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
              color: AppColors.kdeepBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}
