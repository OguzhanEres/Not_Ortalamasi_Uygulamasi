import 'package:flutter/material.dart';
import 'package:not_ortalamasi/helper/data_helper..dart';
import 'package:not_ortalamasi/helper/kredi_data_helper.dart';
import 'package:not_ortalamasi/helper/liste_helper.dart';
import 'package:not_ortalamasi/model/ders.dart';
import 'package:not_ortalamasi/ortalama_yazdirma.dart';
import 'package:not_ortalamasi/sabitler/app_constant.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String? secilendersadi;
  double secilendeger = 4;
  int secilenkredi = 1;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            'Ortalama Hesaplama',
            textAlign: TextAlign.center,
            style: Sabitler.baslikstili,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: OrtalamaYazdir(
                        dersortalama: DataHelper.OrtalamaHesapla(),
                        derssayisi: DataHelper.tumdersler.length)),
              ),
            ],
          ),
          Expanded(
            child: ListeYapisi(
              onDismiss: (index) {
                DataHelper.tumdersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfaler(),
              _buildKrediler(),
              IconButton(
                  onPressed: () {
                    _derseklevehesapla();
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined))
            ],
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          secilendersadi = newValue;
        });
      },
      validator: (value) {
        if (value!.length <= 0) {
          return 'Ders Adı Giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Sabitler.AnaRenk.shade100.withOpacity(0.3),
          labelText: 'Ders İsmi Giriniz',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    );
  }

  _buildHarfaler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Sabitler.AnaRenk.shade100.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30)),
      child: DropdownButton<double>(
        value: secilendeger,
        underline: Container(),
        borderRadius: BorderRadius.circular(30),
        elevation: 5,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (value) {
          setState(() {
            secilendeger = value!;
          });
        },
      ),
    );
  }

  _buildKrediler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Sabitler.AnaRenk.shade100.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30)),
      child: DropdownButton(
        value: secilenkredi,
        underline: Container(),
        borderRadius: BorderRadius.circular(30),
        elevation: 5,
        items: DataHelperKredi.KrediDegerleri(),
        onChanged: (value) {
          setState(() {
            secilenkredi = value!;
          });
        },
      ),
    );
  }

  void _derseklevehesapla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var eklenenDers = Ders(secilendersadi!, secilendeger, secilenkredi);
      DataHelper.dersEkle(eklenenDers);
      setState(() {});
    }
  }
}
