import 'dart:io';
import 'package:abilar/atawidget.dart';
import 'package:abilar/kartlar/anakartwidget.dart';
import 'package:abilar/parcalar/anaslider.dart';
import 'package:abilar/parcalar/duyuru.dart';
import 'package:abilar/yanmenu.dart';
import 'package:abilar/yardimcilar/modeller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool _veri = false;
  List<AnaKart> kartlar;
  List<Widget> anakartlar;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AtaWidget.of(context).islem.istek().then((cevap) {
      anakartlar = [];
      kartlar = AtaWidget.of(context).islem.kartlar;
      kartlar.forEach((f) {
        anakartlar.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: AnaKartWidget(
              kresim: f.aresim,
              kbaslik: f.abaslik,
              kaciklama: f.aaciklama,
              klink: f.alink,
            ),
          ),
        );
      });
      setState(() {
        _veri = cevap;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffold.currentState.openDrawer();
          },
          tooltip: 'Yan menü aç',
        ),
        title: Text(
          'ABA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _urlAc(Platform.isAndroid
                  ? "market://details?id=com.uygulama.abiler"
                  : "items-apps://itunes.apple.com/us/app/id123412312");
            },
            icon: Icon(
              Icons.star,
            ),
            tooltip: 'Puan Ver',
          ),
          IconButton(
            onPressed: () {
              Share.share(
                """ABA Mobil Uygulamamızı indirdiniz mi
              Android: https://play.google.com/store/apps/details?id=com.uygulama.abiler
              İOS:https://itunes.apple.com/us/app/id123412312""",
              );
            },
            icon: Icon(
              Icons.share,
            ),
            tooltip: 'Paylas',
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _veri = false;
              setState(() {});
              AtaWidget.of(context).islem.istek().then((cevap) {
                setState(() {
                  _veri = cevap;
                });
              });
            },
          ),
        ],
      ),
      body: _veri
          ? Center(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/logo.png'),
                    Container(
                      height: 200.0,
                      width: double.maxFinite,
                      child: AnaSlider(),
                    ),
                    Duyuru(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: anakartlar),
                    ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
      drawer: YanMenu(),
    );
  }
}

Future _urlAc(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('ERORR 404');
  }
}
