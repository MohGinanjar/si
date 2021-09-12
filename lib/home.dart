import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si/controllers/product_controllors.dart';
import 'package:si/detail.dart';
import 'package:si/models/product.dart';
import 'package:si/routes/name_route.dart';

class HomePage extends StatelessWidget {
  final controllerP = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder(builder: (ProductController productcontroller) {
          return ListView.builder(
            itemCount: productcontroller.productmasters?.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Get.to(DetailPage(dates: "${productcontroller.productmasters![index].date}",)),
              child: Card(
                child: ListTile(
                  title:
                      Text("${productcontroller.productmasters![index].date}"),
                  subtitle:
                      Text("${productcontroller.productmasters![index].name}"),
                  leading: IconButton(onPressed: () => controllerP.deleteproduct(productcontroller.productmasters![index]), icon: Icon(Icons.delete)),  
                  trailing: Text("${productcontroller.productmasters![index].name}"),
                ),
              ),
            ),
          );
        }),
        floatingActionButton: Container(
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {},
                heroTag: null,
                child: Icon(Icons.upload),
              ),
              FloatingActionButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    height: 900,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 60,
                                width: 260,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                    child: Obx(() => Text(
                                          "${controllerP.datetime.value}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23),
                                        ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                  height: 60,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: TextButton(
                                    onPressed: () =>
                                        controllerP.showDatePickers(context),
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            onChanged: (value) {
                              if (value != '') {
                                controllerP.namepenjual.value =
                                    value.toString();
                              }
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nama Penjual',
                              hintText: 'Nama Penjual',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    controllerP.addproduct(ProductMaster(
                                        controllerP.datetime.value,
                                        controllerP.namepenjual.value,
                                    []
                                        
                                        ));
                                    controllerP.datetime.value = '';
                                    controllerP.namepenjual.value = '';
                                  },
                                  child: Text(
                                    "Add Transaksi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  ));
                },
                heroTag: null,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ));
  }
}
