import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:not_ortalamasi/sabitler/app_constant.dart';

class OrtalamaYazdir extends StatelessWidget {
  final double dersortalama;
  final int derssayisi;
  const OrtalamaYazdir(
      {super.key, required this.dersortalama, required this.derssayisi});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          derssayisi > 0 ? '$derssayisi Ders Girildi' : 'Ders Seçiniz',
          style: Sabitler.ortalamabaslikstili,
        ),
        Text(
          dersortalama >= 0 ? '${dersortalama.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.ortalamastili,
        ),
        Text(
          'Ortalama',
          style: Sabitler.ortalamabaslikstili,
        )
      ],
    );
  }
}
