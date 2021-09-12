import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si/calculator/calculator_controller.dart';

class Calculator extends StatelessWidget {
  final calC = Get.find<CalculatorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: calC.harga.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                 IconButton(
                                  onPressed: () => calC.addjumlah(),
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  )),
                              Obx(() => Text(
                                    "${calC.incrementadd.value}",
                                    style: TextStyle(fontSize: 30),
                                  )),
                              IconButton(
                                  onPressed: () => calC.removejumlah(),
                                  icon: Icon(
                                    Icons.remove,
                                    size: 30,
                                  )),
              ],),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => Text(
                  "${calC.total}",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calC.total.update((val) {
            calC.total.value = int.parse(calC.jumlah.value.text) *
                int.parse(calC.harga.value.text);
          });
        },
      ),
    );
  }
}
