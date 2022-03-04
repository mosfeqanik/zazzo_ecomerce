import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mosfeqanik/views/homepage/landing_home_page/model/ProductModelClass.dart';

class LandingHomePageController extends GetxController {
  var updatedProductDataListAPI=<ProductModelClass>[].obs;
  @override
  void onInit() {
    _getAllProductsAPI();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _getAllProductsAPI() async{
    Dio _dio = Dio();
    var myUrl = 'https://fakestoreapi.com/products';
    var connectivityResult = await (Connectivity().checkConnectivity());

    try {
      if (connectivityResult == ConnectivityResult.none) {
        print('No Internet Connection');
        Get.snackbar('Ops!', 'No Internet Connection');
      } else {
        EasyLoading.show(status: 'loading...');
        var response1 = await _dio.get(myUrl);

        print('HTTP Request: URL $myUrl');
        print('HTTP Request: Status Code ${response1.statusCode}');
        print(response1);

        if (response1.statusCode == 200) {
          var restfulAPIData = response1.data as List;
        
          var myReceivedListForAPI =
          restfulAPIData.map((e) => ProductModelClass.fromJson(e)).toList();
          print(
              'HTTP Request: Before Insert Data ${updatedProductDataListAPI.length} ');
          updatedProductDataListAPI.addAll(myReceivedListForAPI);
          print(
              'HTTP Request: after Insert Data ${updatedProductDataListAPI.length} ');
          print('HTTP Request API Data ${updatedProductDataListAPI[1].id} ');
          EasyLoading.dismiss();
        } else {
          print('Data not found ');
          // loadingStatus.value = false;
        }
      }
    } catch (e, l) {
      print(runtimeType);
      print(e);
      print(l);
      // loadingStatus.value = false;
    }
  }
}
