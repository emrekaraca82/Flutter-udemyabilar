import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class Tuzuk extends StatefulWidget {
  @override
  _TuzukState createState() => _TuzukState();
}

class _TuzukState extends State<Tuzuk> {
  String _htmlVeri = '';

  @override
  initState() {
    super.initState();
    _istek();
  }

  Future _istek() async {
    _htmlVeri = '';
    setState(() {});
    await http.get('https://abilar.org/hakkimizda/tuzuk/').then((gelenVeri) {
      _htmlVeri = gelenVeri.body
          .replaceAll('\n', '')
          .replaceAll('\t', '')
          .replaceAll('  ', '');

      RegExp arama = new RegExp(
          '<div class="site-column site-column-content">(.*?)<!-- .site-column-wrapper .clearfix --></div>');
      Match eslesen = arama.firstMatch(_htmlVeri);
      _htmlVeri = eslesen.group(1);

      debugPrint(_htmlVeri);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tüzük'),
      ),
      body: Center(
        child: _htmlVeri.length > 0
            ? SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Html(
                    data: _htmlVeri,
                  ),
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
