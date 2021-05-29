import 'package:abilar/yardimcilar/modeller.dart';
import 'package:http/http.dart' as http;

abstract class Islemler {
  List<SlaytModeli> slaytlar;
  Future<bool> istek();
  String veriler;
  Map<String, String> duyuru;
  List<AnaKart> kartlar;
}

class IslemDetay implements Islemler {
  @override
  List<SlaytModeli> slaytlar = List();

  @override
  String veriler;

  @override
  Map<String, String> duyuru = {};

  @override
  List<AnaKart> kartlar = List();

  @override
  Future<bool> istek() async {
    slaytlar = [];
    kartlar = [];
    await http.get('https://abilar.org/').then((gelenVeri) {
      veriler = gelenVeri.body
          .replaceAll('\n', '')
          .replaceAll('\t', '')
          .replaceAll('  ', '');

      RegExp slaytlaribul =
          new RegExp('<ul aria-live="polite" class="slides">(.*?)</ul>');
      Match slayteslesme = slaytlaribul.firstMatch(veriler);
      String slaythtml = slayteslesme.group(1);

      RegExp slaytbul =
          new RegExp('<li(.*?)>(.*?)<img src="(.*?)" height(.*?)>(.*?)</li>');
      Iterable<Match> eslesenslaytlar = slaytbul.allMatches(slaythtml);

      for (Match eslesenslayt in eslesenslaytlar) {
        String sresim = eslesenslayt.group(3) ??
            'https://abilar.org/wp-content/uploads/2019/11/ozetkitap-1280x550.jpg';
        String slink = '';

        if (eslesenslayt.group(2) != '') {
          slink = new RegExp('<a href="(.*?)" target="(.*?)">')
              .firstMatch(eslesenslayt.group(2))
              .group(1);
        }
        slaytlar.add(new SlaytModeli(sresim, slink));
      }

      RegExp duyurudeseni = new RegExp(
          '<div class="widget_text widget widget-welcome widget_custom_html clearfix" id="custom_html-2">(.*?)<div class="textwidget custom-html-widget"> <a href="(.*?)">(.*?)</a></div></div>');
      Match eslesenduyuru = duyurudeseni.firstMatch(veriler);
      duyuru['duyuru'] = eslesenduyuru.group(3) ?? 'duyuru bulunumadı';
      duyuru['link'] = eslesenduyuru.group(2) ?? 'http://ajit-e.org/';

      RegExp kartlardeseni = new RegExp(
          '<ul class="ilovewp-featured-pages-list clearfix">(.*?)</ul><!-- .ilovewp-featured-pages-list .clearfix -->');
      Match eslesenkartlar = kartlardeseni.firstMatch(veriler);
      String kartverileri = eslesenkartlar.group(1);

      RegExp kartdeseni = new RegExp(
          '<img(.*?)src="(.*?)" (.*?)</a>(.*?)<h2 class="entry-title"><a href="(.*?)">(.*?)</a></h2><p class="entry-excerpt">(.*?)</p></div><!-- .entry-preview-wrapper .clearfix -->');
      Iterable<Match> eslesenkartlistesi = kartdeseni.allMatches(kartverileri);

      for (Match kart in eslesenkartlistesi) {
        String aresim = kart.group(2);
        String abaslik = kart.group(6);
        String aaciklama = kart.group(7);
        String alink = kart.group(5);

        kartlar.add(AnaKart(aresim, abaslik, aaciklama, alink));
      }
    });
    return true;
  }
}
