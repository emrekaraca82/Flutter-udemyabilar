import 'package:abilar/atawidget.dart';
import 'package:abilar/yardimcilar/urlac.dart';
import 'package:flutter/material.dart';

class Duyuru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map duyuru = AtaWidget.of(context).islem.duyuru;
    return InkWell(
      onTap: () {
        urlAc(duyuru['link']);
      },
      child: Container(
        width: double.maxFinite,
        color: Colors.indigo,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(20.0),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(3.0),
          child: Container(
            padding: EdgeInsets.all(22.0),
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'DUYURU',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20.0),
                Text(
                  duyuru['duyuru'],
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
