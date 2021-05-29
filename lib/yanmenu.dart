import 'package:abilar/yardimcilar/urlac.dart';
import 'package:flutter/material.dart';

class YanMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.blueGrey.shade50,
              child: Image.asset('assets/logo.png'),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.all_inclusive),
                  title: Text('AJİT-E'),
                  onTap: () {
                    Navigator.pop(context);
                    urlAc('http://ajit-e.org/');
                  },
                ),
                Divider(
                  height: 1.0,
                  color: Colors.blueGrey,
                ),
                ListTile(
                  leading: Icon(Icons.airplay),
                  title: Text('HABERLER'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  height: 1.0,
                  color: Colors.blueGrey,
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('ETKİNLİKLER'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  height: 1.0,
                  color: Colors.blueGrey,
                ),
                ExpansionTile(
                  leading: Icon(Icons.account_box),
                  title: Text('HAKKIMIZDA'),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        leading: Icon(Icons.supervised_user_circle),
                        title: Text('KURUCU ÜYELER'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/kurucuyeler');
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        leading: Icon(Icons.rate_review),
                        title: Text('TÜZÜK'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/tuzuk');
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1.0,
                  color: Colors.blueGrey,
                ),
                ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text('İLETİŞİM'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/iletisim');
                  },
                ),
                Divider(
                  height: 1.0,
                  color: Colors.blueGrey,
                ),
                Container(
                  color: Color(0xFF2F2C7F),
                  child: ListTile(
                    leading: Icon(
                      Icons.grain,
                      color: Colors.white,
                    ),
                    title: Text(
                      'ICTS 2018',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      urlAc('https://abilar.org/ictc/');
                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
