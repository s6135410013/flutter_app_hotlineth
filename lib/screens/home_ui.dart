import 'package:flutter/material.dart';
import 'package:flutter_app_hotline/models/hotline_data.dart';
import 'package:flutter_app_hotline/screens/bank_line_ui.dart';
import 'package:flutter_app_hotline/screens/emergency_page.dart';
import 'package:flutter_app_hotline/screens/internet_provider_ui.dart';
import 'package:flutter_app_hotline/screens/utilities_etc_ui.dart';
import 'package:flutter_app_hotline/screens/utilities_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUI extends StatefulWidget {
  // const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //Hotline model
  List<Hotlinedata> hotline_menu = [
    Hotlinedata(
      name: "เหตุฉุกเฉิน",
      mobile: "",
      image: "emergency.png",
    ),
    Hotlinedata(
      name: "ไฟดับ/น้ำไม่ไหล",
      mobile: "",
      image: "utilities.png",
    ),
    Hotlinedata(
      name: "หน่วยงานต่าง ๆ",
      mobile: "",
      image: "hotline-etc.png",
    ),
    Hotlinedata(
      name: "ติดต่อธนาคาร",
      mobile: "",
      image: "bank.png",
    ),
    Hotlinedata(
      name: "บริการโทรศัพท์และอินเตอร์เน็ต",
      mobile: "",
      image: "internet_provider.png",
    ),
  ];
  List screens = [
    EmergencyUI(),
    UtilitiesUI(),
    UtilitiesETCUI(),
    BankLineUI(),
    InternetProviderUI(),
  ];
  late Position userLocation;
  int x = 1;
  String b = '';
  late GoogleMapController mapController;
  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      x = 0;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "สายด่วน",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bg2.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: FutureBuilder(
              future: _getLocation(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 480,
                      ),
                      Text(
                        "ข้อมูลที่อยู่",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "กดปุ่มเพื่อแสดงพิกัดปัจจุบัน",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 6,
                          fixedSize: Size(200, 80),
                        ),
                        onPressed: () {
                          _getLocation();
                          _launchMapsUrl(
                            userLocation.latitude,
                            userLocation.longitude,
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          size: 25,
                          color: Colors.redAccent,
                        ),
                        label: Text(
                          "เปิดตำแหน่ง",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Text('${userLocation.latitude}, ${userLocation.longitude}'),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.only(
                bottom: 13,
                top: 15,
                left: 20,
                right: 15,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return screens[index];
                }));
              },
              leading: Image.asset(
                "assets/images/" + hotline_menu[index].image,
              ),
              title: Text(
                hotline_menu[index].name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: InkWell(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: Colors.tealAccent[700],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 10,
              color: Colors.black,
            );
          },
          itemCount: hotline_menu.length),
      bottomNavigationBar: BottomAppBar(
        child: Text(
          "\n" + "\n",
        ),
        color: Colors.teal[600],
      ),
    );
  }
}
