import 'package:abilar/atawidget.dart';
import 'package:abilar/yardimcilar/modeller.dart';
import 'package:abilar/yardimcilar/urlac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AnaSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SlaytModeli> slaytlar = AtaWidget.of(context).islem.slaytlar;
    return Swiper(
      itemCount: slaytlar.length,
      itemBuilder: (BuildContext context, int pozisyon) {
        return GestureDetector(
          onTap: () {
            if (slaytlar[pozisyon].slink != '') {
              urlAc(slaytlar[pozisyon].slink);
            }
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(slaytlar[pozisyon].sresim),
                  fit: BoxFit.cover),
            ),
          ),
        );
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      autoplayDisableOnInteraction: true,
      pagination: new SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          activeColor: Colors.deepOrangeAccent,
          space: 10.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
