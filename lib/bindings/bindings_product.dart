import 'package:get/get.dart';
import 'package:si/calculator/calculator_controller.dart';
import '../controllers/product_controllors.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.put<CalculatorController>(CalculatorController());
  }
}
