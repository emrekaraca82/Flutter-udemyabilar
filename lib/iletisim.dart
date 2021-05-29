import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iletisim extends StatefulWidget {
  @override
  _IletisimState createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  Completer<GoogleMapController> _haritaHazirlayici =
      Completer<GoogleMapController>();

  Map<MarkerId, Marker> _isaretler = <MarkerId, Marker>{};

  Future _linkeGit(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      debugPrint('ERORR 404');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İletisim'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.maxFinite,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: Set<Marker>.of(_isaretler.values),
              initialCameraPosition: CameraPosition(
                target: LatLng(40.962184, 29.076129),
                zoom: 18.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                final MarkerId isaretId = MarkerId('merkez');
                final Marker isaret = Marker(
                  markerId: isaretId,
                  position: LatLng(40.962184, 29.076129),
                  infoWindow: InfoWindow(
                    title: 'ABA',
                    snippet: 'Akademik Bilişimler Araştırma Derneği',
                    onTap: () {
                      debugPrint('Tıklandı');
                    },
                  ),
                );
                _haritaHazirlayici.complete(controller);
                _isaretler[isaretId] = isaret;
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.home,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      'Suadiye Mah. Kazım Özalp Sok. NO:15 Kat:2  34740 Şaşkınbakkal Kadıköy/İSTANBUL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _linkeGit('tel+02163555619');
                        },
                        child: Icon(
                          FontAwesomeIcons.phone,
                          size: 60,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      '0216 355 56 19',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _linkeGit('mailto:info@abiler.com');
                        },
                        child: Icon(
                          FontAwesomeIcons.envelope,
                          size: 60,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      'info@abiler.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
