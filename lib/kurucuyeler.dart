import 'package:abilar/yardimcilar/kurucukart.dart';
import 'package:flutter/material.dart';

List<String> kurucular = [
  "Emre Karaca",
  "Damla Karaca",
  "Yunus Karaca",
  "Mücahit Karaca",
  "Seniha Karaca",
  "Hüseyin Karaca",
];

class KurucUyeler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kurucu Üyeler'),
      ),
      body: Padding(
        padding: EdgeInsets.all(33.0),
        child: ListView.builder(
          itemCount: kurucular.length,
          itemBuilder: (BuildContext context, int pozisyon) {
            return KurucuKart(
              kurucu: kurucular[pozisyon],
            );
          },
        ),
      ),
    );
  }
}
