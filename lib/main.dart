import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:si/models/product.dart';
import 'package:si/routes/page_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../login.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter<ProductMaster>(ProductMasterAdapter());
  await Hive.openBox<ProductMaster>('productmaster');
  Hive.registerAdapter<ProductIkan>(ProductIkanAdapter());
  await Hive.openBox<ProductIkan>('productikan');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PT. Surveyor Indonesia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        getPages: AppPage.pages);
  }
}
