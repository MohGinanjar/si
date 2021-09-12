import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var harga = TextEditingController().obs;
  var jumlah = TextEditingController().obs;
  var incrementadd = 0.obs;
  var total = 0.obs;

  void addjumlah() {
    incrementadd++;
    totalharga();
    update();
  }

  void removejumlah() {
    incrementadd--;
    totalharga();
    update();
  }

  void totalharga() {
    total.update((val) {
      total.value = int.parse(harga.value.text) * incrementadd.value;
    });
  }
}
