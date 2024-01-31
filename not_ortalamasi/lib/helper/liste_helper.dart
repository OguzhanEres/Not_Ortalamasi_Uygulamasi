import 'package:flutter/material.dart';
import 'package:not_ortalamasi/helper/data_helper..dart';
import 'package:not_ortalamasi/sabitler/app_constant.dart';

import '../model/ders.dart';

// ignore: must_be_immutable
class ListeYapisi extends StatelessWidget {
  final Function onDismiss;
  ListeYapisi({required this.onDismiss, super.key});

  List<Ders> tumdersler = DataHelper.tumdersler;

  @override
  Widget build(BuildContext context) {
    return tumdersler.length > 0
        ? ListView.builder(
            itemCount: tumdersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                key: UniqueKey(),
                child: Card(
                  child: ListTile(
                    title: Text(tumdersler[index].dersAdi),
                    subtitle: Text(
                        'Ders Kredisi: ${tumdersler[index].dersKredisi}, Ders Notu: ${tumdersler[index].dersNotu}'),
                    leading: CircleAvatar(
                        backgroundColor: Sabitler.AnaRenk,
                        child: Text(
                          (tumdersler[index].dersKredisi *
                                  tumdersler[index].dersNotu)
                              .toStringAsFixed(0),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
              child: Text(
                'Ders Giriniz',
                style: Sabitler.baslikstili,
              ),
            ),
          );
  }
}
