import 'package:flutter/material.dart';
import 'package:not_ortalamasi/Ortalama_hespalama_ana_sayfa.dart';
import 'package:not_ortalamasi/sabitler/app_constant.dart';

void main(List<String> args) {
  runApp(Ana());
}

class Ana extends StatelessWidget {
  const Ana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Sabitler.AnaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Anasayfa(),
    );
  }
}
