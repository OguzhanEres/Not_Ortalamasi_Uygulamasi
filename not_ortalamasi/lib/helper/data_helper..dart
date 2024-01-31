import 'package:flutter/material.dart';

import '../model/ders.dart';

class DataHelper {
  static List<Ders> tumdersler = [];
  static OrtalamaHesapla() {
    double ToplamNot = 0;
    double ToplamKredi = 0;
    tumdersler.forEach((element) {
      ToplamNot += (element.dersNotu * element.dersKredisi);
      ToplamKredi += element.dersKredisi;
    });
    double sonuc = ToplamNot / ToplamKredi;
    return sonuc;
  }

  static dersEkle(Ders ders) {
    tumdersler.add(ders);
  }

  static List<String> Harfler() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _HarfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return Harfler()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _HarfiNotaCevir(e),
            ))
        .toList();
  }
}
