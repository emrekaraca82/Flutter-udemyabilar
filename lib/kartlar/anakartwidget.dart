import 'package:abilar/yardimcilar/urlac.dart';
import 'package:flutter/material.dart';

class AnaKartWidget extends StatelessWidget {
  final String kresim, kbaslik, kaciklama, klink;

  const AnaKartWidget({
    Key key,
    this.kresim,
    this.kbaslik,
    this.kaciklama,
    this.klink,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        urlAc(klink);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.network(kresim),
            Container(
              padding: EdgeInsets.all(12.0),
              color: Color(0xFFF8F6F2),
              child: Column(
                children: <Widget>[
                  Text(
                    kbaslik,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.deepOrangeAccent),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    kaciklama,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
