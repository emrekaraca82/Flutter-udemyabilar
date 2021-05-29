import 'package:abilar/anasayfa.dart';
import 'package:abilar/atawidget.dart';
import 'package:abilar/iletisim.dart';
import 'package:abilar/kurucuyeler.dart';
import 'package:abilar/tuzuk.dart';
import 'package:abilar/yardimcilar/islemler.dart';
import 'package:abilar/atawidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    AtaWidget(
      islem: IslemDetay(),
      child: AnaGiris(),
    ),
  );
}

class AnaGiris extends StatefulWidget {
  @override
  _AnaGirisState createState() => _AnaGirisState();
}

class _AnaGirisState extends State<AnaGiris> {
  bool _veriVar = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AtaWidget.of(context).islem.istek().then((deger) {
      _veriVar = deger;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2F2C7F),
        accentColor: Colors.indigo,
      ),
      home: Anasayfa(),
      /*_veriVar ? Anasayfa() : Center(child: CircularProgressIndicator()), */
      routes: rotalar,
      debugShowCheckedModeBanner: false,
    );
  }
}

var rotalar = <String, WidgetBuilder>{
  "/anasayfa": (BuildContext context) => Anasayfa(),
  "/iletisim": (BuildContext context) => Iletisim(),
  "/kurucuyeler": (BuildContext context) => KurucUyeler(),
  "/tuzuk": (BuildContext context) => Tuzuk(),
};
