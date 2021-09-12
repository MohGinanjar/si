import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:si/models/product.dart';

class ProductController extends GetxController {
  List<ProductIkan>? _product;
  Box<ProductIkan>? boxproductikan;
  List<ProductIkan>? get products => _product;

  List<ProductMaster>? _productmaster;
  Box<ProductMaster>? boxproductmaster;
  List<ProductMaster>? get productmasters => _productmaster;

  ProductController() {
    boxproductmaster = Hive.box<ProductMaster>('productmaster');
    boxproductikan = Hive.box<ProductIkan>('productikan');
    _product = [];
    _productmaster = [];

    for (int i = 0; i < boxproductmaster!.values.length; i++) {
      _productmaster!.add(boxproductmaster!.getAt(i)!);
    }
    for (int i = 0; i < boxproductikan!.values.length; i++) {
      _product!.add(boxproductikan!.getAt(i)!);
    }

    
    
  }

  void addproduct(ProductMaster productMaster) {
    _productmaster!.add(productMaster);
    boxproductmaster!.add(productMaster);
    Get.back();
    Get.snackbar("add Product", "Product berhasil di tambahkan", snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54, colorText: Colors.white);
    update();
  }

  void deleteproduct(ProductMaster productMaster) {
    int index = _productmaster!.indexOf(productMaster);
    boxproductmaster!.deleteAt(index);
    _productmaster!.removeWhere((element) => element.id == productMaster.id);
    update();
  }

  void addproductdetail(ProductIkan productIkan) {
    _product!.add(productIkan);
    boxproductikan!.add(productIkan);
    Get.back();
    Get.snackbar("add Product", "Product berhasil di tambahkan", snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54, colorText: Colors.white);
    update();
  }

  void detailproductdetail(ProductIkan productIkan) {
    _product!.add(productIkan);
    boxproductikan!.add(productIkan);
    Get.back();
    Get.snackbar("add Product", "Product berhasil di tambahkan", snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54, colorText: Colors.white);
    update();
  }

  var hiddendropdown = true.obs;
  var hiddendropharga = true.obs;
  var hiddendrophargasatuan = true.obs;

  var jenisikan = ''.obs;
  var satuan = ''.obs;
  var jumlah = 0.obs;
  var hargaC = 0.obs;
  var subprice = 0.obs;
  var name = ''.obs;
  var date = ''.obs;
  var totalkeseluruhan = ''.obs;

  void addjumlah() {
    jumlah++;
    totalharga();
    update();
  }

  void removejumlah() {
    jumlah--;
    totalharga();
    update();
  }

  void totalharga() {
    subprice.update((val) {
      subprice.value = hargaC.value * jumlah.value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  var datetime = ''.obs;
  var namepenjual = ''.obs;

  void showDatePickers(BuildContext context) {
    DateTime selectDate = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    showDatePicker(
            context: context,
            initialDate: selectDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(3000))
        .then((value) {
      if (value != null) {
        print(value);
        datetime.update((val) {
          datetime.value = formatter.format(value).toString();
        });
      }
    });
  }

  // @override
  // void onInit() {
  //   totalharga();
  //   // everAll([subprice, jumlah, hargaC], (_) => print("ini ada perubahan"));
  //   super.onInit();
  // }
}
