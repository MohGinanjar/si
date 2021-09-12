import 'package:get/get.dart';
import 'package:si/bindings/bindings_product.dart';
import 'package:si/detail.dart';
import 'package:si/routes/name_route.dart';
import '../home.dart';
import '../login.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.login, page: ()=> LoginPage(), binding:ProductBinding()),
    GetPage(name: RouteName.home, page: ()=> HomePage(), binding:ProductBinding()),
    GetPage(name: RouteName.detail, page: ()=> DetailPage(), binding:ProductBinding())
  ];
}
