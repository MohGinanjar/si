import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si/controllers/product_controllors.dart';
import 'package:si/models/product.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  String? dates;
  final controllerP = Get.find<ProductController>();
  DetailPage({this.dates});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder(builder: (ProductController productcontroller) {
        List<ProductIkan>? filterproduct = productcontroller.products!
            .where((ProductIkan productIkan) => productIkan.date == dates)
            .toList();
        return ListView.builder(
            itemCount: filterproduct.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(filterproduct[index].jenisikan.toString()),
                  subtitle: Text(filterproduct[index].hargasatuan
                          .toString() +
                      " " +
                      filterproduct[index].satuan.toString()),
                  trailing:
                      Text("Rp. ${filterproduct[index].jumlah}"),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(Container(
            height: 900,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showClearButton: true,
                    showSelectedItems: true,
                    items: [
                      "Tenggiri",
                      "Tongkol",
                      "Tuna Merah",
                      "Kakap",
                      "Kerapu",
                      "Kuwe"
                    ],
                    label: "Jenis Ikan",
                    hint: "Silahkan Pilih Jenis Ikan",
                    showSearchBox: true,
                    onChanged: (value) {
                      if (value != null) {
                        controllerP.jenisikan.value = value.toString();
                        controllerP.hiddendropdown.value = false;
                      } else {
                        print("tidak ada yang di pilih");
                        controllerP.hiddendropdown.value = true;
                      }
                    },
                  ),
                ),
                Obx(() => controllerP.hiddendropdown.isTrue
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          showClearButton: true,
                          showSelectedItems: true,
                          items: [
                            "Kg",
                            "Bakul",
                            "Tampa",
                          ],
                          label: "Satuan",
                          hint: "Silahkan Pilih Satuan",
                          showSearchBox: true,
                          onChanged: (value) {
                            if (value != null) {
                              controllerP.satuan.value = value.toString();
                              controllerP.hiddendropharga.value = false;
                            } else {
                              controllerP.hiddendropharga.value = true;
                              controllerP.hargaC.value = 0;
                              controllerP.jumlah.value = 0;
                              controllerP.subprice.value = 0;

                              print("tidak ada yang di pilih");
                            }
                          },
                        ),
                      )),
                Obx(() => controllerP.hiddendropharga.isTrue
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 250,
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                autocorrect: false,
                                onChanged: (value) {
                                  if (value != '') {
                                    controllerP.hiddendrophargasatuan.value =
                                        false;
                                    controllerP.hargaC.value = int.parse(value);
                                  } else {
                                    controllerP.hiddendrophargasatuan.value =
                                        true;
                                    controllerP.hargaC.value = 0;
                                    controllerP.jumlah.value = 0;
                                    controllerP.subprice.value = 0;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Harga Satuan',
                                  hintText: 'Harga Satuan',
                                ),
                              ),
                            ),
                            Obx(() => controllerP.hiddendrophargasatuan.isTrue
                                ? SizedBox()
                                : Container(
                                    height: 60,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                controllerP.addjumlah(),
                                            icon: Icon(
                                              Icons.add,
                                              size: 30,
                                            )),
                                        Obx(() => Text(
                                              "${controllerP.jumlah.value}",
                                              style: TextStyle(fontSize: 30),
                                            )),
                                        IconButton(
                                            onPressed: () =>
                                                controllerP.removejumlah(),
                                            icon: Icon(
                                              Icons.remove,
                                              size: 20,
                                            )),
                                      ],
                                    ),
                                  )),
                          ],
                        ))),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => Text(
                          "Rp. ${controllerP.subprice.value}",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.start,
                        ))),
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
                            try {
                              controllerP.addproductdetail(ProductIkan(
                                  dates,
                                  controllerP.jenisikan.value,
                                  controllerP.satuan.value,
                                  controllerP.hargaC.value.toString(),
                                  controllerP.hargaC.value.toString(),
                                  controllerP.subprice.value.toString()));
                              controllerP.hargaC.value = 0;
                              controllerP.jumlah.value = 0;
                              controllerP.subprice.value = 0;
                              controllerP.hiddendrophargasatuan.value = true;
                              controllerP.hiddendropdown.value = true;
                              controllerP.hiddendropharga.value = true;
                            } catch (e) {}
                          },
                          child: Text(
                            "SAVE",
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
    );
  }
}
